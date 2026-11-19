import 'package:partner/core/api/api_config.dart';
import 'app_env.dart';

class AppConfig {
  const AppConfig({required this.env, required this.apiConfig});

  final AppEnv env;
  final ApiConfig apiConfig;

  factory AppConfig.fromDartDefines() {
    const envName = String.fromEnvironment('APP_ENV');
    const baseUrl = String.fromEnvironment('API_BASE_URL');
    final env = AppEnv.fromName(envName.isEmpty ? null : envName);
    return AppConfig(
      env: env,
      apiConfig: ApiConfig(baseUrl: baseUrl.isEmpty ? env.baseUrl : baseUrl),
    );
  }
}
