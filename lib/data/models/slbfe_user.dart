import 'dart:convert';

class SlbfeUser {
  final String userName;
  final String userEmail;
  SlbfeUser({
    required this.userName,
    required this.userEmail,
  });

  SlbfeUser copyWith({
    String? userName,
    String? userEmail,
  }) {
    return SlbfeUser(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
    };
  }

  factory SlbfeUser.fromMap(Map<String, dynamic> map) {
    return SlbfeUser(
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SlbfeUser.fromJson(String source) =>
      SlbfeUser.fromMap(json.decode(source));

  @override
  String toString() => 'SlbfeUser(userName: $userName, userEmail: $userEmail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SlbfeUser &&
        other.userName == userName &&
        other.userEmail == userEmail;
  }

  @override
  int get hashCode => userName.hashCode ^ userEmail.hashCode;
}
