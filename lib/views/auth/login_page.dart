// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import './register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe44a),
      appBar: AppBar(
        title: Image.asset(
          '/Users/mac/Documents/MobileApp_Dev/Mobile_1/app_1/assets/last.jpeg', // Replace with your logo asset path
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
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),

            // Log in button
            SizedBox(
              width: double.infinity, // Expands the button to full width
              child: ElevatedButton(
                onPressed: () {
                  // Perform login logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged in!')),
                  );
                },
                child: const Text('Log in'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                  backgroundColor: const Color.fromARGB(
                      255, 115, 119, 125), // Background color
                  foregroundColor: Colors.white, // Text color
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
                  backgroundColor: const Color.fromARGB(
                      255, 115, 119, 125), // Background color
                  foregroundColor: Colors.white, // Text color
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 115, 119, 125), // Background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: const Size(400, 50), // Minimum size
                ),
                onPressed: () {
                  // Handle Create Account button action
                },
                child: const Text(
                  'Log in with Apple',
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ) // Button text
                ),
            const SizedBox(height: 100), // Space between "or" and next button
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
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
