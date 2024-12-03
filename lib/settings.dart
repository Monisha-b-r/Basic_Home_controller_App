import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FeatureController.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeatureController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: controller.features.keys.map((featureName) {
          return ListTile(
            title: Text(featureName),
            trailing: Switch(
              value: controller.isFeatureOn(featureName),
              onChanged: (_) {
                controller.toggleFeature(featureName);
              },
              activeColor: Colors.blue,
            ),
          );
        }).toList(),
      ),
    );
  }
}
