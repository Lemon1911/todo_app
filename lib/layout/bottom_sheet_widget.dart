import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({super.key});

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
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
          TextFormField(
            controller: titleController,
            onChanged: (String value) {},
            decoration: InputDecoration(
              hintText: "Enter your task title",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your task description",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Task",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                "5 oct 2023",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Add Task",
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
