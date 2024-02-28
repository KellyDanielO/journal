import '../entities/journal_topic.dart';
import '../repository/journal_repository.dart';

class DeleteJournalTopic {
  JournalRepository repository;

  DeleteJournalTopic(this.repository);

  void call(JournalTopicEntity journal) {
    return repository.deleteJournalTopic(journal);
  }
}
