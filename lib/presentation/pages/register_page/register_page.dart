import 'package:flix_id/presentation/extensions/build_context_extensions.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/flix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        ref.read(routerProvider).goNamed('main');
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'assets/images/flix_logo.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    FlixTextField(
                        labelText: 'Email', controller: emailController),
                    const SizedBox(height: 24),
                    FlixTextField(
                        labelText: 'Name', controller: nameController),
                    const SizedBox(height: 24),
                    FlixTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    FlixTextField(
                      labelText: 'Retype Password',
                      controller: retypePasswordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    switch (ref.watch(userDataProvider)) {
                      AsyncData(:final value) => value == null
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (passwordController.text ==
                                        retypePasswordController.text) {
                                      ref
                                          .read(userDataProvider.notifier)
                                          .register(
                                              email: emailController.text,
                                              name: nameController.text,
                                              password:
                                                  passwordController.text);
                                    } else {
                                      context.showSnackBar(
                                          'Please retype your Password with the same value!');
                                    }
                                  },
                                  child: const Text(
                                    'Register',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        )
                    },
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an Account?"),
                        TextButton(
                            onPressed: () {
                              ref.read(routerProvider).goNamed('login');
                            },
                            child: const Text(
                              'Login Here',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
