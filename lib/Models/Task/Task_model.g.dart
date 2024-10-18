// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<Task_model> {
  @override
  final int typeId = 1;

  @override
  Task_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task_model(
      title: fields[0] as String,
      date: fields[1] as String,
      color: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Task_model obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TaskModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
