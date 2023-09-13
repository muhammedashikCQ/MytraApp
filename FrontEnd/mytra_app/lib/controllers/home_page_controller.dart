import 'package:get/get.dart';

import '../models/services_model.dart';
import '../services/api.dart';

class HomePageController extends GetxController {
  RxList<ServicesData> data = <ServicesData>[].obs;

  RxBool isLoadingH = true.obs;

  void getservicesforhome() async {
    var x = await ApiCall().apiGetServices();
    data(x);
    isLoadingH(false);
  }
}
