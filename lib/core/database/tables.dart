import 'package:drift/drift.dart';

class SessionRecords extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class Preferences extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class CommandQueueEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get commandId => text()();
  TextColumn get entityType => text()();
  IntColumn get entityId => integer()();
  TextColumn get payload => text()();
  // draft/pending/syncing/accepted/conflict/rejected
  TextColumn get status => text()();
  TextColumn get error => text().nullable()();
  DateTimeColumn get deviceOccurredAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ReadMessages extends Table {
  IntColumn get messageId => integer()();
  DateTimeColumn get readAt => dateTime()();

  @override
  Set<Column> get primaryKey => {messageId};
}
