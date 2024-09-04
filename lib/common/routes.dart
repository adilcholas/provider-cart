import 'package:go_router/go_router.dart';
import 'package:provider_cart/screens/cart.dart';
import 'package:provider_cart/screens/products.dart';
import 'package:provider_cart/screens/login.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => MyLogin(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const MyProducts(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      ),
    ],
  );
}