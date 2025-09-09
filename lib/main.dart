import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/models.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Adapters
  Hive.registerAdapter(TeaEntryAdapter());
  Hive.registerAdapter(WaterEntryAdapter());
  Hive.registerAdapter(ExpenseEntryAdapter());
  Hive.registerAdapter(AdvanceEntryAdapter());
  
  // Open boxes
  await Hive.openBox<TeaEntry>('tea_entries');
  await Hive.openBox<WaterEntry>('water_entries');
  await Hive.openBox<ExpenseEntry>('expense_entries');
  await Hive.openBox<AdvanceEntry>('advance_entries');
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Office Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}