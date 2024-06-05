import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          width: 500.0,
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.widthcontroller,
                decoration: InputDecoration(
                  hintText: 'Maximum Category Width',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: controller.itemsrowcontroller,
                decoration: InputDecoration(
                  hintText: 'Items Per Row',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    elevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 200,
                    onPressed: () {
                      int? rows;
                      double? data;

                      if (controller.widthcontroller.text.isNotEmpty) {
                        data = double.parse(
                            controller.widthcontroller.text.trim());
                      }

                      if (controller.itemsrowcontroller.text.isNotEmpty) {
                        rows = int.parse(
                            controller.itemsrowcontroller.text.trim());
                      }

                      if (rows == null) {
                      } else if (data == null) {
                      } else {
                        controller.setCategoriesWidgetSizeWidth(data);
                        controller.setCategoriesItemsPerRow(rows);
                      }
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
