import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';

class SelectModeWidget extends StatelessWidget {
  const SelectModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
            color: Mycolors.backgroundcolor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Orders', 'Dining']
              .map((e) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.setselectedmode(e);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            color: controller.modeselected.value == e
                                ? Mycolors.primarycolor.withOpacity(0.50)
                                : Mycolors.backgroundcolor,
                            borderRadius: BorderRadius.circular(12)),
                        height: 55,
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: controller.modeselected.value == e
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
    });
  }
}
