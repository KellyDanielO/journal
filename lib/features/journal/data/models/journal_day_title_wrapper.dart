import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'journal_day_model.dart';

part 'journal_day_title_wrapper.g.dart';

@HiveType(typeId: 2)
class JournalTopicDayWrapper extends Equatable{
  @HiveField(0)
  final List<JournalDayModel> journalTopicDays;

  const JournalTopicDayWrapper({required this.journalTopicDays});
  
  @override
  List<Object?> get props => [journalTopicDays];
}