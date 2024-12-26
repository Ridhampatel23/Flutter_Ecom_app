import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.profilePicture});

   ///Helper function to get full name
    String get fullName => '$firstName $lastName';

  ///  Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to gnerate a username from the full name
  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName"; //Combine First and Last Name
    String userNameWithPrefix = "flyBuy_$camelCaseUserName"; // Add "flyBuy" prefix
    return userNameWithPrefix;
  }

  /// Static function to create an empty user model
 static UserModel empty() => UserModel(id: "", userName: "", email: "", firstName: "", lastName: "", phoneNumber: "", profilePicture: "");

  /// Convert model to JSON structure for storing it in FireBase
  Map<String, dynamic> toJson(){
    return{
      "FirstName" : firstName,
      "LastName" : lastName,
      "UserName" : userName,
      "ProfilePicture" : profilePicture,
      "Email" : email,
      "PhoneNumber" : phoneNumber,
    };
  }

  /// Factory method to create a User Model from a Firebase document snapshot
  factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? "",
        lastName: data["LastName"] ?? "",
        userName: data["UserName"] ?? "",
        email: data["Email"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        profilePicture: data["ProfilePicture"] ?? '',
      );
    } else {
      // Handle the case where data is null
      return UserModel.empty();
    }
  }

}
