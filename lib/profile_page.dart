import 'package:flutter/material.dart';
import 'login_page.dart'; 

class ProfilePage extends StatelessWidget {
  final String username;

  final String namaLengkap = 'Roy Yogi Saputra';
  final String npm = '23670085';
  final String email = 'royyogis@gmail.com';

  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleLogout() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (Route<dynamic> route) => false,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),

            _buildProfileSection(
              context,
              title: 'Akun & Keamanan',
              icon: Icons.lock_outline,
              items: [
                _buildProfileItem(
                  icon: Icons.verified_user_outlined,
                  title: 'Verifikasi Akun',
                  subtitle: 'Kelola akun, ganti nama, atau upgrade',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildProfileItem(
                  icon: Icons.security,
                  title: 'Pengaturan Keamanan',
                  subtitle: 'Ganti PIN atau kelola otentikasi',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildProfileItem(
                  icon: Icons.fingerprint_outlined,
                  title: 'Biometrik',
                  subtitle: 'Aktifkan sidik jari/Face ID',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildProfileSection(
              context,
              title: 'Umum',
              icon: Icons.settings_outlined,
              items: [
                _buildProfileItem(
                  icon: Icons.help_outline,
                  title: 'Pusat Bantuan',
                  subtitle: 'FAQ, Syarat & Ketentuan',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildProfileItem(
                  icon: Icons.info_outline,
                  title: 'Tentang DANA',
                  subtitle: 'Versi aplikasi dan informasi legal',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildProfileItem(
                  icon: Icons.star_border,
                  title: 'Beri Penilaian',
                  subtitle: 'Dukung kami dengan rating terbaikmu!',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Tombol Keluar
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Keluar',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        children: [
          // Profile Photo
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF118EEA),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=80&h=80&fit=crop&crop=face', // Placeholder Foto Online
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF118EEA),
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaLengkap,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'NPM: $npm',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Email: $email',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFF118EEA),
            size: 24,
          ),
        ],
      ),
    );
  }

  // Helper untuk membuat section menu
  Widget _buildProfileSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildSectionHeader(title: title, icon: icon, onTap: () {}),
          ...items,
        ],
      ),
    );
  }

  // Helper untuk header section
  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF118EEA),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk item utama (dengan subtitle)
  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF118EEA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF118EEA),
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk divider
  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade300,
      indent: 16,
      endIndent: 16,
    );
  }
}