// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutOtherChartWidget extends StatefulWidget {
  const DoughnutOtherChartWidget({Key? key}) : super(key: key);

  @override
  State<DoughnutOtherChartWidget> createState() =>
      _DoughnutOtherChartWidgetState();
}

class _DoughnutOtherChartWidgetState extends State<DoughnutOtherChartWidget> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late double _totalValue;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: Colors.white,
      textStyle: TextStyle(color: Colors.black),
      activationMode: ActivationMode.singleTap,
    );
    _totalValue = getTotalOfValueChart(_chartData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Grafico de donuts'),
      // legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      onTooltipRender: (tooltipArgs) {
        print(tooltipArgs.dataPoints);
      },
      series: <CircularSeries>[
        DoughnutSeries<SalesData, String>(
          name: 'Sales',
          innerRadius: '40%',
          dataSource: _chartData,
          xValueMapper: (datum, index) => datum.month,
          yValueMapper: (datum, index) => datum.sales,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(color: Colors.white),
            labelPosition: ChartDataLabelPosition.outside,
            builder: (data, point, series, pointIndex, seriesIndex) {
              // final realData = data as SalesData;
              // final realpoint = point as ChartPoint<dynamic>;
              // final realseries = series as DoughnutSeries<SalesData, String>;
              int value = ((data.sales / _totalValue) * 100).toInt();
              // print(realseries);
              return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: point.pointColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.month,
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${data.sales}',
                        ),
                        SizedBox(width: 8),
                        Text(
                          '$value%',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          pointColorMapper: (datum, index) => datum.pointColor,
          enableTooltip: true,
          animationDuration: 500,
          strokeWidth: 50,
        ),
      ],
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(
          month: 'Jan', sales: 25, year: 2017, pointColor: Color(0xff8D65F5)),
      SalesData(
          month: 'Feb', sales: 12, year: 2018, pointColor: Color(0xff6665F5)),
      SalesData(
          month: 'Mar', sales: 24, year: 2019, pointColor: Color(0xff3698F7)),
      SalesData(
          month: 'Apr', sales: 18, year: 2020, pointColor: Color(0xff01D0FA)),
      SalesData(month: 'Mai', sales: 30, year: 2021, pointColor: Colors.blue),
    ];
    return chartData;
  }

  double getTotalOfValueChart(List<SalesData> list) {
    double totalValue = 0;

    for (var item in list) {
      totalValue += item.sales;
    }

    return totalValue;
  }
}

class SalesData {
  final String month;
  final double year;
  final double sales;
  final Color pointColor;

  SalesData({
    required this.month,
    required this.year,
    required this.sales,
    required this.pointColor,
  });
}
