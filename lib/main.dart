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
          label,
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
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

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
                : _buildUnselectedIcon("../images/Kehilangan.png", "Kehilangan"),
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
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
 
class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers to get the input values
  final TextEditingController _emailController = TextEditingController();

  bool _isPasswordVisible = false; // State to control password visibility
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "Masukkan email",
                      ),
                    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF060A47), // Warna biru tua
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white, // Mengubah warna teks menjadi putih
          ),
        ),
        centerTitle: true, // Menempatkan teks di tengah
        actions: [
          IconButton(
            onPressed: () {
              // Aksi jika lonceng ditekan
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifikasi ditekan!")),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white, // Mengubah warna ikon lonceng menjadi putih
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( // Makes the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Aksi untuk ubah avatar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Ubah Avatar ditekan!")),
                  );
                },
                child: const Text(
                  "Ubah Avatar",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 5),
                    textField,
                    const Divider(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No Telp",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        hintText: "Masukkan nomor telepon",
                      ),
                    ),
                    const Divider(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible, // Toggle password visibility
                      decoration: InputDecoration(
                        hintText: "Masukkan password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space before the logout button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi logout
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Logout ditekan!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(231, 217, 37, 13),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PengaduanScreen extends StatelessWidget {
  const PengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Pengaduan Screen")),
    );
  }
}

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Rating Screen")),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Beranda Screen")),
    );
  }
}

class KehilanganScreen extends StatelessWidget {
  const KehilanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Kehilangan Screen")),
    );
  }
}
