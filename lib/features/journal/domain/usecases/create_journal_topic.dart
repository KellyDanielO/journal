import '../entities/journal_topic.dart';
import '../repository/journal_repository.dart';

class CreateJournalTopic {
  JournalRepository repository;

  CreateJournalTopic(this.repository);

  void call(JournalTopicEntity journalTopic) {
    return repository.createJournalTopic(journalTopic);
  }
}
