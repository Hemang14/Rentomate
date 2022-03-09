class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}

class House {
  String name;
  String address;
  String imageUrl;
  String cost;
  String ownname;

  House(this.name, this.address, this.imageUrl, this.cost, this.ownname);
}


// for Profile Page

class PUser {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const PUser({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  PUser copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    bool? isDarkMode,
  }) =>
      PUser(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static PUser fromJson(Map<String, dynamic> json) => PUser(
    imagePath: json['imagePath'],
    name: json['name'],
    email: json['email'],
    about: json['about'],
    isDarkMode: json['isDarkMode'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'email': email,
    'about': about,
    'isDarkMode': isDarkMode,
  };
}
