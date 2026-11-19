import 'package:flutter_test/flutter_test.dart';
import 'package:partner/app/config/app_env.dart';

void main() {
  group('AppEnv', () {
    test('fromName 已知值', () {
      expect(AppEnv.fromName('dev'), AppEnv.dev);
      expect(AppEnv.fromName('staging'), AppEnv.staging);
      expect(AppEnv.fromName('prod'), AppEnv.prod);
    });

    test('fromName 未知值/空值回退 dev', () {
      expect(AppEnv.fromName('unknown'), AppEnv.dev);
      expect(AppEnv.fromName(null), AppEnv.dev);
    });

    test('默认 baseUrl', () {
      expect(AppEnv.dev.baseUrl, 'https://dev.drovio.ai/api');
    });
  });
}
