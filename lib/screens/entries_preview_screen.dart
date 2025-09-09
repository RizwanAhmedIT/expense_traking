// lib/screens/entries_preview_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';
import '../providers/expense_provider.dart';

class EntriesPreviewScreen extends ConsumerWidget {
  const EntriesPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View Entries'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tea', icon: Icon(Icons.coffee)),
              Tab(text: 'Water', icon: Icon(Icons.water_drop)),
              Tab(text: 'Other', icon: Icon(Icons.receipt)),
              Tab(text: 'Advance', icon: Icon(Icons.payment)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TeaEntriesTab(),
            WaterEntriesTab(),
            OtherEntriesTab(),
            AdvanceEntriesTab(),
          ],
        ),
      ),
    );
  }
}

class TeaEntriesTab extends ConsumerWidget {
  const TeaEntriesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(teaEntriesProvider);
    
    if (entries.isEmpty) {
      return const Center(child: Text('No tea entries yet'));
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Card(
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Icon(Icons.coffee, color: Colors.white),
            ),
            title: Text('${entry.quantity} Tea(s)'),
            subtitle: Text(DateFormat('dd/MM/yyyy').format(entry.date)),
            trailing: Text(
              '₹${entry.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${DateFormat('dd/MM/yyyy').format(entry.date)}'),
                        Text('Quantity: ${entry.quantity}'),
                        const Text('Rate: ₹8 per tea'),
                        Text('Total: ₹${entry.price.toStringAsFixed(2)}'),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref.read(teaEntriesProvider.notifier).deleteEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Entry deleted')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class WaterEntriesTab extends ConsumerWidget {
  const WaterEntriesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(waterEntriesProvider);
    
    if (entries.isEmpty) {
      return const Center(child: Text('No water entries yet'));
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Card(
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.water_drop, color: Colors.white),
            ),
            title: Text('${entry.quantity} Bottle(s)'),
            subtitle: Text(DateFormat('dd/MM/yyyy').format(entry.date)),
            trailing: Text(
              '₹${entry.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${DateFormat('dd/MM/yyyy').format(entry.date)}'),
                        Text('Quantity: ${entry.quantity}'),
                        const Text('Rate: ₹60 per bottle'),
                        Text('Total: ₹${entry.price.toStringAsFixed(2)}'),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref.read(waterEntriesProvider.notifier).deleteEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Entry deleted')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OtherEntriesTab extends ConsumerWidget {
  const OtherEntriesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(expenseEntriesProvider);
    
    if (entries.isEmpty) {
      return const Center(child: Text('No other expenses yet'));
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Card(
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.receipt, color: Colors.white),
            ),
            title: Text(entry.reason),
            subtitle: Text(DateFormat('dd/MM/yyyy').format(entry.date)),
            trailing: Text(
              '₹${entry.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${DateFormat('dd/MM/yyyy').format(entry.date)}'),
                          Text('Reason: ${entry.reason}'),
                          Text('Amount: ₹${entry.price.toStringAsFixed(2)}'),
                          if (entry.note.isNotEmpty) Text('Note: ${entry.note}'),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref.read(expenseEntriesProvider.notifier).deleteEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Entry deleted')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AdvanceEntriesTab extends ConsumerWidget {
  const AdvanceEntriesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(advanceEntriesProvider);
    
    if (entries.isEmpty) {
      return const Center(child: Text('No advance payments yet'));
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Card(
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.payment, color: Colors.white),
            ),
            title: Text('₹${entry.amount.toStringAsFixed(2)}'),
            subtitle: Text(DateFormat('dd/MM/yyyy').format(entry.date)),
            trailing: const Icon(Icons.add_circle, color: Colors.green),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${DateFormat('dd/MM/yyyy').format(entry.date)}'),
                          Text('Amount: ₹${entry.amount.toStringAsFixed(2)}'),
                          Text('Purpose: ${entry.purpose}'),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref.read(advanceEntriesProvider.notifier).deleteEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Entry deleted')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}