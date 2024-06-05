import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';

class AddWidgets extends StatelessWidget {
  const AddWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      final List<String> itemlist = [
        'Misc Product',
        'Print',
        'No Sale',
        'Gratuity'
      ];
      List<IconData> iconslist = [
        Icons.miscellaneous_services,
        Icons.print,
        Icons.sell,
        Icons.tips_and_updates
      ];
      return SizedBox(
        height: 100,
        child: Row(
          children: [0, 1, 2, 3]
              .map((e) => Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Mycolors.backgroundcolor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              iconslist[e],
                              size: 40,
                              color: Mycolors.grey,
                            ),
                          ),
                          Text(
                            itemlist[e],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )))
              .toList(),
        ),
      );
    });
  }
}
