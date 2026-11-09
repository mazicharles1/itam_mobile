import 'package:flutter/material.dart';
import 'asset_search_screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITAM Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Card(
              child: ListTile(
                leading: Icon(Icons.inventory),
                title: Text('Total Assets'),
                subtitle: Text('Loading...'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Assigned Assets'),
                subtitle: Text('Loading...'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Available Assets'),
                subtitle: Text('Loading...'),
              ),
            ),

            const SizedBox(height: 30),

           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AssetSearchScreen(),
      ),
    );
  },
  child: const Text('Search Asset'),
),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Scan QR'),
            ),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Locate Asset'),
            ),

          ],
        ),
      ),
    );
  }
}