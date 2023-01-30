import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc/presentation/charts/controller/charts_controller.dart';
import 'package:poc/presentation/charts/widgets/bar_chart_widget.dart';
import 'package:poc/presentation/charts/widgets/line_chart_widget.dart';
import 'package:poc/presentation/charts/widgets/pie_chart_widget.dart';

class ChartsScreen extends GetView<ChartsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts with fl_chart Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              child: PieChartWidget(),
            ),
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BarChartWidget(),
              ),
            ),
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: LineChartWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
