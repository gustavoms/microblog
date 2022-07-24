import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage storage = GetStorage();

  Future<bool> isDarkMode() async {
    return await storage.read('isDarkMode') ?? false;
  }

  Future<void> setDarkMode(bool value) async {
    await storage.write('isDarkMode', value);
  }

  Future<void> setUserId(int value) async {
    await storage.write('userId', value);
  }

  Future<int> getUserId() async {
    return await storage.read('userId') ?? 0;
  }

  Future<void> setUserName(String value) async {
    await storage.write('userName', value);
  }

  Future<String> getUserName() async {
    return await storage.read('userName') ?? '';
  }

  Future<void> setUserEmail(String value) async {
    await storage.write('userEmail', value);
  }

  Future<String> getUserEmail() async {
    return await storage.read('userEmail') ?? '';
  }
}
