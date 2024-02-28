import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'journal_topic_model.dart';

part 'journal_topic_wrapper.g.dart';

@HiveType(typeId: 3)
class JournalTopicWrapper extends Equatable{
  @HiveField(0)
  final List<JournalTopicModel> journalTopic;

  const JournalTopicWrapper({required this.journalTopic});
  
  @override
  List<Object?> get props => [journalTopic];
}