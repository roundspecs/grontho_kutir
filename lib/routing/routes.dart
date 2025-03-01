abstract final class Routes {
  static const home = '/';

  static const booksRelative = 'books';
  static const books = '/$booksRelative';
  static String bookWithId(String id) => '$books/$id';

  static const profileRelative = 'profile';
  static const profile = '/$profileRelative';

  static const settingsRelative = 'settings';
  static const settings = '/$settingsRelative';

  static const logInRelative = 'login';
  static const logIn = '/$logInRelative';

  static const registerRelative = 'register';
  static const register = '/$registerRelative';

  static const notFoundRelative = 'not-found';
  static const notFound = '/$notFoundRelative';

  static const unauthRoutes = [logIn, register, books];
}
