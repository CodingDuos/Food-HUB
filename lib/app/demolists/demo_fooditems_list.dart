import 'package:foodhub/app/models/fooditem_model_class.dart';
import 'package:foodhub/app/models/modifier_model_class.dart';

class DemofoodItemslist {
  static final List<FoodItem> foodItemsss = [
    FoodItem(
        name: 'Pizza',
        amount: 0,
        quantity: 1,
        category: 'Healthy',
        modifierList: [],
        subfoodItems: List.generate(
            10,
            (index) => FoodItem(
                name: 'Pizza$index',
                amount: index + 10,
                quantity: 1,
                modifierList: [],
                category: ''))),
    FoodItem(
        name: 'Burger',
        amount: 5.0,
        quantity: 1,
        category: 'Healthy',
        modifierList: [],
        subfoodItems: List.generate(
            10,
            (index) => FoodItem(
                name: 'Burger$index',
                amount: index + 10,
                quantity: 1,
                modifierList: [],
                category: ''))),
    FoodItem(
      name: 'Salad',
      amount: 3.0,
      quantity: 1,
      category: 'Healthy',
      modifierList: List.generate(
          10,
          (index) => ModiefiersModelClass(
              name: 'Ketchup $index', amount: index + 20, qunatity: 1)),
    ),
    FoodItem(
      name: 'Pasta',
      amount: 8.0,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
        name: 'Sandwich',
        amount: 6.0,
        quantity: 1,
        category: 'Snacks',
        modifierList: [],
        subfoodItems: List.generate(
            10,
            (index) => FoodItem(
                name: 'Sandwich$index',
                amount: index + 10,
                quantity: 1,
                modifierList: List.generate(
                    10,
                    (index) => ModiefiersModelClass(
                        qunatity: 1,
                        name: 'Ketchup $index',
                        amount: index + 20)),
                category: ''))),
    FoodItem(
      name: 'Chicken Curry',
      amount: 12.0,
      quantity: 1,
      category: 'Snacks',
      modifierList: [],
    ),
    FoodItem(
      name: 'Fried Rice',
      amount: 9.0,
      quantity: 1,
      category: 'Snacks',
      modifierList: [],
    ),
    FoodItem(
      name: 'Ice Cream',
      amount: 4.0,
      quantity: 1,
      category: 'Snacks',
      modifierList: [],
    ),
    FoodItem(
      name: 'Coffee',
      amount: 2.0,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
      name: 'Tea',
      amount: 1.5,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
      name: 'Sushi',
      amount: 15.0,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
      name: 'Tacos',
      amount: 7.0,
      quantity: 1,
      category: 'Soups',
      modifierList: [],
    ),
    FoodItem(
      name: 'Fries',
      amount: 3.0,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
      name: 'Cheese Cake',
      amount: 8.0,
      quantity: 1,
      category: 'Asian',
      modifierList: [],
    ),
    FoodItem(
      name: 'Smoothie',
      amount: 4.5,
      quantity: 1,
      category: 'Asian',
      modifierList: [],
    ),
    FoodItem(
      name: 'Hot Dog',
      amount: 5.0,
      quantity: 1,
      category: 'Asian',
      modifierList: [],
    ),
    FoodItem(
      name: 'Shrimp Scampi',
      amount: 11.0,
      quantity: 1,
      category: 'Main Course',
      modifierList: [],
    ),
    FoodItem(
      name: 'Cupcake',
      amount: 2.5,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
    FoodItem(
      name: 'Herbal Fish',
      amount: 15,
      quantity: 1,
      category: 'Healthy',
      modifierList: [],
    ),
  ];
}
