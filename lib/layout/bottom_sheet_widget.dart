import 'package:flutter/material.dart';
import 'package:todo_app/moduls/widgets/custom_text_form_filed.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          key: formKey,
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
              title: "Enter your task title",
              controller: titleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must provide task";
                } else if (value.length < 10) {
                  return "you must provide task";
                } else {
                  return null;
                }
              },
            ),
            CustomTextFormFiled(
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
                    "5 oct 2023",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print(titleController.text);
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

  void showCalendar(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(
          days: 365,
        ),
      ),
    );
  }
}
