import 'package:flutter/material.dart';

class CheckoutAssetScreen extends StatefulWidget {
  final String assetTag;

  const CheckoutAssetScreen({
    super.key,
    required this.assetTag,
  });

  @override
  State<CheckoutAssetScreen> createState() =>
      _CheckoutAssetScreenState();
}

class _CheckoutAssetScreenState
    extends State<CheckoutAssetScreen> {
  final TextEditingController userController =
      TextEditingController();

  final TextEditingController reasonController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out Asset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              'Asset: ${widget.assetTag}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Assign To',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: reasonController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Checkout Reason',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        'Asset ${widget.assetTag} checked out',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Confirm Checkout',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}