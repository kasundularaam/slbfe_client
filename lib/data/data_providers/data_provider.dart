import 'package:slbfe_client/core/constants/strings.dart';

class DataProvider {
  static String getSlbfeUserUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/$nic.js";

  static String verifyInfoUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/VerifyInformation/$nic.js";

  static String uploadDocsUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/$nic.js";

  static String get newUserUrl => "${Strings.baseUrl}/api/Citizens.js";

  static String loginUserUrl({required String nic, required String password}) =>
      "${Strings.baseUrl}/api/Citizens/LoginUser/$nic/$password.js";

  static String getComplaintsUrl({required String uid}) =>
      "${Strings.baseUrl}/api/Complaint/GetByUserId/$uid.js";

  static String get newComplaintUrl => "${Strings.baseUrl}/api/Complaint/.js";
}
