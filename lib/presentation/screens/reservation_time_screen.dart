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
    final List<double> ventanasHorarias = [5, 10, 15, 30, 45, 60];
    return Material(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: 800,
          child: Column(
            children: [
              Expanded(
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 35, left: 35, top: 30),
                      child: Text(
                        'Hola',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Bienvenido a mi página de reservaciones. Siga las instrucciones para agregar un evento a mi calendario.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Seleccione cuanto tiempo desea reservar'),
              Expanded(
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...ventanasHorarias.map((e) => CustomButton(
                              texto: "${e.toString()} Minutos",
                              customTab: () {
                                reservation.actualizarDatos(
                                    minutesReservation: e.toDouble());
                                context.push('/date');
                              },
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
