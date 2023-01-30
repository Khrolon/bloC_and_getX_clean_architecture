import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class LineOtherChartWidget extends StatefulWidget {
  const LineOtherChartWidget({Key? key}) : super(key: key);

  @override
  State<LineOtherChartWidget> createState() => _LineOtherChartWidgetState();
}

class _LineOtherChartWidgetState extends State<LineOtherChartWidget> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Grafico de linha'),
      // legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      series: <ChartSeries>[
        LineSeries<SalesData, double>(
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.year,
          yValueMapper: (datum, index) => datum.sales,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(sales: 25, year: 2017),
      SalesData(sales: 12, year: 2018),
      SalesData(sales: 24, year: 2019),
      SalesData(sales: 18, year: 2020),
      SalesData(sales: 30, year: 2021),
    ];
    return chartData;
  }
}

class SalesData {
  final double year;
  final double sales;

  SalesData({
    required this.year,
    required this.sales,
  });
}
