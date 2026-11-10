import 'package:flutter/material.dart';

import '../data/mock_assets.dart';
import 'asset_details_screen.dart';

class AssetSearchScreen extends StatefulWidget {
  const AssetSearchScreen({super.key});

  @override
  State<AssetSearchScreen> createState() => _AssetSearchScreenState();
}

class _AssetSearchScreenState extends State<AssetSearchScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredAssets = assets.entries.where((asset) {
      final assetTag = asset.key.toLowerCase();
      final assetName =
          (asset.value['name'] ?? '').toLowerCase();

      return assetTag.contains(searchText.toLowerCase()) ||
          assetName.contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Assets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search Asset',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredAssets.length,
                itemBuilder: (context, index) {
                  final asset = filteredAssets[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.laptop),
                      title: Text(
                        asset.value['name']!,
                      ),
                      subtitle: Text(
                        asset.key,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AssetDetailsScreen(
                              assetTag: asset.key,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}