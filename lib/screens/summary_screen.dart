// lib/screens/summary_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/expense_provider.dart';

class SummaryScreen extends ConsumerWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalTea = ref.watch(totalTeaProvider);
    final totalWater = ref.watch(totalWaterProvider);
    final totalOther = ref.watch(totalOtherProvider);
    final totalExpenses = ref.watch(totalExpensesProvider);
    final totalAdvance = ref.watch(totalAdvanceProvider);
    final remainingBalance = ref.watch(remainingBalanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSummaryCard(
              context,
              'Total Tea Cost',
              '₹${totalTea.toStringAsFixed(2)}',
              Icons.coffee,
              Colors.brown,
            ),
            const SizedBox(height: 12),
            _buildSummaryCard(
              context,
              'Total Water Cost',
              '₹${totalWater.toStringAsFixed(2)}',
              Icons.water_drop,
              Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildSummaryCard(
              context,
              'Total Other Expenses',
              '₹${totalOther.toStringAsFixed(2)}',
              Icons.receipt,
              Colors.orange,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.money_off,
                            color: Colors.red.shade700, size: 32),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Expenses',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Tea + Water + Other',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '₹${totalExpenses.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 4,
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet,
                            color: Colors.green.shade700, size: 32),
                        const SizedBox(width: 12),
                        Text(
                          'Advance Payments',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Text(
                      '₹${totalAdvance.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 8,
              color: remainingBalance >= 0
                  ? Colors.teal.shade50
                  : Colors.deepOrange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      remainingBalance >= 0
                          ? Icons.check_circle
                          : Icons.warning,
                      color: remainingBalance >= 0
                          ? Colors.teal
                          : Colors.deepOrange,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Remaining Balance',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${remainingBalance.toStringAsFixed(2)}',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: remainingBalance >= 0
                                    ? Colors.teal
                                    : Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Advance - Expenses',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (remainingBalance < 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Add more advance payment!',
                          style: TextStyle(
                            color: Colors.deepOrange.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String amount,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              amount,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
