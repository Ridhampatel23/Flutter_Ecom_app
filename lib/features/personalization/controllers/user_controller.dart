import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication/controllers/signup/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save User Record for any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final userName =
            UserModel.generateUserName(userCredentials.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            userName: userName,
            email: userCredentials.user!.email ?? "",
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            phoneNumber: userCredentials.user!.phoneNumber ?? "",
            profilePicture: userCredentials.user!.photoURL ?? "");

        // Save User Data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      ecomLoaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong while saving you information. You can re-save your data in your profile.");
    }
  }
}
