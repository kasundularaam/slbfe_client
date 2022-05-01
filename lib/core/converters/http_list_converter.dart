import 'dart:convert';

import 'package:slbfe_client/data/models/complaint.dart';
import 'package:slbfe_client/data/models/connection_user.dart';
import 'package:slbfe_client/data/models/slbfe_user.dart';

class HttpListConverter {
  static List<Complaint> parseComplaints(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Complaint>(
          (json) => Complaint.fromMap(json),
        )
        .toList();
  }

  static List<ConnectionUser> parseAllUsers(String responseBody, String uid) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<ConnectionUser> allUsers = parsed
        .map<SlbfeUser>(
          (json) => ConnectionUser.fromMap(json),
        )
        .toList();
    allUsers.removeWhere((user) => user.id == uid);
    return allUsers;
  }
}
