import 'package:get_storage/get_storage.dart';

abstract class IStorage {
  Future<bool> isDarkMode();
  Future<void> setDarkMode(bool value);
  Future<void> setUserId(int value);
  Future<int> getUserId();
  Future<void> setUserName(String value);
  Future<String> getUserName();
  Future<void> setUserEmail(String value);
  Future<String> getUserEmail();
}

class Storage implements IStorage {
  GetStorage storage = GetStorage();

  @override
  Future<bool> isDarkMode() async {
    return await storage.read('isDarkMode') ?? false;
  }

  @override
  Future<void> setDarkMode(bool value) async {
    await storage.write('isDarkMode', value);
  }

  @override
  Future<void> setUserId(int value) async {
    await storage.write('userId', value);
  }

  @override
  Future<int> getUserId() async {
    return await storage.read('userId') ?? 0;
  }

  @override
  Future<void> setUserName(String value) async {
    await storage.write('userName', value);
  }

  @override
  Future<String> getUserName() async {
    return await storage.read('userName') ?? '';
  }

  @override
  Future<void> setUserEmail(String value) async {
    await storage.write('userEmail', value);
  }

  @override
  Future<String> getUserEmail() async {
    return await storage.read('userEmail') ?? '';
  }
}
