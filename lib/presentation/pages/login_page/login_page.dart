import 'package:flix_id/presentation/extensions/build_context_extensions.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/flix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100),
          Center(
            child: Image.asset(
              'assets/images/flix_logo.png',
              width: 150,
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Column(
              children: [
                FlixTextField(
                  labelText: 'email',
                  controller: emailController,
                ),
                SizedBox(
                  height: 24,
                ),
                FlixTextField(
                  labelText: 'password',
                  controller: passwordController,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 24,
                ),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                ref.read(userDataProvider.notifier).login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account?"),
                    TextButton(
                        onPressed: () {
                          ref.read(routerProvider).goNamed('register');
                        },
                        child: Text(
                          'Register here',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
