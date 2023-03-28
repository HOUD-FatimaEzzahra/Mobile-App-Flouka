import 'package:flutter_auth/controllers/stockController.dart';
import 'package:flutter_auth/models/ville.dart';
import 'package:flutter_auth/services/apiFlouka.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VilleController extends GetxController {
  final session = GetStorage();
  StockController _stockController = Get.find();
  // ignore: deprecated_member_use
  var villes = List<Ville>().obs;
  var selectedVille = Ville().obs;
  var isVilleSelected = false.obs;

  void changeSelectedVille(id) {
    selectedVille.value = villes.firstWhere((v) => v.id == int.parse(id));
    isVilleSelected.value = true;
    villes.refresh();
  }

  void save() {
    session.write("villeSelected", true);
    session.write("villeId", selectedVille.value.id);
    session.write("villeName", selectedVille.value.nom);
    _stockController.fetchData(selectedVille.value.id);
  }

  @override
  void onInit() {
    if (session.read("villeSelected") == true) {
      isVilleSelected.value = session.read("villeSelected");
      selectedVille.value.id = session.read("villeId");
      selectedVille.value.nom = session.read("villeName");
      _stockController.fetchData(session.read("villeId"));
    }
    ApiFlouka.getVilles().then((result) {
      villes.value =
          result.where((element) => element.livraison == true).toList();
      villes.refresh();
    });
    super.onInit();
  }
}
