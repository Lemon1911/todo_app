import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/network_layer/firestore_utils.dart';
import 'package:todo_app/model/task_model.dart';

import '../widgets/task_item_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: const Alignment(0, 2),
          children: [
            Container(
              height: 180,
              color: theme.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 170,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "To Do List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                selectDate = date;
              },
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: theme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: theme.primaryColor,
              locale: 'en_ISO',
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirestoreUtils.getRealTimeDataFromFirestore(selectDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error.toString()),
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                  )
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: theme.primaryColor),
              );
            }
            var tasksList =
                snapshot.data?.docs.map((element) => element.data()).toList() ??
                    [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    TaskItemWidget(taskModel: tasksList[index]),
                itemCount: tasksList.length,
                padding: const EdgeInsets.only(top: 20),
              ),
            );
          },
        )
      ],
    );
  }
}
