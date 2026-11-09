import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LocateAssetScreen(),
  ));
}

class LocateAssetScreen extends StatefulWidget {
  const LocateAssetScreen({super.key});

  @override
  State<LocateAssetScreen> createState() => _LocateAssetScreenState();
}

class _LocateAssetScreenState extends State<LocateAssetScreen> {
  double signalStrength = 65;

  String get status {
    if (signalStrength >= 95) return 'FOUND';
    if (signalStrength >= 85) return 'VERY CLOSE';
    if (signalStrength >= 70) return 'HOT';
    if (signalStrength >= 40) return 'WARM';
    return 'COLD';
  }

  Color get statusColor {
    if (signalStrength >= 95) return Colors.green;
    if (signalStrength >= 85) return Colors.red;
    if (signalStrength >= 70) return Colors.orange;
    if (signalStrength >= 40) return Colors.amber;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate Asset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Dell Latitude 7420',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'BLE Status: Connected',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            const Text(
              'Signal Strength',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: signalStrength / 100,
              minHeight: 18,
              color: statusColor,
            ),

            const SizedBox(height: 15),

            Text(
              '${signalStrength.toInt()}%',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            Slider(
              value: signalStrength,
              min: 0,
              max: 100,
              divisions: 100,
              label: signalStrength.round().toString(),
              onChanged: (value) {
                setState(() {
                  signalStrength = value;
                });
              },
            ),

            const SizedBox(height: 25),

            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Approximate Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text('Shelf: 9'),
            const Text('Row: 1'),

            const SizedBox(height: 30),

            const Text(
              'Move the slider to simulate BLE proximity.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton.extended(
            heroTag: 'start',
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('Start Locate'),
          ),

          const SizedBox(height: 10),

          FloatingActionButton.extended(
            heroTag: 'buzz',
            onPressed: () {},
            icon: const Icon(Icons.volume_up),
            label: const Text('Trigger Buzzer'),
          ),

          const SizedBox(height: 10),

          FloatingActionButton.extended(
            heroTag: 'stop',
            onPressed: () {},
            icon: const Icon(Icons.stop),
            label: const Text('Stop Locate'),
          ),
        ],
      ),
    );
  }
}