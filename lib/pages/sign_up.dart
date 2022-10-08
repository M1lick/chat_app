import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  var nameController = TextEditingController();
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
                  'Sign in',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Ctextfield(
                controller: nameController,
                prefix: const Icon(Icons.person),
                keyboardType: TextInputType.emailAddress,
                hint: 'Entrez votre Nom',
              ),
              const SizedBox(height: 15),
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
              Ctextfield(
                controller: passController,
                prefix: const Icon(Icons.vpn_key),
                keyboardType: TextInputType.emailAddress,
                hint: 'Confirmez votre mot de pass',
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
                        Navigator.of(context).pop();
                      },
                      child: const Text('connexion'))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
