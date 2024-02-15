import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:learn_japanese_app/controller/auth_controller.dart';

import '../util/constant.dart';
import '../util/helper.dart';

class ApiController extends GetxController {
  var token = "".obs;
  var customUrl = Rxn().obs;

  @override
  void onInit() async {
    await GetStorage.init();
    setToken();
    super.onInit();
  }

  Future<void> setToken() async {
    final box = GetStorage();
    token.value = box.read('token') ?? "";
    customUrl.value.value = box.read('server');
  }

  BaseOptions baseOption([bool baseUrl = true]) => BaseOptions(
        baseUrl: baseUrl ? apiBase.baseUrl : '',
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token.value}',
        },
      );

  Future<dynamic> getData(String endpoint, [dynamic query]) async {
    var res;
    try {
      await setToken();
      Response response =
          await Dio(baseOption()).get(endpoint, queryParameters: query);
      res = response.data;
    } on DioError catch (e) {
      _errorHandle(e);
    }
    return res;
  }

  Future<dynamic> getFull(String endpoint) async {
    var res;
    try {
      await setToken();
      Response response = await Dio(baseOption(false)).get(endpoint);
      res = response.data;
    } on DioError catch (e) {
      _errorHandle(e);
    }
    return res;
  }

  Future<dynamic> post(String endpoint, dynamic data) async {
    var res;
    try {
      await setToken();
      data = jsonEncode(data, toEncodable: myEncode);
      Response response = await Dio(baseOption()).post(endpoint, data: data);
      print("Checking url : $endpoint || ${response.realUri}");
      res = response.data;
    } on DioError catch (e) {
      print("checking exception : $e");
      _errorHandle(e);
    }
    return res;
  }

  Future<dynamic> put(String endpoint, [dynamic data]) async {
    var res;
    try {
      await setToken();
      if (data != null) {
        data = jsonEncode(data, toEncodable: myEncode);
      }
      Response response = await Dio(baseOption()).put(endpoint, data: data);
      res = response.data;
    } on DioError catch (e) {
      _errorHandle(e);
      throw (e);
    }
    return res;
  }

  Future<bool> delete(String endpoint, [var data]) async {
    bool res = false;
    try {
      await setToken();
      if (data != null) {
        await Dio(baseOption()).delete(endpoint, data: data);
      } else {
        await Dio(baseOption()).delete(endpoint);
      }
      res = true;
    } on DioError {
      res = false;
    }
    return res;
  }

  _errorHandle(DioError e) {
    final authC = Get.find<AuthController>();
    if ([
      DioErrorType.connectTimeout,
      DioErrorType.receiveTimeout,
      DioErrorType.sendTimeout
    ].contains(e.type)) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Proses terlalu lama saat mendapatkan data",
      );
    } else if (e.type == DioErrorType.response &&
        e.response?.statusCode == 401) {
      authC.signOut();
    } else if (e.message.contains('SocketException')) {
      Get.defaultDialog(
        title: "Error Koneksi",
        middleText:
            "Internet tidak tersambung/mati, pastikan anda menggunakan koneksi yang stabil",
      );
    } else {
      Helper.normalSnackbar(
        Get.context!,
        str: "Terjadi Kesalahan",
        isErrorSB: true,
      );
    }
  }

  dynamic myEncode(dynamic item) {
    if (item != null && item != '') {
      if (item is DateTime) {
        return item.toIso8601String();
      } else if (item is File) {
        return base64Encode(item.readAsBytesSync());
      } else {
        return base64Encode(File(item.path).readAsBytesSync());
      }
    }
    return item;
  }
}
