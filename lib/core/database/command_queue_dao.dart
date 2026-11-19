import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'app_database.dart';

@lazySingleton
class CommandQueueDao {
  CommandQueueDao(this._db);

  final AppDatabase _db;

  Future<CommandQueueEntry> enqueue({
    required String commandId,
    required String entityType,
    required int entityId,
    required String payload,
    required DateTime deviceOccurredAt,
  }) {
    return _db
        .into(_db.commandQueueEntries)
        .insertReturning(
          CommandQueueEntriesCompanion.insert(
            commandId: commandId,
            entityType: entityType,
            entityId: entityId,
            payload: payload,
            status: 'pending',
            deviceOccurredAt: deviceOccurredAt,
            updatedAt: DateTime.now(),
          ),
        );
  }

  Stream<List<CommandQueueEntry>> watchByStatus(String status) {
    final query = _db.select(_db.commandQueueEntries)
      ..where((entry) => entry.status.equals(status));
    return query.watch();
  }

  Future<void> markStatus(int id, String status, {String? error}) {
    return (_db.update(
      _db.commandQueueEntries,
    )..where((entry) => entry.id.equals(id))).write(
      CommandQueueEntriesCompanion(
        status: Value(status),
        error: Value(error),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteAcceptedBefore(DateTime before) {
    return (_db.delete(_db.commandQueueEntries)..where(
          (entry) =>
              entry.status.equals('accepted') &
              entry.updatedAt.isSmallerThanValue(before),
        ))
        .go();
  }
}
