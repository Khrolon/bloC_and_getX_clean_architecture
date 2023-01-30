import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({Key? key}) : super(key: key);

  // final Gradient gradientColors = Gradient(colors: [
  //   const Color(0xff23b6e6),
  //   const Color(0xff02d39a),
  // ]);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        maxX: 11,
        minX: 0,
        maxY: 6,
        minY: 0,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Color(0xff37434d),
            strokeWidth: 0.5,
          ),
          getDrawingVerticalLine: (value) => FlLine(
            color: Color(0xff37434d),
            strokeWidth: 0.5,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(),
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              color: Colors.blue,
              isCurved: true,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.2),
                // gradient: Gradient(
                //     colors:
                //         gradientColors.map((e) => e.withOpacity(0.3)).toList()),
              ))
        ],
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 2:
                  return Text('MAR');
                case 5:
                  return Text('JUN');
                case 8:
                  return Text('SEP');
              }
              return Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return Text('10k');
                case 3:
                  return Text('30k');
                case 5:
                  return Text('50k');
              }
              return Text('');
            },
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            //   reservedSize: 22,
            //   getTitlesWidget: (value, meta) {
            //     switch (value.toInt()) {
            //       case 1:
            //         return Text('10k');
            //       case 3:
            //         return Text('30k');
            //       case 5:
            //         return Text('50k');
            //     }
            //     return Text('');
            //   },
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return Text('10k');
                case 3:
                  return Text('30k');
                case 5:
                  return Text('50k');
              }
              return Text('');
            },
          ),
        ),
      );
}
