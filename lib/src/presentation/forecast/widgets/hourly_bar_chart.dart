import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class HourlyBarChart extends StatelessWidget {
  final List<DateTime> time;
  final List<double> values;

  final String unit;
  final Color color;

  final double intervalY;

  final List<FlSpot> spots;

  HourlyBarChart({
    required this.time,
    required this.values,
    this.unit = '',
    this.color = Colors.lightBlue,
    this.intervalY = 1.0,
    super.key,
  }) : spots = List.generate(
            time.length,
            (index) => FlSpot(
                time[index].millisecondsSinceEpoch.toDouble(), values[index]));

  Widget bottomTitles(double value, TitleMeta meta) {
    final dt = DateTime.fromMillisecondsSinceEpoch(value.toInt(), isUtc: true)
        .toLocal();
    final format = DateFormat.H();
    final str = dt.hour % 4 == 0 ? format.format(dt) : '';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(str),
    );
  }

  @override
  Widget build(BuildContext context) {
    final minY = _minY(spots).toDouble();
    final maxY = _maxY(spots).toDouble();
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: false,
        ),
        barGroups: spots.map((e) => _makeGroupData(e.x.toInt(), e.y)).toList(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              interval: intervalY,
            ),
          ),
          rightTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: bottomTitles,
            ),
          ),
          topTitles: const AxisTitles(),
        ),
        minY: minY,
        maxY: maxY == minY ? maxY + intervalY : maxY,
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Theme.of(context).colorScheme.secondaryContainer,
              dashArray: [8, 2],
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Theme.of(context).colorScheme.secondaryContainer,
              dashArray: [8, 2],
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        ),
      ),
    );
  }

  int _maxY(List<FlSpot> spots) => ((spots
                      .map((e) => e.y)
                      .toList()
                      .reduce((value, element) => math.max(value, element)) /
                  intervalY)
              .ceil() *
          intervalY)
      .ceil();

  int _minY(List<FlSpot> spots) => ((spots
                      .map((e) => e.y)
                      .toList()
                      .reduce((value, element) => math.min(value, element)) /
                  intervalY)
              .floor() *
          intervalY)
      .floor();

  BarChartGroupData _makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
        ),
      ],
    );
  }
}
