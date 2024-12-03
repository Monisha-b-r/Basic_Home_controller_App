import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  final List<double> monthlyData = [
    3, 5, 2, 8, 7, 6, 10, 12, 8, 5, 6, 4, 7, 9, 10, 8, 6, 7, 5, 3, 9, 11, 6, 7, 8, 9, 4, 6, 8, 10
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Monthly Usage Analysis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(),
                              style: TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: (value, meta) {
                          if (value >= 1 && value <= 31) {
                            return Text(value.toInt().toString(),
                                style: TextStyle(fontSize: 10));
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: monthlyData
                          .asMap()
                          .entries
                          .map((entry) =>
                          FlSpot(entry.key.toDouble() + 1, entry.value))
                          .toList(),
                      isCurved: true,
                      barWidth: 3,
                      belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
                      dotData: FlDotData(show: false),
                      // Set the color directly here using `color` for line color
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
