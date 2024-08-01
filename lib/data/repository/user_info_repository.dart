import 'package:hive/hive.dart';
import 'package:with_u/data/dto/user_info.dart';

class UserInfoRepository {
  static const String _boxName = 'userInfoBox';

  // Open the box
  Future<Box<UserInfo>> _openBox() async {
    return await Hive.openBox<UserInfo>(_boxName);
  }

  // Create a new UserInfo
  Future<void> createUserInfo(UserInfo userInfo) async {
    final box = await _openBox();
    await box.add(userInfo);
  }

  // Read a UserInfo
  Future<UserInfo?> getUserInfo(int index) async {
    final box = await _openBox();
    return box.get(index);
  }

  // Read all UserInfo
  Future<List<UserInfo>> getAllUserInfo() async {
    final box = await _openBox();
    final userInfoList = box.values.toList();
    return userInfoList;
  }

  // Update an existing UserInfo
  Future<void> updateUserInfo(int index, UserInfo userInfo) async {
    final box = await _openBox();
    await box.putAt(index, userInfo);
  }

  // Delete a UserInfo
  Future<void> deleteUserInfo(int index) async {
    final box = await _openBox();
    await box.deleteAt(index);
  }
}
