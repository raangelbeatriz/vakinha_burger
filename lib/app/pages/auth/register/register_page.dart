import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
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
                  height: 30,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirma senha'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    width: double.infinity,
                    onPressed: () {},
                    label: 'CADASTRAR',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
