import 'package:hive/hive.dart';

import '../../models/journal_day_model.dart';
import '../../models/journal_day_title_wrapper.dart';
import '../../models/journal_topic_model.dart';
import '../../models/journal_topic_wrapper.dart';

class LocalDataSource {
  final Box<JournalTopicWrapper> journalTopic;
  final Box<JournalTopicDayWrapper> journalTopicDayWrapper;

  LocalDataSource(this.journalTopic, this.journalTopicDayWrapper);

  void addJournalTopic(JournalTopicModel topic) {
    final topics = journalTopic.get('topics');
    List<JournalTopicModel> newTopics = [];
    if (topics == null) {
      newTopics.add(topic);
    } else {
      if (topics.journalTopic.isEmpty) {
        newTopics.add(topic);
      } else {
        for (var element in topics.journalTopic) {
          newTopics.add(element);
        }
        newTopics.add(topic);
      }
    }
    journalTopic.put('topics', JournalTopicWrapper(journalTopic: newTopics));
    JournalTopicDayWrapper journalDayWrapper =
        const JournalTopicDayWrapper(journalTopicDays: []);
    journalTopicDayWrapper.put(topic.id, journalDayWrapper);
  }

  List<JournalTopicModel> getAllJournalTopics() {
    final topics = journalTopic.get('topics');
    if (topics == null) {
      return [];
    } else {
      return topics.journalTopic;
    }
  }

  void addJournalTopicDay(String id, JournalDayModel journalDayModel) {
    JournalTopicDayWrapper? getJournalTopicRecord =
        journalTopicDayWrapper.get(id);
    if (getJournalTopicRecord != null) {
      List<JournalDayModel> data = [];
      for (var element in getJournalTopicRecord.journalTopicDays) {
        data.add(element);
      }
      data.add(journalDayModel);
      JournalTopicDayWrapper journalDayWrapper =
          JournalTopicDayWrapper(journalTopicDays: data);
      journalTopicDayWrapper.put(id, journalDayWrapper);
    }
  }

  List<JournalDayModel> getJournalTopicDays(String id) {
    JournalTopicDayWrapper? getJournalTopicRecord =
        journalTopicDayWrapper.get(id);
    List<JournalDayModel> data = [];
    if (getJournalTopicRecord != null) {
      for (var element in getJournalTopicRecord.journalTopicDays) {
        data.add(element);
      }
    }
    return data;
  }

  void deleteJournalTopic(JournalTopicModel journal) {
    List<JournalTopicModel> list = [];
    final topics = journalTopic.get('topics');
    if (topics != null) {
      for (var element in topics.journalTopic) {
        if (element != journal) {
          list.add(element);
        }
      }
      journalTopic.put('topics', JournalTopicWrapper(journalTopic: list));
      journalTopicDayWrapper.delete(journal.id);
    }
  }

  void deleteJournalTopicDay(String id, JournalDayModel journalDayModel) {
    JournalTopicDayWrapper? getJournalTopicRecord =
        journalTopicDayWrapper.get(id);
    if (getJournalTopicRecord != null) {
      List<JournalDayModel> data = [];
      for (var element in getJournalTopicRecord.journalTopicDays) {
        if (element != journalDayModel) {
          data.add(element);
        }
      }
      JournalTopicDayWrapper journalDayWrapper =
          JournalTopicDayWrapper(journalTopicDays: data);
      journalTopicDayWrapper.put(id, journalDayWrapper);
    }
  }

  JournalDayModel? getJournalDay(String id, String date) {
    JournalTopicDayWrapper? getJournalTopicRecord =
        journalTopicDayWrapper.get(id);
    JournalDayModel? data;
    if (getJournalTopicRecord != null) {
      for (var element in getJournalTopicRecord.journalTopicDays) {
        if (element.date == date) {
          data = element;
        }
      }
      return data;
    }
    return null;
  }

  void editJournalTopicDay(String id, JournalDayModel journalDayModel) {
    JournalTopicDayWrapper? getJournalTopicRecord =
        journalTopicDayWrapper.get(id);
    if (getJournalTopicRecord != null) {
      List<JournalDayModel> data = [];
      for (var element in getJournalTopicRecord.journalTopicDays) {
        if (element.date == journalDayModel.date) {
          data.add(journalDayModel);
        } else {
          data.add(element);
        }
      }
      JournalTopicDayWrapper journalDayWrapper =
          JournalTopicDayWrapper(journalTopicDays: data);
      journalTopicDayWrapper.put(id, journalDayWrapper);
    }
  }
}
