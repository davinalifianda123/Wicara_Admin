import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Bottom Navigation Bar',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2; // Default tampilan awal di Beranda

  final List<Widget> _screens = [
    const PengaduanScreen(),
    const RatingScreen(),
    const BerandaScreen(),
    const KehilanganScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? _buildSelectedIcon("../images/pengaduan.png", "Pengaduan")
                : _buildUnselectedIcon("../images/pengaduan.png", "Pengaduan"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? _buildSelectedIcon("../images/Rating.png", "Rating")
                : _buildUnselectedIcon("../images/Rating.png", "Rating"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? _buildSelectedIcon("../images/Beranda.png", "Beranda")
                : _buildUnselectedIcon("../images/Beranda.png", "Beranda"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? _buildSelectedIcon("../images/Kehilangan.png", "Kehilangan")
                : _buildUnselectedIcon(
                    "../images/Kehilangan.png", "Kehilangan"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? _buildSelectedIcon("../images/Profile.png", "Profile")
                : _buildUnselectedIcon("../images/Profile.png", "Profile"),
            label: '',
          ),
        ],
      ),
    );
  }

  // Widget untuk ikon yang dipilih
  Widget _buildSelectedIcon(String assetPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            color: Color(0xFF060A47),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: ImageIcon(
            AssetImage(assetPath),
            size: 24,
            color: Colors.white,
          ),
        ),
        Text(
          label, // Menggunakan parameter label
          style: const TextStyle(
            color: Color(0xFF060A47),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Widget untuk ikon yang tidak dipilih
  Widget _buildUnselectedIcon(String assetPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage(assetPath),
          size: 24,
          color: Colors.grey,
        ),
        Text(
          label, // Menggunakan parameter label
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class PengaduanScreen extends StatelessWidget {
  const PengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Layar Pengaduan'),
    );
  }
}

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Layar Rating'),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(), // Header untuk desain di atas
            _buildMenu(), // Grid menu
            _buildActivitySection(), // Aktivitas bagian
          ],
        ),
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(), // Navigasi bawah (opsional)
    );
  }

  // Fungsi _buildHeader
  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 200, // Tinggi sesuai dengan desain
          decoration: const BoxDecoration(
            color: Color(0xFF060A47), // Sesuaikan warna
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        const Positioned(
          top: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WICARA",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Wadah Informasi Catatan Aspirasi & Rating Akademik.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Image.asset(
            'images/Pengaduan1.png', // Gambar dummy (ubah sesuai path Anda)
            height: 160,
          ),
        ),
      ],
    );
  }

  // Fungsi _buildMenu untuk grid menu
  Widget _buildMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Jumlah kolom grid
          childAspectRatio: 1, // Ukuran item grid
        ),
        children: [
          _buildMenuItem('Pengaduan', Icons.report),
          _buildMenuItem('Kehilangan', Icons.search),
          _buildMenuItem('Rating', Icons.star),
          _buildMenuItem('Apa ya kira kira', Icons.question_mark),
          _buildMenuItem('Dosen/Tendik', Icons.person),
          _buildMenuItem('Mahasiswa', Icons.school),
          _buildMenuItem('Unit Layanan', Icons.business),
          _buildMenuItem('Jenis Pengaduan', Icons.category),
        ],
      ),
    );
  }

  // Fungsi untuk membuat item grid menu
  Widget _buildMenuItem(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor:
              const Color.fromARGB(255, 6, 10, 71), // Sesuaikan warna
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Fungsi _buildActivitySection untuk bagian aktivitas
  Widget _buildActivitySection() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Aktivitas yang perlu ditangani',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildActivityCard('Pengaduan', 150, Icons.report), // Menggunakan ikon baru
        const SizedBox(height: 8),
        _buildActivityCard('Laporan Kehilangan', 150, Icons.search),
        const SizedBox(height: 8),
        _buildActivityCard('Rating', 150, Icons.star),
      ],
    ),
  );
}
  

  // Fungsi untuk membuat kartu aktivitas
Widget _buildActivityCard(String title, int jumlah, IconData icon) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF060A47), Color.fromARGB(255, 8, 14, 97), Color.fromARGB(255, 4, 80, 181), Color.fromARGB(255, 84, 115, 254)], // Gradient biru
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$jumlah Perlu diproses',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // Background color
    foregroundColor: const Color(0xFF0052D4), // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
  onPressed: () {},
  child: const Text('Detail'),
)
          ],
        ),
      ),
    ),
  );
}

  // Fungsi _buildBottomNavigationBar untuk navigasi bawah
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0, // Posisi saat ini di navigasi
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.report),
          label: 'Pengaduan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Rating',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Kehilangan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class KehilanganScreen extends StatelessWidget {
  const KehilanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Layar Kehilangan'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Layar Profile'),
    );
  }
}
