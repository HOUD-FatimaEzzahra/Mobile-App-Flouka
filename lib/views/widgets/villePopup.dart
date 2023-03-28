import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/views/widgets/rounded_button.dart';
import 'package:flutter_auth/controllers/villeController.dart';
import 'package:flutter_auth/controllers/zoneController.dart';
import 'package:get/get.dart';

class VillePopup extends StatelessWidget {
  VilleController villeController = Get.find();
  ZoneController zoneController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context));
  }

  dialogContent(BuildContext context) {
    return Obx(() => (villeController.villes.length <= 0)
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: <Widget>[
              Container(
                width: 250,
                padding:
                    EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 16),
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          isDense: true,
                          isExpanded: true,
                          hint: new Text("Choisir votre ville"),
                          value: (villeController.isVilleSelected.value)
                              ? villeController.selectedVille.value.id
                                  .toString()
                              : null,
                          onChanged: (value) {
                            villeController.changeSelectedVille(value);
                            zoneController.clearZone();
                            zoneController.filterZones(value);
                          },
                          items: villeController.villes
                              .map((element) => DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(element.nom)))
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          hint: new Text("Choisir votre zone"),
                          value: (zoneController.isZoneSelected.value)
                              ? zoneController.selectedZone.value.id.toString()
                              : null,
                          onChanged: (value) {
                            zoneController.changeSelectedZone(value);
                          },
                          items: zoneController.filtredZones
                              .map((element) => DropdownMenuItem<String>(
                                  value: element.id.toString(),
                                  child: Text(element.nom)))
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      text: "Appliquer",
                      width: 150,
                      press: () {
                        if (zoneController.isZoneSelected.value &&
                            villeController.isVilleSelected.value) {
                          zoneController.save();
                          villeController.save();
                          Navigator.pop(context);
                        } else
                          Get.snackbar("error", "selectionner une ville",
                              backgroundColor: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              icon: Icon(Icons.notifications),
                              shouldIconPulse: true,
                              margin: EdgeInsets.all(20));
                      },
                      color: darkBlueColor,
                    ),
                  ],
                ),
              ),
            ],
          ));
  }

  // dropdrop(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.all(15),
  //     decoration: BoxDecoration(
  //         border: Border.all(width: 1, color: Colors.grey),
  //         borderRadius: BorderRadius.circular(10)),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[],
  //     ),
  //   );
  // }
}
