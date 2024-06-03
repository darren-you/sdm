enum DioConfig {
  baseUrl(key: "baseUrl"),
  otherUrl(key: "normal");

  final String key;

  const DioConfig({
    required this.key,
  });
}
