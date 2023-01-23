import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc/presentation/charts/controller/charts_controller.dart';

class ChartsScreen extends GetView<ChartsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: SafeArea(
        child: Text('MyController'),
      ),
    );
  }
}
