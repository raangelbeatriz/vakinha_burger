import 'package:flutter/material.dart';

import '../../core/config/env/env.dart';
import '../../core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Column(
          children: [
            DeliveryButton(
                onPressed: () {}, label: Env.i['backend_base_url'] ?? ''),
            TextFormField(
              decoration: const InputDecoration(labelText: 'testando'),
            )
          ],
        ),
      ),
    );
  }
}
