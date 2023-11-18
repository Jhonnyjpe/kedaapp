import 'package:go_router/go_router.dart';
import 'package:keda/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ReservationTimeScreen(),
    ),
    GoRoute(
      path: '/date',
      builder: (context, state) => ReservationDateScreen(),
    ),
    GoRoute(
      path: '/window',
      builder: (context, state) => ReservationWindowScreen(),
    ),
  ],
);
