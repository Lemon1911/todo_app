import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/network_layer/firestore_utils.dart';
import 'package:todo_app/model/task_model.dart';

import '../moduls/widgets/custom_text_form_filed.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.black,
              ),
            ),
            CustomTextFormFiled(
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must have title";
                } else if (value.length < 5) {
                  return "must have more than 5 car";
                } else {
                  return null;
                }
              },
              title: "Enter your task title",
              controller: titleController,
            ),
            CustomTextFormFiled(
                maxLines: 3,
                title: "Enter your task description",
                controller: descriptionController),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add New Task",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showCalendar(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedDate),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  var model = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    dateTime: DateTime.now(),
                    isDone: false,
                  );
                  await FirestoreUtils.addDataToFirestore(model);
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Add Task",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalendar(context) async {
    var dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(
          days: 365,
        ),
      ),
    );
    if (dateSelected == null) return null;
    selectedDate = dateSelected;
    setState(() {});
  }
}
