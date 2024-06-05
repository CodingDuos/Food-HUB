import 'package:foodhub/app/models/modifier_model_class.dart';

class FoodItem {
  final String name;
  final double amount;
  int quantity;
  final String category;
  List<FoodItem>? subfoodItems;
  List<ModiefiersModelClass>? modifierList;

  FoodItem(
      {required this.name,
      required this.amount,
      required this.quantity,
      required this.category,
      this.modifierList,
      this.subfoodItems});

  double get modifiersamount =>
      modifierList!.fold(0.0, (sum, element) => sum + element.totalPrice);

  double get totalPrice => (amount * quantity) + modifiersamount;
}
