import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/network_layer/firestore_utils.dart';
import 'package:todo_app/model/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFEC4B4B),
          borderRadius: BorderRadius.circular(15)),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              // An action can be bigger than the others.
              flex: 2,
              onPressed: (context) => () async {
                await FirestoreUtils.deleteDataFromFirestore(taskModel);
              },
              backgroundColor: Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: 130,
          width: 400,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            VerticalDivider(
              thickness: 4,
              color: theme.primaryColor,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskModel.title,
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    taskModel.description,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    const Icon(
                      Icons.alarm,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      taskModel.dateTime.toString(),
                      style: theme.textTheme.bodySmall,
                    )
                  ]),
                ]),
            Container(
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(
                Icons.check,
                size: 32,
                color: Colors.white,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
