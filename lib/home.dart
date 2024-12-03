import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, dynamic> deviceStatus = {
    "Air Conditioner": {"status": true, "brightness": 75, "icon": Icons.ac_unit},
    "Lights": {"status": false, "brightness": 50, "icon": Icons.lightbulb},
    "CC Cameras": {"status": true, "brightness": 100, "icon": Icons.camera},
    "Security": {"status": true, "brightness": 100, "icon": Icons.security},
  };

  String? selectedDevice;
  double selectedBrightness = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality placeholder
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SettingsPage()),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'Settings', child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: deviceStatus.length,
              itemBuilder: (context, index) {
                final deviceName = deviceStatus.keys.elementAt(index);
                final device = deviceStatus[deviceName];
                final bool isOn = device["status"];
                final IconData icon = device["icon"];

                return Card(
                  color: isOn ? Colors.white : Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 60, color: isOn ? Colors.lightBlueAccent : Colors.white70),
                      SizedBox(height: 8),
                      Text(
                        deviceName,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            deviceStatus[deviceName]["status"] = !isOn;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOn ? Colors.lightBlue : Colors.white, // Button color
                        ),
                        child: Text(isOn ? 'Turn Off' : 'Turn On'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (selectedDevice != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "$selectedDevice Brightness",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: selectedBrightness,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: "${selectedBrightness.toInt()}%",
                    onChanged: (value) {
                      setState(() {
                        selectedBrightness = value;
                        deviceStatus[selectedDevice!]["brightness"] = value.toInt();
                      });
                    },
                  ),
                  Text(
                    "${selectedBrightness.toInt()}%",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page Content')),
    );
  }
}
