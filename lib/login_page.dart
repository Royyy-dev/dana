import 'package:flutter/material.dart';
import 'home_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _pinController = TextEditingController();
  bool _obscurePin = true;

  void _handleLogin() {
    if (_usernameController.text.isEmpty || _pinController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Email/Username dan PIN tidak boleh kosong!'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: _usernameController.text.isNotEmpty
              ? _usernameController.text
              : 'Pengguna DANA', 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF118EEA),
      body: SafeArea(
        child: Column(
          children: [
            // Header (Logo dan Selamat Datang)
            _buildHeader(),
            
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Masuk ke Akun Anda',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Input Email / Username
                      _buildUsernameField(),
                      const SizedBox(height: 16),

                      // Input PIN
                      _buildPinField(),
                      const SizedBox(height: 24),

                      // Tombol Lupa PIN
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // Aksi Lupa PIN
                          },
                          child: const Text(
                            'Lupa PIN?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF118EEA),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Tombol Masuk
                      ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF118EEA),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Pilihan Daftar
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Aksi Daftar
                          },
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF118EEA),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),

                      // Footer Text
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Dengan masuk atau mendaftar, kamu menyetujui\nSyarat & Ketentuan serta Kebijakan Privasi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
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

  Widget _buildHeader() {
    const String logoUrl = 'https://downloadr2.apkmirror.com/wp-content/uploads/2023/02/41/63ecca00b12e5-384x384.png'; 
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                logoUrl,
                fit: BoxFit.cover,
                // ErrorBuilder jika gambar gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Color(0xFF118EEA),
                      size: 48,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'DANA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Widget untuk Input Email / Username
  Widget _buildUsernameField() {
    return TextField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress, // Mengubah keyboard type
      style: const TextStyle(color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        labelText: 'Email / Username', // Label diubah
        labelStyle: TextStyle(color: Colors.grey.shade700),
        prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF118EEA)), // Ikon diganti ke logo user
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF118EEA), width: 2),
        ),
      ),
    );
  }

  // Widget untuk Input PIN
  Widget _buildPinField() {
    return TextField(
      controller: _pinController,
      keyboardType: TextInputType.number,
      obscureText: _obscurePin,
      maxLength: 6,
      style: const TextStyle(color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        labelText: 'PIN (6 Digit)',
        labelStyle: TextStyle(color: Colors.grey.shade700),
        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF118EEA)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePin ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade500,
          ),
          onPressed: () {
            setState(() {
              _obscurePin = !_obscurePin;
            });
          },
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        counterText: "", // Menghilangkan counter
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF118EEA), width: 2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _pinController.dispose();
    super.dispose();
  }
}