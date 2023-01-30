// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultipleOtherChartWidget extends StatefulWidget {
  const MultipleOtherChartWidget({Key? key}) : super(key: key);

  @override
  State<MultipleOtherChartWidget> createState() =>
      _MultipleOtherChartWidgetState();
}

class _MultipleOtherChartWidgetState extends State<MultipleOtherChartWidget> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: Colors.white,
      textStyle: TextStyle(color: Colors.black),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Grafico barra com linha'),
      // legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'primary axis')),
      primaryYAxis: NumericAxis(
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      series: <CartesianSeries>[
        ColumnSeries<SalesData, String>(
          name: 'Sales',
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.month,
          yValueMapper: (datum, index) => datum.sales,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
        LineSeries<SalesData, String>(
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.month,
          yValueMapper: (datum, index) => datum.sales,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(month: 'Jan', sales: 25, year: 2017),
      SalesData(month: 'Fev', sales: 12, year: 2018),
      SalesData(month: 'Feb', sales: 24, year: 2019),
      SalesData(month: 'Mar', sales: 18, year: 2020),
      SalesData(month: 'Apr', sales: 30, year: 2021),
    ];
    return chartData;
  }
}

class SalesData {
  final String month;
  final double year;
  final double sales;

  SalesData({
    required this.month,
    required this.year,
    required this.sales,
  });
}
