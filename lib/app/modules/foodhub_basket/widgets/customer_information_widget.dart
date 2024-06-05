import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';

class CustomerInformationWidget extends StatelessWidget {
  const CustomerInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Row(
        children: [
          const Expanded(
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number: +443102356372',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Postal Code: 755982',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              title: Text(
                'Instore Customer',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Mycolors.backgroundcolor,
                  borderRadius: BorderRadius.circular(12)),
              height: 80,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'InStore',
                    style: TextStyle(
                        color: Mycolors.primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    color: Mycolors.primarycolor,
                  ),
                ],
              )),
        ],
      );
    });
  }
}
