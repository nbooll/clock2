import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getStreamOfData(99999),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Image.asset('image/back.png'),
                  Transform.rotate(
                    angle: snapshot.data * (pi / 180) / 60 / 12,
                    child: Image.asset('image/h.png'),
                  ),
                  Transform.rotate(
                    angle: snapshot.data * (pi / 180) / 60,
                    child: Image.asset('image/m.png'),
                  ),
                  Transform.rotate(
                    angle: snapshot.data * (pi / 180),
                    child: Image.asset('image/s.png'),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Stream getStreamOfData(int Max) async* {
  for (var i = 0; i < Max; i += 6) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield i;
  }
}
