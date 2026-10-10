import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {'name': 'Rice 1kg', 'qty': 50, 'expiry': '12 Dec 2026'},
    {'name': 'Sugar 1kg', 'qty': 4, 'expiry': '20 Nov 2026'},
    {'name': 'Milk 500ml', 'qty': 3, 'expiry': '14 Oct 2026'},
    {'name': 'Biscuits', 'qty': 40, 'expiry': '05 Jan 2027'},
    {'name': 'Cooking Oil 1L', 'qty': 6, 'expiry': '30 Mar 2027'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final bool low = item['qty'] < 10;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                low ? Icons.warning_amber : Icons.inventory_2,
                color: low ? Colors.red : Colors.green,
              ),
              title: Text(item['name']),
              subtitle: Text('Expiry: ${item['expiry']}'),
              trailing: Text(
                'Qty: ${item['qty']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: low ? Colors.red : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}