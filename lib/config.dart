//flavors if needed, but not for this project.

class Config {
  static String baseUrl(String? flavor) {
    switch (flavor) {
      case 'prod':
        return '';
      case 'dev':
      case null:
        return '';
    }
    return '';
  }
}
