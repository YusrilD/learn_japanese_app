import 'package:get/get.dart';
import 'package:learn_japanese_app/controller/api_controller.dart';
import 'package:learn_japanese_app/model/n5.dart';
import '../util/endpoint.dart';

class HomeScreenController extends GetxController {
  var getN5Loading = false.obs;
  var getN5Failed = false.obs;
  var apiC = Get.find<ApiController>();
  var listN5 = <N5Model>[].obs;

  Future<void> getDataN5() async {
    getN5Loading.value = true;
    try {
      var res = await apiC.getData(getN5);
      listN5.value =
          res.map<N5Model>((item) => N5Model.fromJson(item)).toList();
      getN5Loading.value = false;
      getN5Failed.value = false;
    } catch (e) {
      getN5Failed.value = true;
      getN5Loading.value = false;
    }
  }

  @override
  void onInit() {
    getDataN5();
    super.onInit();
  }
}
