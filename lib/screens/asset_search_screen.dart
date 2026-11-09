import 'package:flutter/material.dart';
import 'asset_details_screen.dart';

class AssetSearchScreen extends StatelessWidget {
  const AssetSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Assets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search Asset',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.laptop),
                    title: const Text('Dell Latitude 7420'),
                    subtitle: const Text('AST-0032'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AssetDetailsScreen(),
                        ),
                      );
                    },
                  ),

                  const ListTile(
                    leading: Icon(Icons.laptop),
                    title: Text('MacBook Pro'),
                    subtitle: Text('AST-0015'),
                  ),

                  const ListTile(
                    leading: Icon(Icons.desktop_windows),
                    title: Text('Lenovo ThinkCentre'),
                    subtitle: Text('AST-0029'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}