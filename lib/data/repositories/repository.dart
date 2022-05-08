import 'dart:convert';
import 'dart:developer';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;
import 'package:slbfe_client/data/models/vacancy.dart';

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/complaint.dart';
import '../models/connection_user.dart';
import '../models/new_user.dart';
import '../models/slbfe_user.dart';

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

  static Future<List<String>> getConnectionIds({required String nic}) async {
    SlbfeUser user = await getSlbfeUser(nic: nic);
    return user.connections;
  }

  static Future<bool> isConnected(
      {required String nic, required String connectionId}) async {
    SlbfeUser user = await getSlbfeUser(nic: nic);
    return user.connections.contains(connectionId);
  }

  static Future<bool> connect(
      {required String uid, required String connectionId}) async {
    try {
      final res = await http.post(
        Uri.parse(
          DataProvider.handleConnection(connectionId: connectionId, uid: uid),
        ),
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      throw "Something went wrong";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<bool> disConnect(
      {required String uid, required String connectionId}) async {
    try {
      final res = await http.put(
        Uri.parse(
          DataProvider.handleConnection(connectionId: connectionId, uid: uid),
        ),
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      throw "Something went wrong";
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<SlbfeUser> getCitizenById({required String uid}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.getCitizenById(uid: uid),
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
      final res = await http.get(
        Uri.parse(
          DataProvider.loginUserUrl(nic: nic, password: password),
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      log(res.statusCode.toString());
      if (res.statusCode == 200) {
        if (jsonDecode(res.body)) {
          return true;
        } else {
          return false;
        }
      } else {
        throw "An error occurred";
      }
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
      final request = http.MultipartRequest(
          "PUT",
          Uri.parse(
            DataProvider.uploadDocsUrl(nic: nic),
          ))
        ..fields['QuolificationName'] = name
        ..files.add(
          http.MultipartFile.fromString(
            'Image',
            document,
            contentType: MediaType('application', 'pdf'),
          ),
        );

      final res = await request.send();

      log(res.statusCode.toString());
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
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
      } else {
        throw "Failed to load data";
      }
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

  static Future<List<ConnectionUser>> getAllUsers({required String uid}) async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.allCitizens),
      );

      if (res.statusCode == 200) {
        return HttpListConverter.parseAllUsers(res.body, uid);
      } else {
        throw "Failed to load data";
      }
    } catch (e) {
      log(e.toString());
      throw "can not connect to the server!";
    }
  }

  static Future<List<ConnectionUser>> getConnectUsers(
      {required List<String> userIds}) async {
    try {
      List<ConnectionUser> connectionUsers = [];
      for (var userId in userIds) {
        SlbfeUser user = await getCitizenById(uid: userId);
        connectionUsers.add(
          ConnectionUser(
            id: user.id,
            name: user.name,
            nic: user.nic,
            age: user.age,
            profession: user.profession,
            email: user.email,
          ),
        );
      }
      return connectionUsers;
    } catch (e) {
      throw "can not connect to the server!";
    }
  }

  static Future<List<Vacancy>> getVacancies() async {
    try {
      final res = await http.get(
        Uri.parse(DataProvider.vacancies),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseVacancies(res.body);
      } else {
        throw "Failed to load data";
      }
    } catch (e) {
      throw "can not connect to the server!";
    }
  }
}
