import 'package:flutter/material.dart';

void main() {
  runApp(HoplrLoginApp());
}

class HoplrLoginApp extends StatelessWidget {
  const HoplrLoginApp(
      {super.key}); // Use 'super.key' to simplify the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoplr App Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Add named 'key' parameter

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Use 'const' for the SnackBar constructor
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logging in...'), // 'const' because the Text is static
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoplr App Login'), // 'const' for static Text
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // 'const' for EdgeInsets since it's fixed
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // 'const' for TextFormField if it has static content
                decoration: InputDecoration(
                    labelText: 'Email'), // 'const' for InputDecoration
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                  height: 16.0), // 'const' for SizedBox with fixed size
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(
                  height: 32.0), // 'const' for SizedBox with fixed size
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Login'), // 'const' for static Text
              ),
              TextButton(
                onPressed: () {
                  // Handle "Forgot Password" logic
                },
                child:
                    const Text('Forgot Password?'), // 'const' for static Text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
