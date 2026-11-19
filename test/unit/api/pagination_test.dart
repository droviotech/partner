import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/api/pagination.dart';

void main() {
  test('PageRequest 默认值与查询参数', () {
    const request = PageRequest();
    expect(request.page, 1);
    expect(request.pageSize, 20);
    expect(request.toQueryParameters(), {'page': 1, 'page_size': 20});
  });

  test('PageRequest 翻页', () {
    const request = PageRequest(page: 2, pageSize: 50);
    expect(request.next().page, 3);
    expect(request.next().pageSize, 50);
  });

  test('PageRequest 非法参数断言', () {
    expect(() => PageRequest(page: 0), throwsAssertionError);
    expect(() => PageRequest(pageSize: 201), throwsAssertionError);
  });

  test('PageResult 解析与 hasMore', () {
    final result = PageResult.fromJson({
      'items': [
        {'id': 1},
        {'id': 2},
      ],
      'total': 35,
    }, (json) => (json as Map<String, dynamic>)['id'] as int);
    expect(result.items, [1, 2]);
    expect(result.total, 35);
    expect(result.hasMore, isTrue);
  });
}
