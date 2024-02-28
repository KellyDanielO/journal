// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_day_title_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalTopicDayWrapperAdapter
    extends TypeAdapter<JournalTopicDayWrapper> {
  @override
  final int typeId = 2;

  @override
  JournalTopicDayWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalTopicDayWrapper(
      journalTopicDays: (fields[0] as List).cast<JournalDayModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, JournalTopicDayWrapper obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.journalTopicDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalTopicDayWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
