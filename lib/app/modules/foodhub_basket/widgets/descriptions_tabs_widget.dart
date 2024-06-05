import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';

class DescriptionTabWidget extends StatelessWidget {
  const DescriptionTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: ['Items', 'Qty', 'Price', '']
            .map((e) => Expanded(
                flex: e == 'Items'
                    ? 3
                    : e == 'Qty'
                        ? 2
                        : 1,
                child: SizedBox(
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          e,
                          style: TextStyle(
                              fontSize: 18,
                              color: Mycolors.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )))
            .toList());
  }
}
