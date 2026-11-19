class ApiConfig {
  const ApiConfig({
    required this.baseUrl,
    this.projectPrefix = '/h/', // 合作方端前缀（暂定）
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 30),
  });

  final String baseUrl;
  final String projectPrefix;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  String resolve(String path) {
    final prefix = projectPrefix.endsWith('/')
        ? projectPrefix
        : '$projectPrefix/';
    final p = path.startsWith('/') ? path.substring(1) : path;
    return '$baseUrl$prefix$p';
  }
}
