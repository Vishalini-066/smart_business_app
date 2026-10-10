import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _card(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio:1.6,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _card("Today's Sales", '₹12,500', Icons.point_of_sale, Colors.green),
        _card('Stock Items', '248', Icons.inventory_2, Colors.blue),
        _card('Low Stock', '7', Icons.warning_amber, Colors.red),
        _card('Profit', '₹3,200', Icons.trending_up, Colors.orange),
      ],
    );
  }
}