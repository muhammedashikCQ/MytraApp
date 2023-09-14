import 'package:get/get.dart';

import '../models/preious_order_model.dart';
import '../services/api.dart';

class PreviousOrderController extends GetxController {
  RxList<PreviousOrdersData> data = <PreviousOrdersData>[].obs;

  RxBool isLoadingP = false.obs;

  Future controllerGetPreviousOrders(int userId) async {
    isLoadingP(true);
    var x = await ApiCall().apiGetPreviousOrders(userId);
    data(x);
    isLoadingP(false);
  }
}
