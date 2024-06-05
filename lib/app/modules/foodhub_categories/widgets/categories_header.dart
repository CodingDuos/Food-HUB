import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../commons/manage_categories_dialog.dart';

class CategoriesHeaderWidget extends StatelessWidget {
  const CategoriesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return ListTile(
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          height: 50,
          width: 50,
          child: Center(
              child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MyDialog();
                },
              );
            },
            icon: const Icon(Icons.edit_outlined),
          )),
        ),
      );
    });
  }
}
