// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_goal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingGoalAdapter extends TypeAdapter<SavingGoal> {
  @override
  final int typeId = 3;

  @override
  SavingGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavingGoal(
      id: fields[0] as String,
      name: fields[1] as String,
      target: fields[2] as double,
      current: fields[3] as double,
      targetDate: fields[4] as DateTime,
      created: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SavingGoal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.target)
      ..writeByte(3)
      ..write(obj.current)
      ..writeByte(4)
      ..write(obj.targetDate)
      ..writeByte(5)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
