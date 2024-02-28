// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_topic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalTopicModelAdapter extends TypeAdapter<JournalTopicModel> {
  @override
  final int typeId = 0;

  @override
  JournalTopicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalTopicModel(
      title: fields[1] as String,
      date: fields[2] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JournalTopicModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalTopicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
