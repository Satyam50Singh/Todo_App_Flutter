class NetworkConstants {
  static const String baseUrl = 'https://dummyjson.com';
  static const String baseTodoWebApiUrl = 'http://192.168.1.5:8100/api';
  static const int timeout = 60;

  static const String contentType = 'Content-Type';

  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authRefreshToken = '/auth/refresh_token';
  static const String addTodo = '/todo/add_todo';
  static const String deleteTodo = '/todo/delete_todo';
  static const String updateTodo = '/todo/update_todo';
  static const String getTodos = '/todo/get_todo';
}
