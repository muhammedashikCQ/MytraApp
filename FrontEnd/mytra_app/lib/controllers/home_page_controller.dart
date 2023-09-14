import 'package:get/get.dart';

import '../models/services_model.dart';
import '../services/api.dart';

class HomePageController extends GetxController {
  RxList<ServicesData> data = <ServicesData>[].obs;

  RxBool isLoadingH = false.obs;

  void getservicesforhome() async {
    isLoadingH(true);
    var x = await ApiCall().apiGetServices();
    data(x);
    isLoadingH(false);
  }
}
