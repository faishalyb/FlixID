import 'package:flix_id/presentation/extensions/build_context_extensions.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref
                  .read(userDataProvider.notifier)
                  .login(email: 'faishalyb@gmail.com', password: '123123');
            },
            child: Text('Login')),
      ),
    );
  }
}
