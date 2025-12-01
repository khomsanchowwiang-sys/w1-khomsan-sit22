import 'package:flutter/material.dart';

// ฟังก์ชัน main - จุดเริ่มต้นของแอป
// เรียกใช้ MyApp widget เพื่อเริ่มต้นแอปพลิเคชัน
void main() {
  runApp(const MyApp());
}

// MyApp - Widget หลักของแอปพลิเคชัน
// ทำหน้าที่กำหนดธีม สี และเส้นทางการนำทาง (routes) ทั้งหมด
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // กำหนดธีมสีของแอปเป็นสีม่วง
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // กำหนดหน้าเริ่มต้นเป็นหน้าแรก '/'
      initialRoute: '/',
      // กำหนด routes - เส้นทางการนำทางในแอป
      routes: {
        '/': (context) => const MyHomePage(), // หน้าแรก - หน้าข้อมูลส่วนตัว
        '/second': (context) => const SecondPage(), // หน้าที่ 2 - หน้าสไตล์ TikTok
      },
    );
  }
}

// MyHomePage - หน้าแรกของแอป (หน้าข้อมูลส่วนตัว)
// แสดงข้อมูลส่วนตัวพร้อมรูปโปรไฟล์และรายละเอียดต่างๆ
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ฟังก์ชัน _buildInfoRow - สร้าง Widget แสดงข้อมูลแต่ละแถว
  // รับพารามิเตอร์:
  //   - icon: ไอคอนที่จะแสดง
  //   - color: สีของวงกลมที่หุ้มไอคอน
  //   - label: ชื่อหัวข้อ (เช่น "เบอร์โทรศัพท์")
  //   - value: ค่าข้อมูล (เช่น "0930867452")
  Widget _buildInfoRow(IconData icon, Color color, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container วงกลมหุ้มไอคอน พร้อมเงา
        Container(
          padding: EdgeInsets.all(12), // ระยะห่างภายใน
          decoration: BoxDecoration(
            color: color, // สีพื้นหลัง
            shape: BoxShape.circle, // รูปทรงวงกลม
            boxShadow: [
              // เพิ่มเงาให้ดูมีมิติ
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
            color: Colors.white, // ไอคอนสีขาว
          ),
        ),
        SizedBox(width: 16), // เว้นระยะห่าง
        // Column แสดงชื่อหัวข้อและค่าข้อมูล
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // จัดชิดซ้าย
            children: [
              // ชื่อหัวข้อ (label)
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54, // สีเทาอ่อน
                ),
              ),
              SizedBox(height: 2),
              // ค่าข้อมูล (value)
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87, // สีเข้มกว่า label
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
        // SafeArea - ทำให้เนื้อหาไม่ทับกับ notch หรือแถบสถานะ
        child: Column(
          children: [
            // ========== ส่วนที่ 1: Header (ส่วนบน) ==========
            // Container พื้นหลังไล่เฉดสี (gradient)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // เริ่มจากซ้ายบน
                  end: Alignment.bottomRight, // ไปจบที่ขวาล่าง
                  colors: [
                    Color(0xFF667eea), // สีม่วงอมน้ำเงิน
                    Color(0xFF764ba2), // สีม่วงอมชมพู
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    // หัวข้อหน้า
                    Text(
                      "ข้อมูลส่วนตัว",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.2, // เพิ่มระยะห่างระหว่างตัวอักษร
                      ),
                    ),
                    SizedBox(height: 30),
                    // รูปโปรไฟล์แบบวงกลม
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          // เงาใหญ่ให้ดูลอยขึ้นมา
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white, // ขอบสีขาว
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        // ClipOval - ตัดรูปให้เป็นวงกลม
                        child: Image.network(
                          "https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover, // ครอบคลุมพื้นที่ทั้งหมด
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    // ชื่อ-นามสกุล
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
                    // อีเมล - มีพื้นหลังโปร่งแสง
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // สีขาวโปร่งแสง 20%
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

            // ========== ส่วนที่ 2: เนื้อหาส่วนล่าง (ข้อมูลส่วนตัว) ==========
            Expanded(
              // Expanded - ขยายเต็มพื้นที่ที่เหลือ
              child: SingleChildScrollView(
                // SingleChildScrollView - ทำให้เนื้อหาเลื่อนได้ถ้ายาวเกินหน้าจอ
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // หัวข้อ "ข้อมูลส่วนตัว"
                      Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),

                      // แถวที่ 1: เบอร์โทรศัพท์
                      _buildInfoRow(
                        Icons.phone, // ไอคอนโทรศัพท์
                        Colors.green[300]!, // สีเขียว
                        "เบอร์โทรศัพท์",
                        "0930867452",
                      ),
                      SizedBox(height: 16),

                      // แถวที่ 2: วันเกิด
                      _buildInfoRow(
                        Icons.cake, // ไอคอนเค้ก
                        Colors.pink[300]!, // สีชมพู
                        "วันเกิด",
                        "12 สิงหาคม 2548",
                      ),
                      SizedBox(height: 16),

                      // แถวที่ 3: ที่อยู่
                      _buildInfoRow(
                        Icons.location_on, // ไอคอนหมุดที่ตั้ง
                        Colors.orange[300]!, // สีส้ม
                        "ที่อยู่",
                        "ชลบุรี",
                      ),
                      SizedBox(height: 16),

                      // แถวที่ 4: การศึกษา
                      _buildInfoRow(
                        Icons.school, // ไอคอนโรงเรียน
                        Colors.purple[300]!, // สีม่วง
                        "การศึกษา",
                        "วิทยาลัยภาคตะวันออก(อีเทค)",
                      ),
                      SizedBox(height: 30),

                      // ปุ่มไปหน้า 2
                      SizedBox(
                        width: double.infinity, // ความกว้างเต็มพื้นที่
                        height: 50,
                        child: ElevatedButton(
                          // เมื่อกดปุ่ม จะนำทางไปหน้า '/second'
                          onPressed: () =>
                              Navigator.pushNamed(context, '/second'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700], // สีน้ำเงิน
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), // มุมโค้ง
                            ),
                            elevation: 3, // ความสูงของเงา
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

// SecondPage - หน้าที่ 2 ออกแบบสไตล์ TikTok Profile
// แสดงโปรไฟล์พร้อมสถิติ ปุ่มติดตาม และรูปภาพในรูปแบบ Grid
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ========== AppBar - แถบด้านบน ==========
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // ไม่มีเงา
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // เมื่อกดปุ่มย้อนกลับ จะกลับไปหน้าแรก
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '', // ไม่มีชื่อหัวข้อ
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ========== ส่วนที่ 1: Profile Header ==========
          // แสดงรูปโปรไฟล์และสถิติ 3 คอลัมน์
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // รูปโปรไฟล์แบบวงกลม
                CircleAvatar(
                  radius: 42, // ขนาดรัศมี 42
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg',
                  ),
                ),
                const SizedBox(width: 16),
                // สถิติ 3 คอลัมน์
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // กระจายเท่าๆ กัน
                    children: [
                      _buildStatColumn('108', 'กำลังติดตาม'),
                      _buildStatColumn('34.2 K', 'ผู้ติดตาม'),
                      _buildStatColumn('20', 'ถูกใจเฉลี่ยต่อวัน'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ========== ส่วนที่ 2: ชื่อและ Username ==========
          // แสดงชื่อพร้อมติ๊กน้ำเงิน (Verified)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  'Khomsan Chowwiang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                // ไอคอน Verified สีน้ำเงิน
                const Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          ),
          // Username พร้อมไอคอน TikTok
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.tiktok, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Khomsan Chowwiang',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 16),
              ],
            ),
          ),

          // ========== ส่วนที่ 3: ปุ่มติดตามและแชร์ ==========
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // ปุ่มติดตาม (สีชมพู)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE62860), // สีชมพู TikTok
                      foregroundColor: Colors.white, // สีข้อความ
                      elevation: 0, // ไม่มีเงา
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // มุมโค้งเล็กน้อย
                      ),
                    ),
                    child: const Text(
                      'ติดตาม',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // ปุ่มแชร์
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                  style: IconButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!), // ขอบสีเทา
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ========== ส่วนที่ 4: Photo Grid ==========
          // แสดงรูปภาพในรูปแบบตาราง 2 คอลัมน์
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 คอลัมน์
                crossAxisSpacing: 2, // ระยะห่างระหว่างคอลัมน์
                mainAxisSpacing: 2, // ระยะห่างระหว่างแถว
                childAspectRatio: 0.75, // อัตราส่วนกว้าง:สูง = 0.75:1
              ),
              itemCount: 2, // จำนวนรูป 2 รูป
              itemBuilder: (context, index) {
                // URL ของรูปภาพ
                final imageUrls = [
                  'https://i.pinimg.com/474x/56/3c/dd/563cdd1ee94937a83be125a0229f3785.jpg',
                  'https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg',
                ];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // สีพื้นหลังสีเทาอ่อน
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover, // ครอบคลุมพื้นที่ทั้งหมด
                      // กรณีโหลดรูปผิดพลาด
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline, color: Colors.grey[400]),
                              const SizedBox(height: 8),
                              Text(
                                'Image failed to load',
                                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                      // แสดง Loading ขณะโหลดรูป
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child; // โหลดเสร็จแล้ว
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชัน _buildStatColumn - สร้างคอลัมน์สถิติ
  // รับพารามิเตอร์:
  //   - count: ตัวเลขสถิติ (เช่น "108", "34.2 K")
  //   - label: ชื่อสถิติ (เช่น "กำลังติดตาม", "ผู้ติดตาม")
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        // ตัวเลขสถิติ (ใหญ่และหนา)
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // ชื่อสถิติ (เล็กและสีเทา)
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}