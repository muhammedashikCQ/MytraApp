import 'package:get/get.dart';

import '../models/services_model.dart';
import '../services/api.dart';

class ServiceRequestController extends GetxController {
  RxList<ServiceData> data = <ServiceData>[].obs;

  RxBool isLoading = true.obs;

  void getservices() async {
    isLoading(true);
    var x = await ApiCall().apiGetServices();
    data(x);
    isLoading(false);
  }
}
