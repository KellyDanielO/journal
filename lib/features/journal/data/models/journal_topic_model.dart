import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/journal_topic.dart';

part 'journal_topic_model.g.dart';

@HiveType(typeId: 0)
class JournalTopicModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String date;

  const JournalTopicModel(
      {required this.title, required this.date, required this.id});

  @override
  List<Object?> get props => [title, date];

  JournalTopicEntity toEntity() => JournalTopicEntity(
        id: id,
        title: title,
        date: date,
      );
  factory JournalTopicModel.toModel(JournalTopicEntity entity) =>
      JournalTopicModel(title: entity.title, date: entity.date, id: entity.id);
}
