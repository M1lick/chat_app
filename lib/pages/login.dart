import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/config/function.dart';
import 'sign_up.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Ctextfield(
                controller: emailController,
                prefix: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                hint: 'Entrez votre email',
              ),
              const SizedBox(height: 15),
              Ctextfield(
                controller: passController,
                prefix: const Icon(Icons.vpn_key),
                keyboardType: TextInputType.emailAddress,
                hint: 'Entrez votre mot de pass',
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 20))),
                child: const Text("connextion"),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('avez vous un compte ?'),
                  const SizedBox(width: 10),
                  TextButton(
                      onPressed: () {
                        NavigateToNextPage(context, RegisterPage());
                      },
                      child: const Text('inscription !'))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
