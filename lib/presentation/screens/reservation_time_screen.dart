import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:keda/presentation/widgets/custom_buttons.dart';
import 'package:provider/provider.dart';

class ReservationTimeScreen extends StatelessWidget {
  const ReservationTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = context.watch<ReservationProvider>();

    final List<double> ventanasHorarias = [10, 15, 30, 45, 60];

    return Material(
      child: Container(
        height: 800,
        width: 800,
        color: Colors.blueAccent,
        child: Column(
          children: [
            Icon(Icons.access_alarm_outlined),
            Column(
              children: [
                const Text('Nombre de usuario'),
                const SizedBox(
                  height: 20,
                ),
                Text('Reservado el ${reservation.dayReservation.toString()}'),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...ventanasHorarias.map((e) => CustomButton(
                          texto: e.toString(),
                          customTab: () {
                            reservation.actualizarDatos(
                                minutesReservation: e.toDouble());
                            context.push('/date');
                          },
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
