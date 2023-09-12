import 'package:get/get.dart';

import '../models/location_model.dart';
import '../models/services_model.dart';
import '../services/api.dart';

class ServiceRequestController extends GetxController {
  RxList<ServicesData> data = <ServicesData>[].obs;
  RxList<LocationData> locationdata = <LocationData>[].obs;

  RxBool isLoading = true.obs;

  void getservices() async {
    isLoading(true);
    var x = await ApiCall().apiGetServices();
    data(x);
    isLoading(false);
  }

  void getlocation() async {
    isLoading(true);
    var y = await ApiCall().apiGetLocations();
    locationdata(y);
    isLoading(false);
  }
}
