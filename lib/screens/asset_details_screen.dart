import 'package:flutter/material.dart';
import '../data/mock_assets.dart';
import 'locate_asset_screen.dart';
import 'checkout_asset_screen.dart';

class AssetDetailsScreen extends StatelessWidget {
  final String assetTag;

  const AssetDetailsScreen({
    super.key,
    required this.assetTag,
  });

  @override
  Widget build(BuildContext context) {
    final asset = assets[assetTag];

    if (asset == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Asset Not Found'),
        ),
        body: const Center(
          child: Text(
            'Asset Not Found',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              asset['name'] ?? '',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Text('Asset Tag: $assetTag'),
            Text('Manufacturer: ${asset['manufacturer']}'),
            Text('Category: ${asset['category']}'),
            Text('Serial Number: ${asset['serial']}'),

            const SizedBox(height: 15),

            const Text(
              'Location Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text('Location: ${asset['location']}'),
            Text('Shelf: ${asset['shelf']}'),
            Text('Row: ${asset['row']}'),

            const SizedBox(height: 15),

            const Text(
              'Assignment Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text('Status: ${asset['status']}'),
            Text('Assigned To: ${asset['assignedTo']}'),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.assignment_ind),
                label: const Text('Check Out Asset'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutAssetScreen(
                        assetTag: assetTag,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.bluetooth_searching),
                label: const Text('Locate Asset'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const LocateAssetScreen(),
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