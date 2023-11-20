import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:provider/provider.dart';

class ReservationTimeScreen extends StatelessWidget {
  const ReservationTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = context.watch<ReservationProvider>();
    final String minutos = reservation.minutesReservation.toString();

    final List<double> ventanasHorarias = [15, 30, 45, 60];

    return Material(
      child: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
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
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: ventanasHorarias.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: const Icon(Icons.arrow_right),
                    tileColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onTap: () {
                      reservation.actualizarDatos(
                          minutesReservation: ventanasHorarias[index]);
                      context.push('/date');
                    },
                    title: Center(
                        child: Text(
                            "Reservar ${ventanasHorarias[index].toString()} minutos")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
