import 'package:get/get.dart';

import '../models/location_model.dart';
import '../models/request_model.dart';
import '../models/services_model.dart';
import '../services/api.dart';

class ServiceRequestController extends GetxController {
  RxList<ServicesData> data = <ServicesData>[].obs;
  RxList<LocationData> locationdata = <LocationData>[].obs;
  Rx<RequestData> requestdata = RequestData().obs;

  RxBool isLoadingS = true.obs;
  RxBool isLoading = true.obs;

  Future<void> getservices() async {
    var x = await ApiCall().apiGetServices();
    data(x);
  }

  Future<void> getlocation() async {
    var y = await ApiCall().apiGetLocations();
    locationdata(y);
  }

  Future<void> loadData() async {
    isLoading(true);
    await getservices();
    await getlocation();
    isLoading(false);
  }

  RxBool isLoadingR = false.obs;

  Future<bool> postRequest(List<int> serviceId, int userId, int locationId,
      String buildingName, String description) async {
    isLoadingR(true);
    var x = await ApiCall().apiPostRequest(
        serviceId, userId, locationId, buildingName, description);
    requestdata(x);
    isLoadingR(false);
    return x;
  }
}
