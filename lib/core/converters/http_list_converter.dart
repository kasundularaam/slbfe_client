import 'dart:convert';

import 'package:slbfe_client/data/models/complaint.dart';

class HttpListConverter {
  static List<Complaint> parseComplaints(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Complaint>(
          (json) => Complaint.fromMap(json),
        )
        .toList();
  }
}
