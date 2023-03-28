import 'package:flutter_auth/controllers/cartController.dart';
import 'package:flutter_auth/controllers/detailsController.dart';
import 'package:flutter_auth/controllers/authController.dart';
import 'package:flutter_auth/controllers/productViewController.dart';
import 'package:flutter_auth/controllers/stockController.dart';
import 'package:flutter_auth/controllers/villeController.dart';
import 'package:flutter_auth/controllers/zoneController.dart';
import 'package:flutter_auth/models/cart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final _session = GetStorage();
    _session.writeIfNull("villeSelected", false);
    _session.writeIfNull("zoneSelected", false);
    _session.writeIfNull("cartList", null);
    Get.lazyPut<VilleController>(() => VilleController());
    Get.lazyPut<ZoneController>(() => ZoneController());
    Get.lazyPut<ProductViewController>(() => ProductViewController());
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<CartController>(() => CartController());
    Get.put<StockController>(StockController());
    Get.put<DetailsController>(DetailsController());
  }
}
