import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'activity_page.dart';
import 'pay_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // PageController untuk mengontrol perpindahan halaman dan animasinya
  late PageController _pageController;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    
    _pages = [
      DashboardPage(username: widget.username),
      ActivityPage(username: widget.username),
      PayPage(username: widget.username),
      WalletPage(username: widget.username),
      ProfilePage(username: widget.username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Animasi perpindahan halaman ketika item di Bottom Nav ditekan
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan PageView untuk menampilkan halaman dengan transisi
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Mencegah swipe antar halaman (hanya bisa diklik dari Bottom Nav Bar)
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF118EEA),
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          items: <BottomNavigationBarItem>[
            // Beranda
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.home_outlined, size: 24),
              ),
              activeIcon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.home, size: 24),
              ),
              label: 'Beranda',
            ),
            // Aktivitas
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.history_toggle_off_outlined, size: 24),
              ),
              activeIcon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.history_toggle_off, size: 24),
              ),
              label: 'Aktivitas',
            ),
            // PAY
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                // Menggunakan Container/SizedBox agar icon PAY bisa sedikit berbeda ukurannya
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/5753/5753046.png', // Ikon DANA PAY
                  width: 28,
                  height: 28,
                  color: _currentIndex == 2 ? const Color(0xFF118EEA) : Colors.grey.shade600,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.payment,
                      size: 28,
                      color: _currentIndex == 2 ? const Color(0xFF118EEA) : Colors.grey.shade600,
                    );
                  },
                ),
              ),
              label: 'PAY',
            ),
            // Dompet
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.account_balance_wallet_outlined, size: 24),
              ),
              activeIcon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.account_balance_wallet, size: 24),
              ),
              label: 'Dompet',
            ),
            // Saya
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.person_outline, size: 24),
              ),
              activeIcon: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Icon(Icons.person, size: 24),
              ),
              label: 'Saya',
            ),
          ],
        ),
      ),
    );
  }
}