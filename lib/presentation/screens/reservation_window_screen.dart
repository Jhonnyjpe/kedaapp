import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        minimum: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                const Text('Nombre de usuario'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'Reservar $minutos minutos el ${reservation.dayReservation} '),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Flexible(
              child: Container(
                width: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: ventanasHorarias.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.purpleAccent)),
                        onPressed: () {
                          context.push(
                            '/forms',
                          );
                        },
                        child: Text(
                            " ${DateFormat.Hm().format(ventanasHorarias[index])}"));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
