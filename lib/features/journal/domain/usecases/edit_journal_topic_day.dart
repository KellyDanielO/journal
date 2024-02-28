import '../entities/journal_day.dart';
import '../repository/journal_repository.dart';

class EditJournalTopicDay {
  JournalRepository repository;

  EditJournalTopicDay(this.repository);

  void call(String id, JournalDayEntity journalTopicDay) {
    return repository.editJournalDay(id, journalTopicDay);
  }
}
