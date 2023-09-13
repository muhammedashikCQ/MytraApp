import 'package:get/get.dart';

import '../models/services_model.dart';
import '../services/api.dart';

class HomePageController extends GetxController {
  RxList<ServicesData> data = <ServicesData>[].obs;

  RxBool isLoading = true.obs;

  void getservicesforhome() async {
    isLoading(true);
    var x = await ApiCall().apiGetServices();
    data(x);
    isLoading(false);
  }
}
