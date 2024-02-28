import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/journal_topic.dart';
import '../repository/journal_repository.dart';

class GetJournalTopics{
  JournalRepository repository;

  GetJournalTopics(this.repository);

  Future<Either<Failure, List<JournalTopicEntity>>> call(){
    return repository.getJournalTopics();
  }
}