class PageRequest {
  const PageRequest({this.page = 1, this.pageSize = 20})
    : assert(page >= 1, 'page must be >= 1'),
      assert(pageSize >= 1 && pageSize <= 200, 'pageSize must be 1..200');

  final int page;
  final int pageSize;

  Map<String, dynamic> toQueryParameters() => {
    'page': page,
    'page_size': pageSize,
  };

  PageRequest next() => PageRequest(page: page + 1, pageSize: pageSize);
}

class PageResult<T> {
  const PageResult({required this.items, required this.total});

  final List<T> items;
  final int total;

  factory PageResult.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) itemDecoder,
  ) {
    final items = (json['items'] as List<dynamic>? ?? const [])
        .map(itemDecoder)
        .toList(growable: false);
    return PageResult<T>(
      items: items,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );
  }

  bool get hasMore => items.length < total;
}
