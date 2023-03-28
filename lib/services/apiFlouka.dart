import 'package:dio/dio.dart';
import 'package:flutter_auth/models/sousCategorie.dart';
import 'package:flutter_auth/models/stock.dart';
import 'package:flutter_auth/models/ville.dart';
import 'package:flutter_auth/models/zoneModel.dart';

class ApiFlouka {
  static const String villes = 'https://profondesolution.online/api/villes';
  static const String zones = 'https://profondesolution.online/api/zones';
  static const String stock = 'https://profondesolution.online/api/stock';
  static const String sousCategorie =
      'https://profondesolution.online/api/sous-categories';

  static Future<List<Stock>> getStock(int id) async {
    try {
      final response = await Dio().get(stock + "/${id}");
      return (response.data as List).map((e) => Stock.fromJson(e)).toList();
    } catch (ex) {
      return List<Stock>();
    }
  }

  static Future<List<Ville>> getVilles() async {
    try {
      final response = await Dio().get(villes);
      return (response.data as List).map((e) => Ville.fromJson(e)).toList();
    } catch (ex) {
      return List<Ville>();
    }
  }

  static Future<List<SousCategorie>> getSousCategorie() async {
    try {
      final response = await Dio().get(sousCategorie);
      return (response.data as List)
          .map((e) => SousCategorie.fromJson(e))
          .toList();
    } catch (ex) {
      return List<SousCategorie>();
    }
  }

  static Future<List<Zone>> getZones() async {
    try {
      final response = await Dio().get(zones);
      return (response.data as List).map((e) => Zone.fromJson(e)).toList();
    } catch (ex) {
      return List<Zone>();
    }
  }
}
