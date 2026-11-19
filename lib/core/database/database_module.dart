import 'package:injectable/injectable.dart';
import 'app_database.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase provideAppDatabase() => buildAppDatabase();
}
