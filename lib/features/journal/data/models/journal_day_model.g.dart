// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalDayModelAdapter extends TypeAdapter<JournalDayModel> {
  @override
  final int typeId = 1;

  @override
  JournalDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalDayModel(
      message: fields[0] as String,
      date: fields[1] as String,
      subTitle: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JournalDayModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.subTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
