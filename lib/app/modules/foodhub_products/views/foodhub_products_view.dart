import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:foodhub/app/modules/foodhub_products/widgets/modifiers.dart';

import 'package:get/get.dart';

import '../../../commons/manage_categories_dialog.dart';
import '../widgets/products_gridview.dart';

class FoodhubProductsView extends GetView<FoodhubMainController> {
  const FoodhubProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Scaffold(
          key: controller.scaffoldKey,
          drawer: const Drawer(),
          body: const FoodhubProductsViewBody());
    });
  }
}

class FoodhubProductsViewBody extends StatelessWidget {
  const FoodhubProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        padding10,
                        IconButton(
                            onPressed: () {
                              controller.callbackConditions();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Mycolors.primarycolor,
                              size: 40,
                            )),
                        Text(
                          'Products',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Mycolors.primarycolor),
                        ),
                        controller.selectedcategoryname.value.isEmpty
                            ? Container()
                            : Text(
                                '/${controller.selectedcategoryname.value}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Mycolors.primarycolor),
                              ),
                        controller.selectedSubcategoryname.value.isEmpty
                            ? Container()
                            : Text(
                                '/${controller.selectedSubcategoryname.value}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Mycolors.primarycolor),
                              ),
                        controller.selectedSubProducts.value.isEmpty
                            ? Container()
                            : Text(
                                '/${controller.selectedSubProducts.value}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Mycolors.primarycolor),
                              ),
                        controller.selectedItemforModifiers.value.isEmpty
                            ? Container()
                            : Text(
                                '/${controller.selectedItemforModifiers.value}/Modifiers',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Mycolors.primarycolor),
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Mycolors.backgroundcolor),
                          width: 400,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.search,
                                        size: 30,
                                      )),
                                  prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.mic,
                                        size: 30,
                                      )),
                                  hintText: 'Search Product',
                                  filled: true,
                                  fillColor: Mycolors.backgroundcolor),
                            ),
                          ),
                        ),
                        padding10,
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const MyDialog();
                                },
                              );
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Mycolors.primarycolor,
                              size: 40,
                            )),
                        padding10,
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Mycolors.primarycolor,
                              size: 40,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: controller.selectmodifiers.value == true
                    ? const ModifiersGridView()
                    : const ProductsGridView()),
            Container(
              height: 100,
            )
          ],
        ),
      );
    });
  }
}
