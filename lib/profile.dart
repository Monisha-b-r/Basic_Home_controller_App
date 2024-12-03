import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> monthlyStats = [
    {"device": "Air Conditioner", "usageHours": 200, "level": 75, "continuousUse": "6h"},
    {"device": "Lights", "usageHours": 150, "level": 50, "continuousUse": "4h"},
    {"device": "CC Cameras", "usageHours": 300, "level": 100, "continuousUse": "24h"},
    {"device": "Security", "usageHours": 300, "level": 100, "continuousUse": "24h"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Background color for the whole list
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: monthlyStats.length,
          itemBuilder: (context, index) {
            final device = monthlyStats[index];
            final String deviceName = device['device'];
            IconData deviceIcon;

            // Dynamically choose the icon based on the device
            switch (deviceName) {
              case "Air Conditioner":
                deviceIcon = Icons.ac_unit;
                break;
              case "Lights":
                deviceIcon = Icons.lightbulb;
                break;
              case "CC Cameras":
                deviceIcon = Icons.camera_alt;
                break;
              case "Security":
                deviceIcon = Icons.security;
                break;
              default:
                deviceIcon = Icons.devices;
            }

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white, // Color for individual card
                ),
                child: ListTile(
                  leading: Icon(deviceIcon, size: 40, color: Colors.lightBlueAccent),
                  title: Text(
                    deviceName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextWithoutBackground("Monthly Usage: ${device['usageHours']} hours"),
                      _buildTextWithoutBackground("Brightness Level: ${device['level']}%"),
                      _buildTextWithoutBackground("Continuous Usage: ${device['continuousUse']}"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper function to create text without background color
  Widget _buildTextWithoutBackground(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.black), // You can choose other text colors as needed
      ),
    );
  }
}
