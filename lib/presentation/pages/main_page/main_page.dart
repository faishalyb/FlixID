import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  final User user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: Text(ref.watch(userDataProvider).when(
            data: (data) => data.toString(),
            error: (error, StackTrace) => '',
            loading: () => 'Loading')),
      ),
    );
  }
}
