import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  //List addresses;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    // this.addresses = const [],
  });

  String get fullName => '$firstName $lastName';

  String get formatPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";

    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        // addresses: [],
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FullName': fullName,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      // 'Addresses': addresses,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      return UserModel(
        id: document.id,
        firstName: document['FirstName'] ?? '',
        lastName: document['LastName'] ?? '',
        username: document['Username'] ?? '',
        email: document['Email'] ?? '',
        phoneNumber: document['PhoneNumber'] ?? '',
        profilePicture: document['ProfilePicture'] ?? '',
        // addresses: document['Addresses'] ?? [],
      );
    } else {
      return UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        // addresses: [],
      );
    }
  }
}
