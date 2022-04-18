import 'dart:convert';
import 'dart:developer';

import 'package:slbfe_client/core/converters/http_list_converter.dart';
import 'package:slbfe_client/data/data_providers/data_provider.dart';
import 'package:slbfe_client/data/models/complaint.dart';
import 'package:slbfe_client/data/models/new_user.dart';
import 'package:slbfe_client/data/models/slbfe_user.dart';
import 'package:http/http.dart' as http;

class Repository {
  static Future<SlbfeUser> getSlbfeUser({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getSlbfeUserUrl(nic: nic),
        ),
      );
      if (res.statusCode == 200) {
        return SlbfeUser.fromJson(res.body);
      }
      throw "Failed to load data";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<bool> login(
      {required String nic, required String password}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.loginUserUrl,
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body:
              jsonEncode(<String, String>{"nic": nic, "passsword": password}));
      if (res.statusCode == 200) {
        if (jsonDecode(res.body)) {
          return true;
        } else {
          return false;
        }
      }
      throw "An error occurred";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<SlbfeUser> register({required NewUser newUser}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.newUserUrl,
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: newUser.toJson());

      if (res.statusCode == 200) {
        log(SlbfeUser.fromJson(res.body).toString());
        return SlbfeUser.fromJson(res.body);
      }
      throw "An error occurred";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<bool> uploadDocs(
      {required String nic,
      required String document,
      required String name}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.uploadDocsUrl(nic: nic),
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: jsonEncode(
              <String, String>{"QuolificationName": name, "Image": document}));
      if (res.statusCode == 200) {
        return true;
      }
      throw "An error occurred";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<List<Complaint>> getComplaints({required String uid}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getComplaintsUrl(uid: uid),
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseComplaints(res.body);
      }
      throw "Failed to load data";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<bool> addComplaint(
      {required String uid, required String message}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.newComplaintUrl,
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: jsonEncode(
              <String, String>{"userId": uid, "complaintMessage": message}));
      if (res.statusCode == 200) {
        return true;
      }
      throw "An error occurred";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }
}
