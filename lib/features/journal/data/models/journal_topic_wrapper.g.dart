// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_topic_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalTopicWrapperAdapter extends TypeAdapter<JournalTopicWrapper> {
  @override
  final int typeId = 3;

  @override
  JournalTopicWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalTopicWrapper(
      journalTopic: (fields[0] as List).cast<JournalTopicModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, JournalTopicWrapper obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.journalTopic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalTopicWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
