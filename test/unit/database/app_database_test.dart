import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/database/app_database.dart';
import 'package:partner/core/database/command_queue_dao.dart';
import 'package:partner/core/database/preferences_store.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('建表与偏好读写', () async {
    final store = PreferencesStore(db);
    expect(await store.read('app_language'), isNull);
    await store.write('app_language', 'th');
    expect(await store.read('app_language'), 'th');
  });

  test('命令队列入队与状态流转', () async {
    final dao = CommandQueueDao(db);
    final entry = await dao.enqueue(
      commandId: 'cmd-1',
      entityType: 'stocktake',
      entityId: 7,
      payload: '{"count": 10}',
      deviceOccurredAt: DateTime.utc(2026, 11, 18),
    );
    expect(entry.id, greaterThan(0));
    expect(entry.status, 'pending');

    await dao.markStatus(entry.id, 'accepted');
    final accepted = await dao.watchByStatus('accepted').first;
    expect(accepted.single.id, entry.id);
    expect(accepted.single.status, 'accepted');

    await dao.deleteAcceptedBefore(DateTime.now().add(const Duration(days: 1)));
    final pending = await dao.watchByStatus('pending').first;
    expect(pending, isEmpty);
  });

  test('迁移：全部表可查询', () async {
    final tables = db.allTables;
    expect(
      tables,
      containsAll([
        db.sessionRecords,
        db.preferences,
        db.commandQueueEntries,
        db.readMessages,
      ]),
    );
  });
}
