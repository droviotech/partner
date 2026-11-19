import 'package:injectable/injectable.dart';
import 'app_database.dart';

@lazySingleton
class PreferencesStore {
  PreferencesStore(this._db);

  final AppDatabase _db;

  Future<String?> read(String key) async {
    final row = await (_db.select(
      _db.preferences,
    )..where((entry) => entry.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  Future<void> write(String key, String value) {
    return _db
        .into(_db.preferences)
        .insertOnConflictUpdate(
          PreferencesCompanion.insert(key: key, value: value),
        );
  }
}
