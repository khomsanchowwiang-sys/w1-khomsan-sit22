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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _buildInfoRow(IconData icon, Color color, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF667eea),
                    Color(0xFF764ba2),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "ข้อมูลส่วนตัว",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Khomsan Chowwiang",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Khomsan.chowwiang@e-tech.ac.th",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),

                      _buildInfoRow(
                        Icons.phone,
                        Colors.green[300]!,
                        "เบอร์โทรศัพท์",
                        "0930867452",
                      ),
                      SizedBox(height: 16),

                      _buildInfoRow(
                        Icons.cake,
                        Colors.pink[300]!,
                        "วันเกิด",
                        "12 สิงหาคม 2548",
                      ),
                      SizedBox(height: 16),

                      _buildInfoRow(
                        Icons.location_on,
                        Colors.orange[300]!,
                        "ที่อยู่",
                        "ชลบุรี",
                      ),
                      SizedBox(height: 16),

                      _buildInfoRow(
                        Icons.school,
                        Colors.purple[300]!,
                        "การศึกษา",
                        "วิทยาลัยภาคตะวันออก(อีเทค)",
                      ),
                      SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/second'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            "ไปยังหน้า 2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Second Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
