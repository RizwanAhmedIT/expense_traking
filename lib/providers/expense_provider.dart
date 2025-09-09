// lib/providers/expense_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';

final teaEntriesProvider = StateNotifierProvider<TeaEntriesNotifier, List<TeaEntry>>((ref) {
  return TeaEntriesNotifier();
});

final waterEntriesProvider = StateNotifierProvider<WaterEntriesNotifier, List<WaterEntry>>((ref) {
  return WaterEntriesNotifier();
});

final expenseEntriesProvider = StateNotifierProvider<ExpenseEntriesNotifier, List<ExpenseEntry>>((ref) {
  return ExpenseEntriesNotifier();
});

final advanceEntriesProvider = StateNotifierProvider<AdvanceEntriesNotifier, List<AdvanceEntry>>((ref) {
  return AdvanceEntriesNotifier();
});

class TeaEntriesNotifier extends StateNotifier<List<TeaEntry>> {
  late Box<TeaEntry> _box;
  
  TeaEntriesNotifier() : super([]) {
    _box = Hive.box<TeaEntry>('tea_entries');
    loadEntries();
  }
  
  void loadEntries() {
    state = _box.values.toList();
  }
  
  Future<void> addEntry(TeaEntry entry) async {
    await _box.add(entry);
    loadEntries();
  }
  
  Future<void> deleteEntry(TeaEntry entry) async {
    await entry.delete();
    loadEntries();
  }
  
  Future<void> updateEntry(TeaEntry entry) async {
    await entry.save();
    loadEntries();
  }
}

class WaterEntriesNotifier extends StateNotifier<List<WaterEntry>> {
  late Box<WaterEntry> _box;
  
  WaterEntriesNotifier() : super([]) {
    _box = Hive.box<WaterEntry>('water_entries');
    loadEntries();
  }
  
  void loadEntries() {
    state = _box.values.toList();
  }
  
  Future<void> addEntry(WaterEntry entry) async {
    await _box.add(entry);
    loadEntries();
  }
  
  Future<void> deleteEntry(WaterEntry entry) async {
    await entry.delete();
    loadEntries();
  }
  
  Future<void> updateEntry(WaterEntry entry) async {
    await entry.save();
    loadEntries();
  }
}

class ExpenseEntriesNotifier extends StateNotifier<List<ExpenseEntry>> {
  late Box<ExpenseEntry> _box;
  
  ExpenseEntriesNotifier() : super([]) {
    _box = Hive.box<ExpenseEntry>('expense_entries');
    loadEntries();
  }
  
  void loadEntries() {
    state = _box.values.toList();
  }
  
  Future<void> addEntry(ExpenseEntry entry) async {
    await _box.add(entry);
    loadEntries();
  }
  
  Future<void> deleteEntry(ExpenseEntry entry) async {
    await entry.delete();
    loadEntries();
  }
  
  Future<void> updateEntry(ExpenseEntry entry) async {
    await entry.save();
    loadEntries();
  }
}

class AdvanceEntriesNotifier extends StateNotifier<List<AdvanceEntry>> {
  late Box<AdvanceEntry> _box;
  
  AdvanceEntriesNotifier() : super([]) {
    _box = Hive.box<AdvanceEntry>('advance_entries');
    loadEntries();
  }
  
  void loadEntries() {
    state = _box.values.toList();
  }
  
  Future<void> addEntry(AdvanceEntry entry) async {
    await _box.add(entry);
    loadEntries();
  }
  
  Future<void> deleteEntry(AdvanceEntry entry) async {
    await entry.delete();
    loadEntries();
  }
  
  Future<void> updateEntry(AdvanceEntry entry) async {
    await entry.save();
    loadEntries();
  }
}
// Calculation providers
final totalTeaProvider = Provider<double>((ref) {
  final teas = ref.watch(teaEntriesProvider);
  return teas.fold(0, (sum, t) => sum + t.price);
});

final totalWaterProvider = Provider<double>((ref) {
  final waters = ref.watch(waterEntriesProvider);
  return waters.fold(0, (sum, w) => sum + w.price);
});

final totalOtherProvider = Provider<double>((ref) {
  final others = ref.watch(expenseEntriesProvider);
  return others.fold(0, (sum, o) => sum + o.price);
});

final totalExpensesProvider = Provider<double>((ref) {
  final tea = ref.watch(totalTeaProvider);
  final water = ref.watch(totalWaterProvider);
  final other = ref.watch(totalOtherProvider);
  return tea + water + other;
});

final totalAdvanceProvider = Provider<double>((ref) {
  final advances = ref.watch(advanceEntriesProvider);
  return advances.fold(0, (sum, a) => sum + a.amount);
});

final remainingBalanceProvider = Provider<double>((ref) {
  final advance = ref.watch(totalAdvanceProvider);
  final expenses = ref.watch(totalExpensesProvider);
  return advance - expenses;
});