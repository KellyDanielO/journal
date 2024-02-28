import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/journal_day.dart';
import '../entities/journal_topic.dart';

abstract class JournalRepository {
  // Create Journal Topic
  void createJournalTopic(JournalTopicEntity entity);
  // Create journal Topic Day
  void createJournalDay(String id, JournalDayEntity journalDay);
  // edit journal Topic Day
  void editJournalDay(String id, JournalDayEntity journalDay);
  // Get journal TOpics
  Future<Either<Failure, List<JournalTopicEntity>>> getJournalTopics();
  // Get journal topics day
  Future<Either<Failure, JournalDayEntity>> getJournalDay(
      String id, String date);
  // Get journal days topic
  Future<Either<Failure, List<JournalDayEntity>>> getJournalTopicDays(
      String id);
  // Delete journal Topic
  void deleteJournalTopic(JournalTopicEntity journal);
  // Delete journal Topic Day
  void deleteJournalDay(String id, JournalDayEntity journalDay);
}
