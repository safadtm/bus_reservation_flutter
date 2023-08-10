import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Admin Login', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4,),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                      filled: true,
                      labelText: 'Username'
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  obscureText: isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _login() async {
    if (_formKey.currentState!.validate()) {
      final userName = _userNameController.text;
      final password = _passwordController.text;
    }
  }
}
