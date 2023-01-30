// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';

class PieOtherChartWidget extends StatefulWidget {
  const PieOtherChartWidget({Key? key}) : super(key: key);

  @override
  State<PieOtherChartWidget> createState() => _PieOtherChartWidgetState();
}

class _PieOtherChartWidgetState extends State<PieOtherChartWidget> {
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
    return SfCircularChart(
      title: ChartTitle(text: 'Grafico de pizza'),
      // legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<SalesData, String>(
          name: 'Sales',
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.month,
          yValueMapper: (datum, index) => datum.sales,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            useSeriesColor: true,
            builder: (data, point, series, pointIndex, seriesIndex) {
              return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: point.color,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.month,
                    ),
                    SizedBox(height: 2),
                    Text(
                      '${data.sales}',
                    ),
                  ],
                ),
              );
            },
          ),
          enableTooltip: true,
          animationDuration: 500,
          strokeWidth: 50,
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
