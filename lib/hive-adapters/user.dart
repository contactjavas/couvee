import 'package:hive/hive.dart';

@HiveType()
class User extends HiveObject {
  @HiveField(0)
  String token;

  @HiveField(1)
  int id;

  @HiveField(2)
  String email;

  @HiveField(3)
  String firstName;

  @HiveField(4)
  String lastName;

  @HiveField(5)
  String displayName;

  @HiveField(6)
  String birthday;

  @HiveField(7)
  String phone;

  @HiveField(8)
  String pin;

  @HiveField(9)
  int points;
}
