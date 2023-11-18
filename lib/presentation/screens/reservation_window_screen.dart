import 'package:flutter/material.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ReservationWindowScreen extends StatelessWidget {
  const ReservationWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = context.watch<ReservationProvider>();
    final String minutos = reservation.minutesReservation.toString();
    final fechaActual = DateTime.now();
    final List<DateTime> ventanasHorarias = [];

    for (int i = 0; i < 24; i++) {
      // Crear un nuevo DateTime con la hora actual y la hora iterada
      DateTime hora = DateTime(
        fechaActual.year,
        fechaActual.month,
        fechaActual.day,
        i,
      );
      // Agregar la hora a la lista
      ventanasHorarias.add(hora);
    }
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
                Text('Fecha de reservacion $fechaActual $minutos'),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 500,
              width: double.infinity,
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
                    onTap: () {},
                    title: Center(
                        child: Text(
                            " ${DateFormat.Hm().format(ventanasHorarias[index])}")),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
