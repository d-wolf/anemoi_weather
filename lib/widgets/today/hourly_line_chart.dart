import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HourlyLineChart extends StatelessWidget {
  final List<DateTime> time;
  final List<double> values;

  final String unit;
  final Color color;

  final double intervalY;

  final List<FlSpot> spots;

  HourlyLineChart({
    required this.time,
    required this.values,
    this.unit = '',
    this.color = Colors.lightBlue,
    this.intervalY = 1.0,
    super.key,
  }) : spots = List.generate(time.length,
            (index) => FlSpot(time[index].hour.toDouble(), values[index]));

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          enabled: false,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                return LineTooltipItem(
                  '${touchedSpot.y.toStringAsFixed(2)} $unit',
                  TextStyle(
                    color: touchedSpot.bar.gradient?.colors[0] ??
                        touchedSpot.bar.color,
                  ),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: spots,
            color: color,
            dotData: const FlDotData(
              show: false,
            ),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              interval: intervalY,
            ),
          ),
          rightTitles: const AxisTitles(),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              interval: 4,
            ),
          ),
          topTitles: const AxisTitles(),
        ),
        minX: 0,
        maxX: 23,
        minY: _minY(spots).toDouble(),
        maxY: _maxY(spots).toDouble(),
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
}
