// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '合作方端';

  @override
  String get home => '首页';

  @override
  String get scan => '扫码';

  @override
  String get messages => '消息';

  @override
  String get settings => '设置';

  @override
  String get login => '登录';

  @override
  String get logout => '退出登录';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get loginError => '登录失败';

  @override
  String get sessionExpired => '会话已失效';

  @override
  String get messageDetail => '消息详情';

  @override
  String messagePlaceholder(Object id) {
    return '消息 $id';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => '合作方端';

  @override
  String get home => '首页';

  @override
  String get scan => '扫码';

  @override
  String get messages => '消息';

  @override
  String get settings => '设置';

  @override
  String get login => '登录';

  @override
  String get logout => '退出登录';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get loginError => '登录失败';

  @override
  String get sessionExpired => '会话已失效';

  @override
  String get messageDetail => '消息详情';

  @override
  String messagePlaceholder(Object id) {
    return '消息 $id';
  }
}
