import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: Duration(milliseconds: 500),
      swapAnimationCurve: Curves.linear,
      PieChartData(
        borderData: FlBorderData(show: true),
        pieTouchData: PieTouchData(
          touchCallback: ((p0, p1) {
            setState(() {
              print(p1?.touchedSection?.touchedSection?.value);
              if (p0 is FlPanUpdateEvent || p0 is FlPanEndEvent) {
                touchedIndex = -1;
              } else {
                touchedIndex = p1?.touchedSection?.touchedSectionIndex ?? -1;
              }
              print(touchedIndex);
            });
          }),
        ),
        sections: getSections(touchedIndex),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }

  List<PieChartSectionData> getSections(int touchedIndex) {
    return PieData.data
        .asMap()
        .map((index, data) {
          final isTouched = index == touchedIndex;
          final double fontSize = isTouched ? 25 : 16;
          final double radius = isTouched ? 100 : 80;

          final value = PieChartSectionData(
            color: data.color,
            value: data.percent,
            title: '${data.percent}%',
            showTitle: false,
            badgeWidget: Card(
              child: Text('${data.percent}%'),
            ),
            badgePositionPercentageOffset: 1.2,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
  }
}

class PieData {
  static List<Data> data = [
    Data(id: 0, name: 'Blue', percent: 40, color: Colors.blue, y: 0),
    Data(id: 1, name: 'Orange', percent: 30, color: Colors.orange, y: 0),
    Data(id: 2, name: 'Black', percent: 15, color: Colors.black, y: 0),
    Data(id: 3, name: 'Green', percent: 15, color: Colors.green, y: 0),
  ];
}

class Data {
  final int id;
  final String name;
  final double percent;
  final Color color;
  final double y;

  Data(
      {required this.id,
      required this.name,
      required this.percent,
      required this.color,
      required this.y});
}
