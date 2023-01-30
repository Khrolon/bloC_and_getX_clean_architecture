// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poc/presentation/other_charts/controller/other_charts_controller.dart';
import 'package:poc/presentation/other_charts/widgets/funnel_chart_widget.dart';
import 'package:poc/presentation/other_charts/widgets/line_other_chart.widget.dart';
import 'package:poc/presentation/other_charts/widgets/multiple_chart_axis_widget.dart';
import 'package:poc/presentation/other_charts/widgets/doughnut_other_chart.widget.dart';

class OtherChartsScreen extends GetView<OtherChartsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts with Syncfusion screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                // height: 400,
                child: DoughnutOtherChartWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                // height: 400,
                child: LineOtherChartWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                // height: 400,
                child: MultipleOtherChartWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 500,
                child: FunnelOtherChartWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
