import 'package:slbfe_client/core/constants/strings.dart';

class DataProvider {
  static String getSlbfeUserUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/$nic";

  static String verifyInfoUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/VerifyInformation/$nic";

  static String uploadDocsUrl({required String nic}) =>
      "${Strings.baseUrl}/api/Citizens/$nic";

  static String get newUserUrl => "${Strings.baseUrl}/api/Citizens";

  static String get loginUserUrl => "${Strings.baseUrl}/api/Citizens/LoginUser";

  static String getComplaintsUrl({required String uid}) =>
      "${Strings.baseUrl}/api/Complaint/GetByUserId/$uid";

  static String get newComplaintUrl => "${Strings.baseUrl}/api/Complaint";
}
