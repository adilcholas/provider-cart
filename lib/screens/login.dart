
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLogin extends StatelessWidget {
   MyLogin({super.key});

  final userNameTextEC = TextEditingController();
  final passwordTextEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(color: const Color.fromARGB(255, 41, 40, 40)),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: userNameTextEC,
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextFormField(
                controller: passwordTextEC,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if(userNameTextEC.text == "adilcholas" && passwordTextEC.text == "9995680149"){
                    context.pushReplacement('/products');
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User not found!")));
                  }
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text('ENTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}