import 'dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SmartBusinessApp());
}

class SmartBusinessApp extends StatelessWidget {
  const SmartBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Business App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Business App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 24)),
            ),
            ListTile(title: Text('Dealers')),
            ListTile(title: Text('Inventory')),
            ListTile(title: Text('Sales')),
            ListTile(title: Text('Workers')),
          ],
        ),
      ),
      body:const DashboardScreen(),
    );
  }
}