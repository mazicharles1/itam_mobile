import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../data/mock_assets.dart';
import 'asset_details_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool scanned = false;

  void _processQRCode(String code) {
    if (!assets.containsKey(code)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Asset Not Found: $code'),
        ),
      );

      setState(() {
        scanned = false;
      });

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AssetDetailsScreen(
          assetTag: code,
        ),
      ),
    ).then((_) {
      setState(() {
        scanned = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Asset'),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          if (scanned) return;

          final barcode = capture.barcodes.first;
          final String? code = barcode.rawValue;

          if (code != null) {
            scanned = true;
            _processQRCode(code);
          }
        },
      ),
    );
  }
}
