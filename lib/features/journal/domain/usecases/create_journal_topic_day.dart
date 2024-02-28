import '../entities/journal_day.dart';
import '../repository/journal_repository.dart';

class CreateJournalTopicDay {
  JournalRepository repository;

  CreateJournalTopicDay(this.repository);

  void call(String id, JournalDayEntity journalTopicDay) {
    return repository.createJournalDay(id, journalTopicDay);
  }
}
