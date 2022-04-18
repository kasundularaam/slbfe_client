class DataProvider {
  static String getSlbfeUserUrl({required String nic}) =>
      "http://192.168.8.100:8002/api/Citizens/$nic";

  static String verifyInfoUrl({required String nic}) =>
      "http://192.168.8.100:8002/api/Citizens/VerifyInformation/$nic";

  static String uploadDocsUrl({required String nic}) =>
      "http://10.0.2.2:8002/api/Citizens/$nic";

  static String get newUserUrl => "http://192.168.8.100:8002/api/Citizens";

  static String get loginUserUrl =>
      "http://192.168.8.100:8002/api/Citizens/LoginUser";

  static String getComplaintsUrl({required String uid}) =>
      "http://192.168.8.100:8002/api/Complaint/GetByUserId/$uid";

  static String get newComplaintUrl =>
      "http://192.168.8.100:8002/api/Complaint";
}
