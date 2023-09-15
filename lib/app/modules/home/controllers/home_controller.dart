// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:dumy_user/app/data/response_list_user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<User> data = <User>[].obs;
  RxInt page = 1.obs;

  @override
  void onInit() {
    super.onInit();
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

  getData() async {
    isLoading.value = true;
    Dio dio = Dio();
    final response = await dio.get(
      'https://reqres.in/api/users',
      queryParameters: {'page': page.value},
    );
    ResponseListUser list = ResponseListUser.fromJson(response.data);
    List<User> defaultData = [
      User.fromJson(
        {
          "id": 7,
          "email": "michael.lawson@reqres.in",
          "first_name": "Michael",
          "last_name": "Lawson",
          "avatar": "https://reqres.in/img/faces/7-image.jpg"
        },
      )
    ];
    data.addAll(list.data ?? defaultData);
    page.value = list.page ?? 1;
    printInfo(info: "RESPON DATA : ${response.data}");
    isLoading.value = false;
  }
}
