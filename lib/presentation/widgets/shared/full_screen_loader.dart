import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando palomitas de maiz',
      'Cargando populares',
      'Esto esta tardando mucho',
    ];

    return Stream.periodic(Duration(milliseconds: 3000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('aaaaaa'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 3),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Cargando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
