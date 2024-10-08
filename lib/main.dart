import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './views/auth/login_page.dart';
import './views/auth/register_page.dart';

void main() {
  runApp(const HoplrApp());
}

// Main application widget
class HoplrApp extends StatelessWidget {
  const HoplrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoplr App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _LandingPage(), // Landing page as the home widget
    );
  }
}

// Landing page widget
class _LandingPage extends StatefulWidget {
  const _LandingPage();

  @override
  _LandingPageState createState() => _LandingPageState();
}

// State class for LandingPage
class _LandingPageState extends State<_LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _quoteIndex = 0; // Index to track the current quote

  // List of quotes
  final List<String> _quotes = [
    "Welcome to Dudelunge",
    "Community is where life begins.",
    "Connection is the key to growth.",
    "Support your neighbors, strengthen your community.",
    "Hoplr: Building better neighborhoods together."
  ];

  @override
  void initState() {
    super.initState();
    // Animation controller for fade effect
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true); // Repeat animation

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Automatically change quotes every few seconds
    Future.delayed(const Duration(seconds: 5), _changeQuote);
  }

  // Function to change quotes
  void _changeQuote() {
    setState(() {
      _quoteIndex = (_quoteIndex + 1) % _quotes.length; // Cycle through quotes
    });

    // Repeat the function every 5 seconds
    Future.delayed(const Duration(seconds: 5), _changeQuote);
  }

  // Function to edit a quote
  void _editQuote(int index) {
    showDialog(
      context: context,
      builder: (context) {
        // TextEditingController to manage text input
        final TextEditingController controller =
            TextEditingController(text: _quotes[index]);

        return AlertDialog(
          title: const Text('Edit Quote'), // Title of the dialog
          content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(labelText: 'Quote'), // Input label
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _quotes[index] = controller.text; // Update the quote
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Save'), // Save button
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel button
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffe44a),
      appBar: AppBar(
        title: Image.asset(
          '/Users/mac/Documents/MobileApp_Dev/Mobile_1/app_1/assets/last.jpeg', // Replace with your logo asset path
          height: 50, // Adjust the height as necessary
        ), // App bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // Moving Quotes
            FadeTransition(
              opacity: _animation,
              child: GestureDetector(
                onTap: () => _editQuote(_quoteIndex), // Edit quote on tap
                child: Text(
                  _quotes[_quoteIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),

            // Log In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF305D), // Background color
                foregroundColor: Colors.white, // Text color
                minimumSize: const Size(400, 50), // Minimum size
              ),
              onPressed: () {
                // Navigate to the login page when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Already a member? Log in',
                style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
              ), // Button text
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
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                );
                  // Handle Create Account button action
                },
                child: const Text(
                  'New? Create account',
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ) // Button text
                ),
          ],
        ),
      ),
    );
  }
}
