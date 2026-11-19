import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/auth/session_store.dart';

void main() {
  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('读写与清理 token/operator', () async {
    final store = SecureSessionStore(storage: const FlutterSecureStorage());
    expect(await store.readToken(), isNull);

    await store.writeToken('tok-1');
    await store.writeOperatorId('op-7');
    expect(await store.readToken(), 'tok-1');
    expect(await store.readOperatorId(), 'op-7');

    await store.clear();
    expect(await store.readToken(), isNull);
    expect(await store.readOperatorId(), isNull);
  });
}
