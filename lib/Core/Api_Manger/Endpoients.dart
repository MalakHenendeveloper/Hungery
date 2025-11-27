class EndPoints {
  static const String baseUrl = 'https://sonic-zdi0.onrender.com/api';

  //auth
  static const String register = '/register';
  static const String login = '/login';

  //product
  static const String products = '/products';
  static const String tops = '/toppings';
  static const String side = '/side-options';
  static const String categories = '/categories';

  //cart
  static const String addCart = '/cart/add';
  static const String getCart = '/cart';
  static const String deleteCart = '/cart/remove';
}
