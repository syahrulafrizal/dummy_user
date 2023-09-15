import 'package:dumy_user/app/data/response_list_user.dart';
import 'package:dumy_user/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              User item = controller.data[index];
              return ListTile(
                title: Text(item.email ?? "-"),
                onTap: () {
                  Get.toNamed(Routes.DETAIL, arguments: {
                    "id": item.id,
                    "payload": item,
                  });
                },
              );
            },
            itemCount: controller.data.length,
          );
        }
      }),
    );
  }
}
