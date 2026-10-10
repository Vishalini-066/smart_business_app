import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DealersScreen extends StatefulWidget {
  const DealersScreen({super.key});

  @override
  State<DealersScreen> createState() => _DealersScreenState();
}

class _DealersScreenState extends State<DealersScreen> {
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<Map<String, dynamic>>> _load() {
    return Supabase.instance.client.from('dealers').select().order('name');
  }

  Future<void> _addDealer() async {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add dealer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (saved == true && nameCtrl.text.trim().isNotEmpty) {
      await Supabase.instance.client.from('dealers').insert({
        'name': nameCtrl.text.trim(),
        'phone': phoneCtrl.text.trim(),
      });
      setState(() => _future = _load());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dealers')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDealer,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final dealers = snapshot.data ?? [];
          if (dealers.isEmpty) {
            return const Center(child: Text('No dealers yet'));
          }
          return ListView.builder(
            itemCount: dealers.length,
            itemBuilder: (context, i) {
              final d = dealers[i];
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.local_shipping),
                  title: Text(d['name']),
                  subtitle: Text(
                      '${d['company'] ?? ''}  ${d['phone'] ?? ''}'.trim()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}