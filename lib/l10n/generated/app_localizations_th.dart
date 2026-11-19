// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'แอปพาร์ทเนอร์';

  @override
  String get home => 'หน้าแรก';

  @override
  String get scan => 'สแกน';

  @override
  String get messages => 'ข้อความ';

  @override
  String get settings => 'ตั้งค่า';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get username => 'ชื่อผู้ใช้';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get loginError => 'เข้าสู่ระบบไม่สำเร็จ';

  @override
  String get sessionExpired => 'เซสชันหมดอายุ';

  @override
  String get messageDetail => 'รายละเอียดข้อความ';

  @override
  String messagePlaceholder(Object id) {
    return 'ข้อความ $id';
  }
}
