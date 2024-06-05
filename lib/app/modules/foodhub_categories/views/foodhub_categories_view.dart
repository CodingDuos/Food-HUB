import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/modules/foodhub_categories/widgets/gridview_categories_card.dart';
import 'package:foodhub/app/modules/foodhub_categories/widgets/listview_categories_card.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';

import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';
import '../widgets/categories_header.dart';

class FoodhubCategoriesView extends GetView<FoodhubMainController> {
  const FoodhubCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FoodhubCategoriesViewBody());
  }
}

class FoodhubCategoriesViewBody extends StatelessWidget {
  const FoodhubCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Mycolors.backgroundcolor,
            border: Border.all(color: Colors.black12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              padding20,
              const CategoriesHeaderWidget(),
              controller.categoriesPerRowItems.value == 1
                  ? const ListviewCategoriesCards()
                  : const GridviewCategoriesCards()
            ],
          ),
        ),
      );
    });
  }
}
