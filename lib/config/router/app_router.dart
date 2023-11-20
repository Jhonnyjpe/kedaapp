import 'package:go_router/go_router.dart';
import 'package:keda/presentation/screens/form_screen.dart';
import 'package:keda/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ReservationWindowScreen(),
    ),
    GoRoute(
      path: '/date',
      builder: (context, state) => ReservationDateScreen(),
    ),
    GoRoute(
      path: '/window',
      builder: (context, state) => ReservationWindowScreen(),
    ),
    GoRoute(
      path: '/forms',
      builder: (context, state) => FormScreen(),
    ),
  ],
);
