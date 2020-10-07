// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..token = fields[0] as String
      ..id = fields[1] as int
      ..email = fields[2] as String
      ..firstName = fields[3] as String
      ..lastName = fields[4] as String
      ..displayName = fields[5] as String
      ..birthday = fields[6] as String
      ..phone = fields[7] as String
      ..pin = fields[8] as String
      ..points = fields[9] as int;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.displayName)
      ..writeByte(6)
      ..write(obj.birthday)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.pin)
      ..writeByte(9)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
