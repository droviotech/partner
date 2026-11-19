enum AppEnv {
  dev('https://dev.drovio.ai/api'),
  staging('https://staging.drovio.ai/api'),
  prod('https://drovio.ai/api');

  const AppEnv(this.baseUrl);

  final String baseUrl;

  static AppEnv fromName(String? name) {
    return AppEnv.values.firstWhere(
      (env) => env.name == name,
      orElse: () => AppEnv.dev,
    );
  }
}
