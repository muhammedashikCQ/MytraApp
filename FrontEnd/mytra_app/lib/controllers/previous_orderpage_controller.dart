import 'package:get/get.dart';

import '../models/preious_order_model.dart';
import '../services/api.dart';

class PreviousOrderController extends GetxController {
  RxList<PreviousOrdersData> data = <PreviousOrdersData>[].obs;

  RxBool isLoadingP = true.obs;

  Future<void> controllerGetPreviousOrders(int userId) async {
    var x = await ApiCall().apiGetPreviousOrders(userId);
    data(x);
    isLoadingP(false);
  }
}
