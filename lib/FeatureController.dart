import 'package:flutter/material.dart';

class FeatureController extends ChangeNotifier {
  final Map<String, bool> _features = {
    "Air Conditioner": false,
    "Lights": false,
    "CC Cameras": false,
    "Security": false,
  };

  Map<String, bool> get features => _features;

  void toggleFeature(String featureName) {
    if (_features.containsKey(featureName)) {
      _features[featureName] = !_features[featureName]!;
      notifyListeners(); // Notify listeners about the change
    }
  }

  bool isFeatureOn(String featureName) => _features[featureName] ?? false;
}
