abstract class LocalRepository {
  Future<void> storeToken(String token);
  String? getToken();
  Future<bool> removeToken();
  Future<void> storeEmail(String token);
  String getEmail();
  Future<bool> removeEmail();
  Future<void> storeFlavor(String flavor);
  String? getFlavor();
  Future<void> logout();
  String? getRefreshToken();
  Future<void> storeRefreshToken(String refreshToken);
  Future<bool> isFirstLaunch();
  Future<void> setFirstLaunchCompleted();
  Future<bool> isDeviceRemembered();
  Future<void> setDeviceRemembered({required bool remembered});
  Future<bool> getBiometricsEnabled();
  Future<void> setBiometricsEnabled({required bool enabled});
  Future<bool> isFirstLogin();
  Future<void> setFirstLogin({required bool value});
  Future<void> storePassword(String password);
  Future<String?> getPassword();
  Future<void> removePassword();
  Future<void> clearFcmToken();
  Future<String?> getFcmToken();
  Future<void> storeFcmToken(String token);
}
