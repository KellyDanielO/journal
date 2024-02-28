import '../entities/journal_day.dart';
import '../repository/journal_repository.dart';

class DeleteJournalTopicDay {
  JournalRepository repository;

  DeleteJournalTopicDay(this.repository);

  void call(String id, JournalDayEntity journalTopicDay) {
    return repository.deleteJournalDay(id, journalTopicDay);
  }
}
