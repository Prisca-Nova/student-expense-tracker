import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  final Map<String, double> data;

  const ChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: data.entries.map((entry) {
          return PieChartSectionData(
            value: entry.value,
            color: Colors.primaries[data.keys.toList().indexOf(entry.key)],
            title: entry.key,
          );
        }).toList(),
      ),
    );
  }
}