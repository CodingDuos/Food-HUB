import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/modules/foodhub_basket/widgets/basket_items.dart';
import 'package:foodhub/app/modules/foodhub_basket/widgets/expandedcontainer.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';

import 'package:get/get.dart';

import '../widgets/add_widgets.dart';
import '../widgets/checkout_button_widget.dart';
import '../widgets/customer_information_widget.dart';
import '../widgets/descriptions_tabs_widget.dart';
import '../widgets/select_mode_widget.dart';

class FoodhubBasketView extends GetView<FoodhubMainController> {
  const FoodhubBasketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FoodHubBasketBodyView());
  }
}

class FoodHubBasketBodyView extends StatelessWidget {
  const FoodHubBasketBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                const CustomerInformationWidget(),
                const SelectModeWidget(),
                padding10,
                const DescriptionTabWidget(),
                padding10,
                Expanded(
                    flex: controller.isExpand.value == true ? 7 : 6,
                    child: const BasketItemsWidget()),
                Expanded(
                    flex: controller.isExpand.value == true ? 2 : 1,
                    child: const ExpandedContainer()),
                padding10,
                const Expanded(flex: 1, child: AddWidgets()),
                padding10,
                const Expanded(flex: 1, child: CheckOutButtonWidget())
              ],
            ),
          ),
        ),
      );
    });
  }
}
