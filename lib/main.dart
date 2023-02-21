import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';
import 'app/vakinha_burguer_app.dart';

Future<void> main() async {
  await Env.i.load();

  runApp(
    VakinhaBurguerApp(),
  );
}
