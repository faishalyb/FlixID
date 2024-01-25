// import 'package:flix_id/data/dummies/dummy_authentication.dart';
// import 'package:flix_id/data/dummies/dummy_user_repository.dart';
import 'package:flix_id/data/firebase/firebase_authentication.dart';
import 'package:flix_id/data/firebase/firebase_repository.dart';
import 'package:flix_id/domain/usecases/login/login.dart';
import 'package:flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page')
        ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Login login = Login(
            authentication: FirebaseAuthentication(),
            userRepository: FirebaseUserRepository());

            login(LoginParams(email: 'email', password: 'password'))
            .then((result) {
              if (result.isSuccess) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage(user: result.resultValue!),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(result.errorMessage!),
                  ));
              }
            }
            );
        }, child: Text('Login')),
      ),
    );
  }
}