import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/core/rest_client/custom_dio.dart';

class ApplicationBindings extends StatelessWidget {
  final Widget child;
  const ApplicationBindings({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => CustomDio(),
        ),
      ],
      child: child,
    );
  }
}
