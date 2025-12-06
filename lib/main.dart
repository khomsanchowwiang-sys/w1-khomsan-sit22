import 'package:flutter/material.dart';

// ฟังก์ชัน main - จุดเริ่มต้นของแอปพลิเคชัน
// เรียกใช้ MyApp widget เพื่อเริ่มต้นแอปพลิเคชัน
void main() {
  runApp(const MyApp());
}

// MyApp - Widget หลักของแอปพลิเคชัน (StatelessWidget)
// ทำหน้าที่กำหนดโครงสร้างพื้นฐาน, ธีม, และเส้นทางการนำทาง (routes) ทั้งหมด
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // กำหนดธีมสีของแอป
      theme: ThemeData(
        // สร้างชุดสีจากสีหลัก (seedColor) คือสีม่วงเข้ม
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // กำหนดหน้าเริ่มต้นเมื่อแอปเปิด คือหน้า '/'
      initialRoute: '/',
      // กำหนด Named Routes (เส้นทางการนำทางด้วยชื่อ)
      routes: {
        // '/': Route สำหรับหน้าแรก (หน้าข้อมูลส่วนตัว)
        '/': (context) => const MyHomePage(),
        // '/second': Route สำหรับหน้าที่ 2 (หน้าสไตล์ TikTok)
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

// MyHomePage - หน้าแรกของแอป (หน้าข้อมูลส่วนตัว)
// แสดงข้อมูลส่วนตัวพร้อมรูปโปรไฟล์และรายละเอียดต่างๆ
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ฟังก์ชัน _buildInfoRow - สร้าง Widget แสดงข้อมูลแต่ละแถวในส่วนล่าง
  // Widget นี้ถูกสร้างเป็นเมธอดส่วนตัวเพื่อความสะดวกในการนำกลับมาใช้ซ้ำ (Reusability)
  Widget _buildInfoRow(IconData icon, Color color, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // จัดตำแหน่งตามแนวแกน Cross (แนวตั้ง)
      children: [
        // Container วงกลมหุ้มไอคอน พร้อมเงา
        Container(
          padding: const EdgeInsets.all(12), // ระยะห่างภายใน
          decoration: BoxDecoration(
            color: color, // สีพื้นหลังที่รับมา
            shape: BoxShape.circle, // กำหนดรูปทรงเป็นวงกลม
            boxShadow: [
              // เพิ่มเงาให้ดูมีมิติ
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon, // ไอคอนที่รับมา
            size: 28,
            color: Colors.white, // ไอคอนสีขาว
          ),
        ),
        const SizedBox(width: 16), // เว้นระยะห่างระหว่างไอคอนกับข้อความ
        // Column แสดงชื่อหัวข้อและค่าข้อมูล
        Expanded(
          // Expanded ทำให้ Column ขยายเต็มพื้นที่ที่เหลือในแนวนอน
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // จัดชิดซ้าย
            children: [
              // ชื่อหัวข้อ (label)
              Text(
                label, // ชื่อหัวข้อที่รับมา
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54, // สีเทาอ่อน
                ),
              ),
              const SizedBox(height: 2),
              // ค่าข้อมูล (value)
              Text(
                value, // ค่าข้อมูลที่รับมา
                style: const TextStyle(
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
        // SafeArea - ป้องกันเนื้อหาไม่ให้ทับกับ notch, กล้อง, หรือแถบสถานะของระบบ
        child: Column(
          children: [
            // ========== ส่วนที่ 1: Header (ส่วนบน) - พื้นหลัง Gradient ==========
            Container(
              decoration: const BoxDecoration(
                // LinearGradient สร้างพื้นหลังไล่เฉดสี
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // เริ่มจากซ้ายบน
                  end: Alignment.bottomRight, // ไปจบที่ขวาล่าง
                  colors: [
                    Color(0xFF667eea), // สีม่วงอมน้ำเงิน
                    Color(0xFF764ba2), // สีม่วงอมชมพู
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    // หัวข้อหน้า
                    const Text(
                      "ข้อมูลส่วนตัว",
                      // ... TextStyle ...
                    ),
                    const SizedBox(height: 30),
                    // รูปโปรไฟล์แบบวงกลม
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          // เงาให้ดูลอยขึ้นมา
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white, // ขอบสีขาวรอบรูป
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        // ClipOval - ตัด Widget ลูก (Image.network) ให้เป็นวงกลม
                        child: Image.network(
                          "https://i.pinimg.com/736x/10/6a/17/106a170e30497a062bedfb9c3e0dca63.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover, // ครอบคลุมพื้นที่ทั้งหมดของ Container
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // ชื่อ-นามสกุล
                    const Text(
                      "Khomsan Chowwiang",
                      // ... TextStyle ...
                    ),
                    const SizedBox(height: 10),
                    // อีเมล - มีพื้นหลังโปร่งแสง
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // สีขาวโปร่งแสง 20%
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Khomsan.chowwiang@e-tech.ac.th",
                        // ... TextStyle ...
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // ========== ส่วนที่ 2: เนื้อหาส่วนล่าง (ข้อมูลส่วนตัว) - เลื่อนได้ ==========
            Expanded(
              // Expanded - ขยายเต็มพื้นที่ว่างที่เหลือในแนวตั้ง
              child: SingleChildScrollView(
                // SingleChildScrollView - ทำให้เนื้อหาสามารถเลื่อน (Scroll) ได้
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // หัวข้อ "ข้อมูลส่วนตัว"
                      const Text(
                        "ข้อมูลส่วนตัว",
                        // ... TextStyle ...
                      ),
                      const SizedBox(height: 20),

                      // แถวที่ 1: เบอร์โทรศัพท์ (เรียกใช้ _buildInfoRow)
                      _buildInfoRow(
                        Icons.phone, // ไอคอน
                        Colors.green[300]!, // สีวงกลม
                        "เบอร์โทรศัพท์", // หัวข้อ
                        "0930867452", // ค่าข้อมูล
                      ),
                      const SizedBox(height: 16),

                      // แถวที่ 2: วันเกิด
                      _buildInfoRow(
                        Icons.cake,
                        Colors.pink[300]!,
                        "วันเกิด",
                        "12 สิงหาคม 2548",
                      ),
                      const SizedBox(height: 16),

                      // แถวที่ 3: ที่อยู่
                      _buildInfoRow(
                        Icons.location_on,
                        Colors.orange[300]!,
                        "ที่อยู่",
                        "ชลบุรี",
                      ),
                      const SizedBox(height: 16),

                      // แถวที่ 4: การศึกษา
                      _buildInfoRow(
                        Icons.school,
                        Colors.purple[300]!,
                        "การศึกษา",
                        "วิทยาลัยภาคตะวันออก(อีเทค)",
                      ),
                      const SizedBox(height: 30),

                      // ปุ่มไปหน้า 2
                      SizedBox(
                        width: double.infinity, // ความกว้างเต็มพื้นที่
                        height: 50,
                        child: ElevatedButton(
                          // เมื่อกดปุ่ม จะใช้ Navigator นำทางไป Route ที่ชื่อ '/second'
                          onPressed: () =>
                              Navigator.pushNamed(context, '/second'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700], // สีน้ำเงิน
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), // มุมโค้งมน
                            ),
                            elevation: 3, // ความสูงของเงา
                          ),
                          child: const Text(
                            "ไปยังหน้า 2",
                            // ... TextStyle ...
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

// SecondPage - หน้าที่ 2
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // ฟังก์ชัน _buildStatColumn - สร้างคอลัมน์แสดงสถิติ (ตัวเลขและป้ายกำกับ)
  // ใช้สำหรับแสดง "กำลังติดตาม", "ผู้ติดตาม", "ถูกใจเฉลี่ย"
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ========== AppBar - แถบด้านบน ==========
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // ไม่มีเงา (เหมือน TikTok)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // เมื่อกดปุ่มย้อนกลับ จะกลับไปหน้าแรกโดยใช้ Navigator.pop
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
          // ========== ส่วนที่ 1: Profile Header - รูปและสถิติ ==========
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // รูปโปรไฟล์แบบวงกลม
                const CircleAvatar(
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
                      _buildStatColumn('108', 'กำลังติดตาม'), // 1. กำลังติดตาม
                      _buildStatColumn('34.2 K', 'ผู้ติดตาม'), // 2. ผู้ติดตาม
                      _buildStatColumn('20', 'ถูกใจเฉลี่ยต่อวัน'), // 3. ถูกใจ
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ========== ส่วนที่ 2: ชื่อและ Username (รวม Verified Badge) ==========
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  'Khomsan Chowwiang',
                  // ... TextStyle ...
                ),
                const SizedBox(width: 4),
                // ไอคอน Verified สีน้ำเงิน (ติ๊กถูก)
                const Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          ),
          // Username พร้อมไอคอน TikTok (จำลองสไตล์)
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

          // ========== ส่วนที่ 3: ปุ่มติดตาม (Follow) และ แชร์ (Share) ==========
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
                      // ... TextStyle ...
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // ปุ่มแชร์ (Share)
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

          // ========== ส่วนที่ 4: Photo Grid - ตารางรูปภาพ ==========
          Expanded(
            // Expanded ทำให้ GridView กินพื้นที่ที่เหลือทั้งหมด
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              // SliverGridDelegate กำหนดรูปแบบของตาราง (2 คอลัมน์คงที่)
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 คอลัมน์
                crossAxisSpacing: 2, // ระยะห่างระหว่างคอลัมน์
                mainAxisSpacing: 2, // ระยะห่างระหว่างแถว
                childAspectRatio: 0.75, // อัตราส่วน กว้าง:สูง (ทำให้เป็นแนวตั้งมากขึ้น)
              ),
              itemCount: 2, // จำนวนรูป 2 รูป
              itemBuilder: (context, index) {
                // รายการ URL รูปภาพ
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
                      // กรณีโหลดรูปผิดพลาด (แสดง Icon Error)
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
                      // แสดง Loading ขณะโหลดรูป (CircularProgressIndicator)
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child; // โหลดเสร็จแล้ว
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes! // คำนวณความคืบหน้า
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
}