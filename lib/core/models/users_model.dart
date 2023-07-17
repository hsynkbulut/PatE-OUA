class Users {
  String? userID;
  String username;
  String email;
  String password;
  String? profilePhoto;

  Users(
      {this.userID,
      required this.username,
      required this.email,
      required this.password,
      this.profilePhoto});

  // Users sınıfını Map'e dönüştürme
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'username': username,
      'email': email,
      'password': password,
      'profilePhoto': profilePhoto
    };
  }

  // Map'i Users sınıfına dönüştürme
  Users.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        username = map['username'],
        email = map['email'],
        password = map['password'],
        profilePhoto = map['profilePhoto'];
}
