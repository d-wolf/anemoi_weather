import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyLineChart extends StatelessWidget {
  HourlyLineChart({
    required this.time,
    required this.values,
    this.unit = '',
    this.color = Colors.lightBlue,
    this.intervalY = 1.0,
    super.key,
  }) : spots = List.generate(
          time.length,
          (index) => FlSpot(
            time[index].millisecondsSinceEpoch.toDouble(),
            values[index],
          ),
        );
  final List<DateTime> time;
  final List<double> values;

  final String unit;
  final Color color;

  final double intervalY;

  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(
          enabled: false,
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
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                final dt = DateTime.fromMillisecondsSinceEpoch(
                  value.toInt(),
                  isUtc: true,
                ).toLocal();
                final format = DateFormat.H();
                final text = dt.hour % 4 == 0 ? format.format(dt) : '';
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(text),
                );
              },
              interval: 1000 * 3600,
            ),
          ),
          topTitles: const AxisTitles(),
        ),
        minY: _minY(spots).toDouble(),
        maxY: _maxY(spots).toDouble(),
        gridData: FlGridData(
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

  int _maxY(List<FlSpot> spots) =>
      ((spots.map((e) => e.y).toList().reduce(math.max) / intervalY).ceil() *
              intervalY)
          .ceil();

  int _minY(List<FlSpot> spots) =>
      ((spots.map((e) => e.y).toList().reduce(math.min) / intervalY).floor() *
              intervalY)
          .floor();
}
