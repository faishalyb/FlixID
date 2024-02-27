import 'package:flix_id/presentation/extensions/build_context_extensions.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: Column(
          children: [
            Text(ref.watch(userDataProvider).when(
                data: (data) => data.toString(),
                error: (error, StackTrace) => '',
                loading: () => 'Loading')),
            ElevatedButton(
                onPressed: () {
                  ref.read(userDataProvider.notifier).logout();
                },
                child: Text('Logout')),
            const SizedBox(
              height: 50,
            ),
            const BottomNavbarItem(
                index: 0,
                isSelected: true,
                title: 'Home',
                image: 'assets/images/movie.png ',
                selectedImage: 'assets/images/movie-selected.png')
          ],
        ),
      ),
    );
  }
}
