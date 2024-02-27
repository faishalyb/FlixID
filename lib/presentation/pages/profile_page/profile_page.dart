import 'package:flix_id/presentation/pages/profile_page/methods/profile_item.dart';
import 'package:flix_id/presentation/pages/profile_page/methods/user_info.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 20),
              ...userInfo(ref),
              SizedBox(height: 20),
              const Divider(),
              SizedBox(height: 20),
              profileItem('UpdateProfile'),
              SizedBox(height: 20),
              profileItem('My Wallet'),
              SizedBox(height: 20),
              profileItem('Change Password'),
              SizedBox(height: 20),
              profileItem('Change Language'),
              SizedBox(height: 20),
              SizedBox(height: 20),
              const Divider(),
              SizedBox(height: 20),
              profileItem('UpdateProfile'),
              SizedBox(height: 20),
              profileItem('UpdateProfile'),
              SizedBox(height: 20),
              profileItem('UpdateProfile'),
              SizedBox(height: 60),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        ref.read(userDataProvider.notifier).logout();
                      },
                      child: const Text('Logout'))),
              SizedBox(height: 20),
              const Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 100)
            ],
          ),
        )
      ],
    );
  }
}
