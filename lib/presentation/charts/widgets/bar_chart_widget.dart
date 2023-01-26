// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:poc/presentation/charts/widgets/pie_chart_widget.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 20,
        minY: 0,
        groupsSpace: 12,
        barTouchData: BarTouchData(),
        titlesData: FlTitlesData(
          topTitles: BarTitles.getTopBottomTitles(),
          bottomTitles: BarTitles.getTopBottomTitles(),
          leftTitles: BarTitles.getSideTitles(),
          rightTitles: BarTitles.getSideTitles(),
        ),
        gridData: FlGridData(
          checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Color.fromARGB(73, 42, 39, 71),
            strokeWidth: 0.5,
          ),
          getDrawingVerticalLine: (value) => FlLine(
            color: Color.fromARGB(73, 42, 39, 71),
            strokeWidth: 0.5,
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: BarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.id,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: data.color,
                    width: 20,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class BarTitles {
  static AxisTitles getTopBottomTitles() => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => Text(
            BarData.barData
                .firstWhere((element) => element.id == value.toInt())
                .name,
          ),
          // reservedSize: 50,
        ),
      );

  static AxisTitles getSideTitles() => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: BarData.interval.toDouble(),
          getTitlesWidget: (value, meta) => Text('${value.toInt()}k'),
        ),
      );
}

class BarData {
  static int interval = 5;

  static List<Data> barData = [
    Data(id: 0, name: 'Mon', y: 15, color: Color(0xff19bfff), percent: 0),
    Data(id: 1, name: 'Tue', y: 10, percent: 0, color: Color(0xffff4d94)),
    Data(id: 2, name: 'Wed', y: 11, percent: 0, color: Color(0xff2bdb90)),
    // Data(id: 3, name: 'Tue', y: -12, percent: 0, color: Color(0xffff4d94)),
  ];
}
