// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeaEntryAdapter extends TypeAdapter<TeaEntry> {
  @override
  final int typeId = 0;

  @override
  TeaEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeaEntry(
      date: fields[0] as DateTime,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TeaEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeaEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WaterEntryAdapter extends TypeAdapter<WaterEntry> {
  @override
  final int typeId = 1;

  @override
  WaterEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterEntry(
      date: fields[0] as DateTime,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WaterEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExpenseEntryAdapter extends TypeAdapter<ExpenseEntry> {
  @override
  final int typeId = 2;

  @override
  ExpenseEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseEntry(
      date: fields[0] as DateTime,
      price: fields[1] as double,
      reason: fields[2] as String,
      note: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.reason)
      ..writeByte(3)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdvanceEntryAdapter extends TypeAdapter<AdvanceEntry> {
  @override
  final int typeId = 3;

  @override
  AdvanceEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdvanceEntry(
      date: fields[0] as DateTime,
      amount: fields[1] as double,
      purpose: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdvanceEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.purpose);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvanceEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
