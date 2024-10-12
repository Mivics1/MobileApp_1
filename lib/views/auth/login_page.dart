// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import '../homepage/home_page.dart';
import './register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe44a),
      appBar: AppBar(
        title: Image.asset(
          '/Users/mac/Documents/MobileApp_Dev/Mobile_1/MobileApp_1/assets/last.jpeg', // Replace with your logo asset path
          height: 50, // Adjust the height as necessary
        ), // App bar title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                filled: true,
                fillColor: Color(0xFFFFFFFF), // Background color for TextField
              ),
            ),
            const SizedBox(height: 20),
            // Password TextField
            TextField(
              obscureText: _isObscured, // Controls whether to obscure the text
              controller: _passwordController,
              // obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                filled: true,
                fillColor:
                    const Color(0xFFFFFFFF), // Background color for TextField
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured; // Toggle password visibility
                    });
                  },
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   borderSide: BorderSide.none, // Removes the default border
                // ),
                // enabledBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   borderSide: BorderSide(
                //     color: Colors.blueAccent, // Border color when not focused
                //     width: 2.0,
                //   ),
              ),
            ),
            const SizedBox(height: 20),

            // Log in button
            SizedBox(
              width: double.infinity, // Expands the button to full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                  // Perform login logic
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Logged in!')),
                  // );
                },
                child: const Text('Log in'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontFamily: 'Lato'),
                  foregroundColor: const Color(0xFF000000),
                  minimumSize: const Size(400, 50), // Minimum size
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            // Divider with "or"
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider()), // Left line
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or'), // "or" text
                ),
                Expanded(child: Divider()), // Right line
              ],
            ),
            const SizedBox(height: 20), // Space between "or" and next button
            // Create Account Button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFffffff), // Background color
                  foregroundColor: const Color(0xFF1877F2), // Text color
                  minimumSize: const Size(400, 50), // Minimum size
                ),
                onPressed: () {
                  // Handle Create Account button action
                },
                child: const Text(
                  'Log in with Facebook',
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ) // Button text
                ),
            const SizedBox(height: 20), // Space between "or" and next button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF), // Background color
                  foregroundColor: const Color(0xFFEA4335), // Text color
                  minimumSize: const Size(400, 50), // Minimum size
                ),
                onPressed: () {
                  // Handle Create Account button action
                },
                child: const Text(
                  'Log in with Google',
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ) // Button text
                ),
            const SizedBox(height: 20), // Space between "or" and next button
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color.fromARGB(
            //           255, 115, 119, 125), // Background color
            //       foregroundColor: Colors.white, // Text color
            //       minimumSize: const Size(400, 50), // Minimum size
            //     ),
            //     onPressed: () {
            //       // Handle Create Account button action
            //     },
            //     child: const Text(
            //       'Log in with Apple',
            //       style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
            //     ) // Button text
            //     ),
            const SizedBox(height: 60), // Space between "or" and next button
            // "Not a member yet? Register here" text
            TextButton(
              onPressed: () {
                // Navigate to the registration page when this text is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccountPage()),
                );
              },
              child: const Text(
                'Not a member yet? Register here',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
