import 'package:flutter/material.dart';

class ReservationTimeScreen extends StatelessWidget {
  const ReservationTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              Column(
                children: [
                  Text('Nombre de usuario / empresa'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Aliqua nostrud dolore sint tempor excepteur irure qui velit in tempor.'),
                ],
              ),
              Text('data')
            ],
          ),
        ),
      ),
    );
  }
}
