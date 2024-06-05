import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../constants/colorsconstants.dart';
import '../../../constants/font_manager.dart';

class AddProductsWidgets extends StatelessWidget {
  const AddProductsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: DottedBorder(
          color: Mycolors.primarycolor,
          borderType: BorderType.RRect,
          radius: const Radius.circular(4),
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Mycolors.primarycolor,
                      size: MyFonts.size87,
                    ),
                  ],
                ),
                Text('Add Products',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Mycolors.primarycolor))
              ],
            ),
          ),
        ),
      );
    });
  }
}
