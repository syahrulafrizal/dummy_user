// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:dumy_user/app/data/response_detail_user.dart';
import 'package:dumy_user/app/data/response_list_user.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<User> data = User().obs;
  RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments['id'];
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() async {
    isLoading.value = true;
    Dio dio = Dio();
    final response = await dio.get(
      'https://reqres.in/api/users/${id.value}',
    );
    ResponseDetailUser user = ResponseDetailUser.fromJson(response.data);
    data.value = user.data ?? User();
    printInfo(info: "RESPON DATA : ${response.data}");
    isLoading.value = false;
  }
}
