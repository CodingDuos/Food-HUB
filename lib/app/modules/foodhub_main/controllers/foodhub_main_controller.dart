import 'package:flutter/material.dart';
import 'package:foodhub/app/demolists/demo_categories.dart';
import 'package:foodhub/app/demolists/demo_fooditems_list.dart';
import 'package:foodhub/app/models/category_model_class.dart';
import 'package:foodhub/app/models/fooditem_model_class.dart';
import 'package:foodhub/app/models/modifier_model_class.dart';
import 'package:get/get.dart';

class FoodhubMainController extends GetxController {
  //first load of all product items
  @override
  void onInit() {
    filterfooditems('');
    super.onInit();
  }

  //manage modifiers screens & data & variables & add modifiers to basket items
  RxBool selectmodifiers = false.obs;
  RxString selectedItemforModifiers = ''.obs;
  RxList modifiersList = [].obs;
  addmodifierstoBasket(List<FoodItem> foodItems, String targetName,
      void Function(FoodItem) updateCallback) {
    for (var foodItem in foodItems) {
      if (foodItem.name == targetName) {
        updateCallback(foodItem);
        break;
      }
    }
  }

  setModifiersSelect(List<ModiefiersModelClass> list, String itemname) {
    selectmodifiers.value = true;

    selectedItemforModifiers.value = itemname;
    for (var element in list) {
      modifiersList.add(element);
    }

    update();
  }

  //callback condition function calling on back button on product page yo clear all data
  callbackConditions() {
    if (selectmodifiers.value == true) {
      modifiersList.clear();
      selectedItemforModifiers.value = '';
      selectmodifiers.value = false;
    } else if (itemsOfSUbProductsList.isNotEmpty) {
      itemsOfSUbProductsList.clear();
      selectedSubProducts.value = '';
    } else {
      fooditemsofSubcategoryList.clear();
      selectedSubcategoryname.value = '';
    }
    update();
  }

  //manage if sub category contains food items

  List<FoodItem> fooditemsofSubcategoryList = [];
  RxString selectedSubcategoryname = ''.obs;
  setselectedSubcatory(String val) {
    selectedSubcategoryname.value = val;
    if (val.isEmpty) {
      fooditemsofSubcategoryList.clear();
    } else {
      fooditemsofSubcategoryList = foodItemsss
          .where((element) => element.category.toString().contains(val))
          .toList();
    }

    update();
  }

  //manage if sub category contains food items

  List<FoodItem> itemsOfSUbProductsList = [];
  RxString selectedSubProducts = ''.obs;
  setselectedSubProducts(String val, List<FoodItem> list) {
    selectedSubProducts.value = val;
    itemsOfSUbProductsList.clear();

    if (val.isNotEmpty) {
      for (var element in list) {
        itemsOfSUbProductsList.add(element);
      }
    } else {}

    update();
  }

// global key for drawer

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//
  void updateModifersQunatity(List<ModiefiersModelClass> foodItems,
      String targetName, void Function(ModiefiersModelClass) updateCallback) {
    for (var foodItem in foodItems) {
      if (foodItem.name == targetName) {
        updateCallback(foodItem);
        break;
      }
    }
  }

// upadte calling of basket list items
  void updateFoodItem(List<FoodItem> foodItems, String targetName,
      void Function(FoodItem) updateCallback) {
    for (var foodItem in foodItems) {
      if (foodItem.name == targetName) {
        updateCallback(foodItem);
        break;
      }
    }
  }

//basket list
  List<FoodItem> basketfoodsList = [];

  //load food  items from demo list
  final List<FoodItem> foodItemsss = DemofoodItemslist.foodItemsss;
  late List<FoodItem> foodItems = foodItemsss;

//dynamic list for if any caegory contains food items , sub categories both
  List<dynamic> dynamicfoodItems = [];

//filter fooditems products based on categories names and filter if any
//category contains sub category then add item to dynamic list
  filterfooditems(String val) {
    dynamicfoodItems.clear();
    var datalist = categorieslist
        .where((element) => element.parentCategory == val)
        .toList();
    foodItems = foodItemsss
        .where((element) => element.category.toString().contains(val))
        .toList();
    for (var element in datalist) {
      dynamicfoodItems.add(element);
    }
    for (var element in foodItems) {
      dynamicfoodItems.add(element);
    }
    update();
  }

  //texteditingcontrollers for fields of dialog of manage size of categories

  TextEditingController widthcontroller = TextEditingController();
  TextEditingController itemsrowcontroller = TextEditingController();

  // manage selection list boolen for hovering and selections
  late List<bool> isselectedcartItemList =
      List.generate(basketfoodsList.length, (index) => false).toList();

  setbasketlistselected() {
    isselectedcartItemList =
        List.generate(basketfoodsList.length, (index) => false).toList();
    isselectedcartItemList[basketfoodsList.length - 1] = true;
  }

  setbasketlistselectedFalse() {
    isselectedcartItemList =
        List.generate(basketfoodsList.length, (index) => false).toList();
  }

  late List<bool> selectedCategorylist = List.generate(
      categorieslist
          .where((element) => element.parentCategory == '-')
          .toList()
          .length,
      (index) => false).toList();

  RxString selectedcategoryname = ''.obs;

  setselectedcatory(String val) {
    selectedcategoryname.value = val;
    update();
  }

  RxString subselectedcategoryname = ''.obs;

  setSubselectedcatory(String val) {
    subselectedcategoryname.value = val;
    update();
  }

  final List<CategoryModelClass> categorieslist =
      DemoCategoryList.categorieslist;

  setselectCategory(int index) {
    selectedCategorylist = List.filled(
        categorieslist
            .where((element) => element.parentCategory == '')
            .toList()
            .length,
        false);
    selectedCategorylist[index] = true;
    update();
  }

  setselecteditem(int index) {
    isselectedcartItemList =
        List.filled(basketfoodsList.length, false).toList();
    isselectedcartItemList[index] = !isselectedcartItemList[index];
    update();
  }

  final count = 0.obs;
  RxDouble basketwidgetwidth = 570.00.obs;
  RxDouble categorieswidgetwidth = 300.00.obs;
  RxString modeselected = 'Orders'.obs;
  RxInt categoriesPerRowItems = 2.obs;
  RxInt productCrossaxisCount = 0.obs;
  RxDouble productswidgetwidth = 00.00.obs;

  setbasketwidth() {}

  setselectedmode(String val) {
    modeselected.value = val;
    update();
  }

  setCategoriesWidgetSizeWidth(double val) {
    categorieswidgetwidth.value = val;
    update();
  }

  setCategoriesItemsPerRow(int val) {
    categoriesPerRowItems.value = val;
    update();
  }

  setProductsWidgetSizeWidth(double val) {
    productswidgetwidth.value = val;
  }

  int calculateCrossAxisCount(BuildContext context) {
    double itemWidth = 220.0;

    int crossAxisCount = (productswidgetwidth / itemWidth).floor();
    return crossAxisCount > 0 ? crossAxisCount : 1;
  }

  RxBool isExpand = true.obs;

  setIsExpand() {
    isExpand.value = !isExpand.value;
    update();
  }
}
