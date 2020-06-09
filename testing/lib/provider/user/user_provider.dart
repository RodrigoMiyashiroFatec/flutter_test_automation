import 'package:testing/model/user.dart';

abstract class UserProvider {
  Future<List> obtainUsers();
}