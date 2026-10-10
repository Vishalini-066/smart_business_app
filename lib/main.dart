import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'inventory_screen.dart';
import 'dashboard_screen.dart';
import'dealers_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vfgyjlquqovqcmlsqbza.supabase.co',
    anonKey: 'sb_publishable_4NxYJqogDAdJEgSeMkVxjQ_yuUir09C',
  );
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
          children: [
            const DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
  title: const Text('Dealers'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DealersScreen()),
    );
  },
),
            ListTile(
              title: const Text('Inventory'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InventoryScreen()),
                );
              },
            ),
            const ListTile(title: Text('Sales')),
            const ListTile(title: Text('Workers')),
          ],
        ),
      ),
      body: const DashboardScreen(),
    );
  }
}