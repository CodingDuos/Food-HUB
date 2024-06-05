class ModiefiersModelClass {
  final String name;
  final double amount;
  int qunatity;

  ModiefiersModelClass({
    required this.name,
    required this.qunatity,
    required this.amount,
  });

  double get totalPrice => amount * qunatity;
}
