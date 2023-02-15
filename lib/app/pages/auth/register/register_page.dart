import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_button.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
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
                  controller: _nameController,
                  validator: Validatorless.required('Nome obrigatório'),
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: Validatorless.multiple([
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email inválido'),
                  ]),
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(
                      6,
                      'Senha deve ter no mínimo 6 caracteres',
                    )
                  ]),
                  decoration: const InputDecoration(labelText: 'Senha'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirmação de senha obrigatória'),
                    Validatorless.compare(
                      _passwordController,
                      'As senhas estão diferentes',
                    ),
                  ]),
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
