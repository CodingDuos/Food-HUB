import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';

class CheckOutButtonWidget extends StatelessWidget {
  const CheckOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      final List<String> itemlist = ['Delete', 'Hold', 'Pay '];
      return Row(
        children: [0, 1, 2]
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: e == 0
                            ? Colors.red.shade400
                            : e == 1
                                ? Mycolors.primarycolor.withOpacity(0.50)
                                : Mycolors.primarycolor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        itemlist[e],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}
