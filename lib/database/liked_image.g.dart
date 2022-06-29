// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikedImageAdapter extends TypeAdapter<LikedImage> {
  @override
  final int typeId = 1;

  @override
  LikedImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedImage(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LikedImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
