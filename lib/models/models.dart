import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class TeaEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int quantity;

  TeaEntry({required this.date, required this.quantity});

  double get price => quantity * 8.0;
}

@HiveType(typeId: 1)
class WaterEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int quantity;

  WaterEntry({required this.date, required this.quantity});

  double get price => quantity * 60.0;
}

@HiveType(typeId: 2)
class ExpenseEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double price;

  @HiveField(2)
  String reason;

  @HiveField(3)
  String note;

  ExpenseEntry({
    required this.date,
    required this.price,
    required this.reason,
    required this.note,
  });
}

@HiveType(typeId: 3)
class AdvanceEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String purpose;

  AdvanceEntry({
    required this.date,
    required this.amount,
    required this.purpose,
  });
}
