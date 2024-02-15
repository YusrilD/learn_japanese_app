enum Environment {
  development,
  production,
}

class AppConfig {
  final String baseUrl;

  AppConfig({required this.baseUrl});

  static AppConfig forEnvironment(Environment env) {
    switch (env) {
      case Environment.development:
        return AppConfig(baseUrl: "https://script.google.com/");
      case Environment.production:
        return AppConfig(baseUrl: "http://myirsapi.irasa.co.id/");
      default:
        throw Exception('Invalid environment: $env');
    }
  }
}

const selectedEnvironment = Environment.development;
final apiBase = AppConfig.forEnvironment(selectedEnvironment);
