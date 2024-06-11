/// 定义本地存储键
enum StorageKeyEnum {
  username("username"),
  password("password"),
  accessToken("accessToken"),
  refreshToken("refreshToken");

  final String key;

  const StorageKeyEnum(this.key);
}
