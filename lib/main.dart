import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
                :_buildUnselectedIcon("../images/pengaduan.png", "Pengaduan"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? _buildSelectedIcon("../images/Rating.png", "Rating")
                :_buildUnselectedIcon("../images/Rating.png", "Rating"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? _buildSelectedIcon("../images/Beranda.png", "Beranda")
                :_buildUnselectedIcon("../images/Beranda.png", "Beranda"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? _buildSelectedIcon("../images/Kehilangan.png", "Kehilangan")
                :_buildUnselectedIcon("../images/Kehilangan.png", "Kehilangan"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? _buildSelectedIcon("../images/Profile.png", "Profile")
                :_buildUnselectedIcon("../images/Profile.png", "Profile"),
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
    return const Scaffold(
      body: Center(
        child: Text(
          'Pengaduan Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  final List<Service> services = const [
    Service(
      name: 'Poliklinik',
      email: 'PIC@gmail.com',
      rating: 4,
      reviews: 273,
      imageUrl: '../images/poliklinik_image.png',
    ),
    Service(
      name: 'Radiologi',
      email: 'PIC@gmail.com',
      rating: 4,
      reviews: 273,
      imageUrl: '../images/poliklinik_image.png',
    ),
    Service(
      name: 'Makanan',
      email: 'PIC@gmail.com',
      rating: 4,
      reviews: 273,
      imageUrl: '../images/poliklinik_image.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom header
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF060A47),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Spacer to center the text
                  const Spacer(flex: 2,),
                  const Text('Rating', style: TextStyle( color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, ),),
                  const Spacer(), // Another spacer to keep text centered
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Implement search functionality here
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Implement notifications functionality here
                            },
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Body content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rating Unit Layanan',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        '../images/Kalender.png',
                        ),
                        const SizedBox(height: 4),
                        const Text(
                        '  Terakhir Update : 1 September 2024',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(service: services[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section with Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  service.imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              // Overlay Gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Service name and email inside the image overlay
              Positioned(
                left: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      service.email,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Rating and Reviews Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rating stars and reviews
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${service.rating}/5',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < service.rating) {
                              return const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              );
                            } else {
                              return const Icon(
                                Icons.star_border,
                                color: Colors.orange,
                                size: 20,
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${service.reviews} Reviews',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // Detail Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailPage(service: service),
                      ),
                    );
                  },
                  child: const Text(
                    'Detail',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Service {
  final String name;
  final String email;
  final int rating;
  final int reviews;
  final String imageUrl;

  const Service({
    required this.name,
    required this.email,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}

class ServiceDetailPage extends StatelessWidget {
  final Service service;

  const ServiceDetailPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom header
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF060A47),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back, // Ikon panah kembali
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                  ),
                  Text(
                      service.name,
                      style: const TextStyle(
                        color: Colors.white, // Mengubah warna teks menjadi putih
                        fontSize: 18.0, // Tentukan ukuran font secara langsung
                      ),
                    ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Implement search functionality here
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Implement notifications functionality here
                            },
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Area yang bisa digulir di bawah header
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contoh konten yang bisa digulir
                  
                  // Tambahkan lebih banyak konten di sini sesuai kebutuhan
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Beranda Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class KehilanganScreen extends StatelessWidget {
  const KehilanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Kehilangan Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}