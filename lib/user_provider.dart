import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_service.dart';
import 'user_model.dart';

final userProvider = ChangeNotifierProvider.autoDispose((ref) => UserProvider());

class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];

  UserProvider() {
    getUserList();
  }

  Future<void> getUserList() async {
    List<UserModel> userList = await ApiServices().getUsers();

    users = userList;

    notifyListeners();

    await Future.delayed(const Duration(seconds: 3), () {
      users.add(
        UserModel(
          id: 10,
          email: "sonia@gmail.com",
          firstname: "Sonia",
          lastname: "Ejaz",
          avatar: 'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740',
        ),
      );
    });
    notifyListeners();
  }
}
