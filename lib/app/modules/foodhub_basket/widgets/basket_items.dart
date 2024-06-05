import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

class BasketItemsWidget extends StatefulWidget {
  const BasketItemsWidget({super.key});

  @override
  State<BasketItemsWidget> createState() => _BasketItemsWidgetState();
}

class _BasketItemsWidgetState extends State<BasketItemsWidget> {
  ScrollController scrollController = ScrollController();
  void scrollToIndex(int index) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
            color: Mycolors.backgroundcolor,
            borderRadius: BorderRadius.circular(12)),
        child: controller.basketfoodsList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/noitem.png'),
                  const Center(
                    child: Text(
                      'Add an Item',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Add an Item from the Products List page',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: controller.basketfoodsList.length,
                          itemBuilder: (context, index) {
                            bool isselected =
                                controller.isselectedcartItemList[index] ==
                                    true;
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: isselected ? 2 : 8,
                                  right: isselected ? 2 : 8),
                              child: GestureDetector(
                                onTap: () {
                                  controller.setselecteditem(index);
                                  scrollToIndex(index);
                                },
                                child: SizedBox(
                                  height: isselected ? null : 50,
                                  child: isselected
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: Mycolors.primarycolor
                                                  .withOpacity(0.50),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    children: [0, 1, 2, 3]
                                                        .map((e) =>
                                                            tablewidgetRender(
                                                                e,
                                                                index,
                                                                isselected))
                                                        .toList()),
                                                SelectedItemManageWidget(
                                                  index: index,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Row(
                                          children: [0, 1, 2, 3]
                                              .map((e) => tablewidgetRender(
                                                  e, index, isselected))
                                              .toList()),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}

Widget tablewidgetRender(int widgetposition, int index, bool iselected) {
  // ignore: prefer_typing_uninitialized_variables
  var widgets;
  switch (widgetposition) {
    case 0:
      widgets = Expanded(flex: 3, child: ItemsDetails(index: index));
    case 1:
      widgets = Expanded(
          flex: iselected ? 3 : 2, child: QuantityDetails(index: index));
    case 2:
      widgets =
          Expanded(flex: iselected ? 2 : 1, child: PriceDetails(index: index));
    case 3:
      widgets = Expanded(flex: 1, child: ActionDetails(index: index));
  }
  return widgets;
}

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      bool isselected = controller.isselectedcartItemList[index] == true;
      return SizedBox(
          height: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.basketfoodsList[index].name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: isselected ? Colors.white : Colors.black),
              ),
              Text(
                'Price: \$${controller.basketfoodsList[index].amount}',
                style: TextStyle(
                    fontSize: 15,
                    color: isselected ? Colors.white : Mycolors.primarycolor),
              )
            ],
          ));
    });
  }
}

class QuantityDetails extends StatelessWidget {
  const QuantityDetails({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      bool isselected = controller.isselectedcartItemList[index] == true;
      return Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child:
                  //  controller.isselectedcartItemList[index] == false
                  //     ?
                  isselected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            SizedBox(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.basketfoodsList[index]
                                          .quantity = controller
                                              .basketfoodsList[index].quantity -
                                          1;
                                      if (controller.basketfoodsList[index]
                                              .quantity ==
                                          0) {
                                        if (controller.selectedItemforModifiers
                                                .value ==
                                            controller
                                                .basketfoodsList[index].name) {
                                          controller.modifiersList.clear();
                                          controller.selectedItemforModifiers
                                              .value = '';
                                          controller.selectmodifiers.value =
                                              false;
                                        }
                                        controller.basketfoodsList[index]
                                            .quantity = 1;
                                        controller.basketfoodsList
                                            .removeAt(index);
                                        controller.setbasketlistselectedFalse();
                                      }
                                      controller.update();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Mycolors.primarycolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  padding5,
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 40,
                                    width: 50,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          controller
                                              .basketfoodsList[index].quantity
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Mycolors.primarycolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  padding5,
                                  GestureDetector(
                                    onTap: () {
                                      controller.basketfoodsList[index]
                                          .quantity = controller
                                              .basketfoodsList[index].quantity +
                                          1;
                                      1;
                                      controller.update();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Mycolors.primarycolor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              padding16,
                              Center(
                                child: Text(
                                  controller.basketfoodsList[index].quantity
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: isselected
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
              // :
              // Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         color: Mycolors.primarycolor),
              //     height: 40,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         IconButton(
              //             onPressed: () {
              //               controller.basketfoodsList[index].quantity =
              //                   controller.basketfoodsList[index].quantity -
              //                       1;
              //               if (controller.basketfoodsList[index].quantity ==
              //                   0) {
              //                 controller.basketfoodsList[index].quantity = 1;
              //                 controller.basketfoodsList.removeAt(index);
              //               }
              //               controller.update();
              //             },
              //             icon: const Icon(
              //               Icons.remove,
              //               color: Colors.white,
              //             )),
              //         Text(
              //           controller.basketfoodsList[index].quantity.toString(),
              //           style: const TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.white),
              //         ),
              //         IconButton(
              //             onPressed: () {
              //               controller.basketfoodsList[index].quantity =
              //                   controller.basketfoodsList[index].quantity +
              //                       1;
              //               1;
              //               controller.update();
              //             },
              //             icon: const Icon(
              //               Icons.add,
              //               size: 15,
              //               color: Colors.white,
              //             )),
              //       ],
              //     ),
              //   ),
              ),
        ],
      );
    });
  }
}

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      bool isselected = controller.isselectedcartItemList[index] == true;

      return SizedBox(
        child: Center(
          child: Text(
            '\$${controller.basketfoodsList[index].totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isselected ? Colors.white : Colors.black),
          ),
        ),
      );
    });
  }
}

class ActionDetails extends StatelessWidget {
  const ActionDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      bool isselected = controller.isselectedcartItemList[index] == true;
      return isselected
          ? SizedBox(
              child: GestureDetector(
                onTap: () {
                  if (controller.selectedItemforModifiers.value ==
                      controller.basketfoodsList[index].name) {
                    controller.modifiersList.clear();
                    controller.selectedItemforModifiers.value = '';
                    controller.selectmodifiers.value = false;
                  }
                  for (var element
                      in controller.basketfoodsList[index].modifierList!) {
                    element.qunatity = 1;
                  }
                  controller.basketfoodsList[index].quantity = 1;
                  controller.basketfoodsList.removeAt(index);
                  controller.setbasketlistselectedFalse();

                  controller.update();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.cancel,
                      color: Mycolors.primarycolor,
                    ),
                  ),
                ),
              ),
            )
          : Container();
    });
  }
}

class SelectedItemManageWidget extends StatelessWidget {
  const SelectedItemManageWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Wrap(
        direction: Axis.horizontal,
        spacing: 8.0, // Space between the children
        runSpacing: 8.0, // Space between the lines
        children: controller.basketfoodsList[index].modifierList!
            .map(
              (e) => GestureDetector(
                onTap: () {
                  _showAnimatedDialog(context, index);
                },
                child: Container(
                    height: 40,
                    width: 240,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${e.qunatity} X \$${e.amount}',
                            style: TextStyle(
                                color: Mycolors.primarycolor, fontSize: 16),
                          ),
                          Text(
                            e.name,
                            style: TextStyle(
                                color: Mycolors.primarycolor, fontSize: 16),
                          )
                        ],
                      ),
                    )),
              ),
            )
            .toList(),
      );
    });
  }

  Future<void> _showAnimatedDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return GetBuilder<FoodhubMainController>(builder: (controller) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: 700.0,
                height: 800.0,
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text(
                      'Cart Item Manage',
                      style: TextStyle(
                          color: Mycolors.primarycolor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    padding10,
                    Row(
                      children: [
                        SizedBox(
                          height: 110,
                          width: 130,
                          child: Image.asset('images/pizza.png'),
                        ),
                        const Expanded(
                            child: SizedBox(
                          child: ListTile(
                            title: Text(
                              'Sandwich 04',
                              style: TextStyle(fontSize: 22),
                            ),
                            subtitle: Text('Price : 3478'),
                          ),
                        )),
                        const Column(
                          children: [
                            Text(
                              'Qty: 3',
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              'Total Price: \$3678',
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Additional Note',
                          style: TextStyle(
                              color: Mycolors.primarycolor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              size: 30,
                            ))
                      ],
                    ),
                    const Text(
                        'Most databases, text processing functions and data transfer protocols default to the English alphabet. Testing software applications with only English looking text, like Lorem Ipsum, may not reveal potential mismatches between different parts of the application or ensure that the font can display all necessary characters. Additionally, in todays globalized world, it is likely that your application will be used by people from different countries and languages. Even if you designed your application to be English-only, users with names from other languages may want their names to be displayed properly.'),
                    padding10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: TextStyle(
                              color: Mycolors.primarycolor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ))
                      ],
                    ),
                    padding10,
                    Text(
                      'Md Display Level Group',
                      style: TextStyle(
                          color: Mycolors.primarycolor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        itemCount: controller
                            .basketfoodsList[index].modifierList!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, indexx) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Mycolors.backgroundcolor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        tileColor: Mycolors.backgroundcolor,
                                        leading: Text(
                                          '${controller.basketfoodsList[index].modifierList![indexx].qunatity.toString()} X',
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                        title: Text(controller
                                            .basketfoodsList[index]
                                            .modifierList![indexx]
                                            .name),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .basketfoodsList[index]
                                                  .modifierList![indexx]
                                                  .qunatity = controller
                                                      .basketfoodsList[index]
                                                      .modifierList![indexx]
                                                      .qunatity -
                                                  1;
                                              if (controller
                                                      .basketfoodsList[index]
                                                      .modifierList![indexx]
                                                      .qunatity ==
                                                  0) {
                                                controller
                                                    .basketfoodsList[index]
                                                    .modifierList![indexx]
                                                    .qunatity = 1;

                                                controller
                                                    .basketfoodsList[index]
                                                    .modifierList!
                                                    .removeAt(indexx);
                                              }
                                              controller.update();
                                              // if (controller.basketfoodsList[index]
                                              //         .quantity ==
                                              //     0) {
                                              //   if (controller.selectedItemforModifiers
                                              //           .value ==
                                              //       controller
                                              //           .basketfoodsList[index].name) {
                                              //     controller.modifiersList.clear();
                                              //     controller.selectedItemforModifiers
                                              //         .value = '';
                                              //     controller.selectmodifiers.value =
                                              //         false;
                                              //   }
                                              //   controller.basketfoodsList[index]
                                              //       .quantity = 1;
                                              //   controller.basketfoodsList
                                              //       .removeAt(index);
                                              //   controller.setbasketlistselectedFalse();
                                              // }
                                              // controller.update();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Mycolors.primarycolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          padding5,
                                          padding5,
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .basketfoodsList[index]
                                                  .modifierList![indexx]
                                                  .qunatity = controller
                                                      .basketfoodsList[index]
                                                      .modifierList![indexx]
                                                      .qunatity +
                                                  1;
                                              controller.update();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Mycolors.primarycolor,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          });
        });
      },
    );
  }
}
