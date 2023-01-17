// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc/presentation/home/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            controller.logout();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(controller.userModel.picture),
              ),
              SizedBox(height: 12),
              Text(
                controller.userModel.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(controller.userModel.email),
            ],
          ),
        ),
      ),
    );
  }
}
