import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

class ExpandedContainer extends StatelessWidget {
  const ExpandedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return AnimatedContainer(
        height: controller.isExpand.value ? height * .135 : height * .08,
        duration: const Duration(milliseconds: 500),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    controller.setIsExpand();
                  },
                  icon: Icon(
                      controller.isExpand.value
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 50,
                      color: Mycolors.primarycolor)),
              controller.isExpand.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                RowChip(
                                    title: 'ITEMS: ',
                                    trailing: '${12.toInt()}'),
                                RowChip(
                                    title: 'DELIVERY CHARGES: ',
                                    trailing: '${14.toInt()}'),
                                RowChip(
                                    title: 'SERVICE CHARGES: ',
                                    trailing: '${17.toInt()}'),
                              ],
                            ),
                          ),
                        ),
                        padding10,
                        Container(
                          height: height * .1,
                          width: 2,
                          color: Colors.grey,
                        ),
                        padding10,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                RowChip(
                                    title: 'TAX: ', trailing: '${6.toInt()}'),
                                RowChip(
                                    title: 'SUB TOTAL: ',
                                    trailing: '${34.toInt()}'),
                                RowChip(
                                    title: 'DISCOUNTS: ',
                                    trailing: '${5.toInt()}'),
                              ],
                            ),
                          ),
                        ),
                        padding10,
                      ],
                    )
                  : Row(
                      children: [
                        padding10,
                        Expanded(
                          child: RowChips(
                              title: 'OverView: ',
                              subtitle: 'Total Items ${7.toInt()}',
                              trailing: 'Total: £${4}'),
                        ),
                        padding10
                      ],
                    ),
            ],
          ),
        ),
        // child: Row(
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               'Quantity:',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: height * .025,
        //                 color: ColorHelper.hashColor(
        //                     colorManager.bodyTextColor ?? '0xffFFFFFF'),
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               'Items ${sum.toInt()}',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: height * .025,
        //                 color: ColorHelper.hashColor(
        //                     colorManager.bodyTextColor ?? '0xffFFFFFF'),
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               'Sub total: ',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: height * .030,
        //                 fontWeight: FontWeight.bold,
        //                 color: ColorHelper.hashColor(
        //                     colorManager.bodyTextColor ?? '0xffFFFFFF'),
        //               ),
        //             ),
        //             Text(
        //               ' £${basketResult.totalAmount}',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: height * .030,
        //                 color: ColorHelper.hashColor(
        //                     colorManager.bodyButtonColor ?? '0xffFFFFFF'),
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ],
        //         ),
        //         // Obx(() {
        //         //   return DiscountCoupon(
        //         //     discount: '${_discountController.discountAmount.value}',
        //         //     onPressed: () {
        //         //       showDialog(
        //         //           context: context,
        //         //           barrierColor: Colors.transparent,
        //         //           builder: (context) {
        //         //             return Dialog(
        //         //               child: Container(
        //         //                   margin: const EdgeInsets.all(0),
        //         //                   width: MediaQuery.of(context).size.width * 0.45,
        //         //                   height: MediaQuery.of(context).size.width * 0.4,
        //         //                   decoration: BoxDecoration(
        //         //                     borderRadius: BorderRadius.circular(30),
        //         //                     color: const Color(0xffF5F5F5),
        //         //                     border: Border.all(
        //         //                         color: Colors.grey.shade600, width: 1.8),
        //         //                   ),
        //         //                   child: Container(
        //         //                       margin: const EdgeInsets.all(10),
        //         //                       decoration: BoxDecoration(
        //         //                         borderRadius: BorderRadius.circular(30),
        //         //                         color: Colors.white,
        //         //                       ),
        //         //                       child: Stack(
        //         //                         children: [
        //         //                           const Padding(
        //         //                             padding: EdgeInsets.only(top: 50),
        //         //                             child: DiscountsViewBody(),
        //         //                           ),
        //         //                           Positioned(
        //         //                             right: 10,
        //         //                             child: IconButton(
        //         //                                 onPressed: () {
        //         //                                   Get.back();
        //         //                                 },
        //         //                                 icon: const Icon(
        //         //                                   Icons.close,
        //         //                                   size: 30,
        //         //                                 )),
        //         //                           ),
        //         //                         ],
        //         //                       ))),
        //         //             );
        //         //           });
        //         //     },
        //         //     colorManager: colorManager,
        //         //   );
        //         // }),
        //         const CommonVerticalSpacer(),
        //       ],
        //     ),
        //   ],
        // ),
      );
    });
  }
}

class RowChip extends StatelessWidget {
  const RowChip(
      {super.key, required this.title, this.subtitle, required this.trailing});

  final String title;
  final String? subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: screenSize.height * .012,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        subtitle != null
            ? Text(
                subtitle ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.height * .020,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
        Text(
          trailing,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Mycolors.primarycolor,
            fontWeight: FontWeight.w600,
            fontSize: screenSize.height * .020,
          ),
        )
      ],
    );
  }
}

class RowChips extends StatelessWidget {
  const RowChips(
      {super.key, required this.title, this.subtitle, required this.trailing});

  final String title;
  final String? subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subtitle != null
            ? Text(
                subtitle ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.height * .020,
                  color: Mycolors.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
        Text(
          trailing,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Mycolors.primarycolor,
            fontWeight: FontWeight.w600,
            fontSize: screenSize.height * .020,
          ),
        )
      ],
    );
  }
}
