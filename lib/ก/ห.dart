import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Using useMaterial3: true for modern Flutter styling
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        // Column fills the entire available screen space
        child: Column(
          // CHANGED: Sets content alignment to the START (top) of the screen
          mainAxisAlignment: MainAxisAlignment.start,
          // Retained: Centers the children horizontally within the column's full width
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add padding to create space below the AppBar/Safe Area
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                  "ข้อมูลส่วนตัว",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                  )
              ),
            ),
            const SizedBox(height: 20),
            // Profile Image (Circular)
            ClipOval(
              child: Image.network(
                // Placeholder image URL
                "https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg",
                width: 150, // Set the image width
                height: 150, // Set the image height
                fit: BoxFit.cover, // Scale the image to cover the circular area
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.person, size: 80, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Name
            const Text(
                "Khomsan Chowwiang",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                )
            ),
            const SizedBox(height: 5),
            // Optional: A subtitle or role
            const Text(
                "Mobile Developer",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                )
            ),
          ],
        ),
      ),
    );
  }
}