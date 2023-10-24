import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import '../widgets/task_item_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              onDateSelected: (date) => print(date),
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const TaskItemWidget(),
            itemCount: 10,
            padding: const EdgeInsets.only(top: 20),
          ),
        ),
      ],
    );
  }
}
