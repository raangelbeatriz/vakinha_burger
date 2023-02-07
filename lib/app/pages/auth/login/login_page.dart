import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_button.dart';

import '../../../core/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: context.textStyles.textTitle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DeliveryButton(
                        width: double.infinity,
                        onPressed: () {},
                        label: 'ACESSAR'),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Não possui conta?',
                    style: context.textStyles.textBold,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: Text(
                      'Cadastre-se',
                      style: context.textStyles.textBold
                          .copyWith(color: Colors.blue),
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
