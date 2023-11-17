import 'package:flutter/material.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:keda/presentation/screens/reservation_time_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ReservationProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        title: 'Material App',
        home: ReservationTimeScreen(),
      ),
    );
  }
}
