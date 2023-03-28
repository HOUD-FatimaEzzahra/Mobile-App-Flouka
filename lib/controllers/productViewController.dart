import 'package:flutter_auth/models/sousCategorie.dart';
import 'package:flutter_auth/services/apiFlouka.dart';
import 'package:get/get.dart';

class ProductViewController extends GetxController {
  var sousCategories = List<SousCategorie>().obs;
  RxInt selectedIndexOfMenuList = 0.obs;

  void changeMenuIndex(index) {
    selectedIndexOfMenuList.value = index;
  }

  void _fetchData() async {
    await ApiFlouka.getSousCategorie().then((result) {
      sousCategories.value =
          result.where((element) => (element.active == true)).toList();
      sousCategories.value
          .insert(0, SousCategorie(id: 0, nom: "Tous", active: true));
      sousCategories.refresh();
    });
  }

  @override
  void onInit() {
    _fetchData();
    super.onInit();
  }
}
