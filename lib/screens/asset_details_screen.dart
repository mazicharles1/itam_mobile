import 'package:flutter/material.dart';
import 'package:itam_mobile/screens/locate_asset_screen.dart';
class AssetDetailsScreen extends StatelessWidget {
  const AssetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Dell Latitude 7420',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text('Asset Tag: AST-0032'),
            Text('Serial Number: DL7420'),
            Text('Category: Laptop'),
            Text('Location: Zurich'),
            Text('Shelf: 9'),
            Text('Row: 1'),

            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
           LocateAssetScreen()
      ),
    );
  },
        icon: Icon(Icons.bluetooth_searching),
        label: Text('Locate Asset'),
      ),
    );
  }
}