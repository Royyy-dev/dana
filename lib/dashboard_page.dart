import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  const DashboardPage({Key? key, required this.username}) : super(key: key);

  final List<String> imgList = const [
    'https://a.m.dana.id/danaweb/promo/1761832389-General_KV_11.11_-_Website_Cover_1440x575px.png', 
    'https://a.m.dana.id/danaweb/promo/1759476520-lQDPJxGZfA2n8G3NAj_NBaCwhiwPW2ZU8qgIu9H_UsRkAQ_1440_575.jpg', 
    'https://a.m.dana.id/danaweb/promo/1757498128-qris_1.png', 
  ];

  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.flash_on, 'label': 'Pulsa & Data', 'color': Color(0xFFFF5722)},
    {'icon': Icons.qr_code_scanner, 'label': 'Pay', 'color': Color(0xFF118EEA)},
    {'icon': Icons.account_balance_wallet, 'label': 'Minta Dana', 'color': Color(0xFF4CAF50)},
    {'icon': Icons.attach_money, 'label': 'Kirim Uang', 'color': Color(0xFFFF9800)},
    {'icon': Icons.electric_bolt, 'label': 'Listrik', 'color': Color(0xFF3F51B5)},
    {'icon': Icons.gamepad, 'label': 'Voucher Game', 'color': Color(0xFF9C27B0)},
    {'icon': Icons.local_dining, 'label': 'Kuliner', 'color': Color(0xFF00BCD4)},
    {'icon': Icons.more_horiz, 'label': 'Semua', 'color': Color(0xFF607D8B)},
  ];
  
  final List<Map<String, dynamic>> transactionItems = const [
    {
      'logo': 'https://www.linkqu.id/wp-content/uploads/2021/07/Logo-Indomaret-Linkqu-1024x1024.png', 
      'title': 'Pembayaran Indomaret', 
      'subtitle': 'Pembayaran QR', 
      'amount': '-Rp 55.000', 
      'isDebit': true
    },
    {
      'logo': 'https://zonalogo.com/wp-content/uploads/2024/06/Logo-Bank-Negara-Indonesia-BNI-PNG-Kualitas-HD-768x432.webp', 
      'title': 'Top Up BNI', 
      'subtitle': 'Transfer Bank', 
      'amount': '+Rp 500.000', 
      'isDebit': false
    },
    {
      'logo': 'https://dl.memuplay.com/new_market/img/com.telkomsel.telkomselcm.icon.2024-10-31-14-02-04.png', 
      'title': 'Beli Pulsa Telkomsel', 
      'subtitle': 'Pulsa & Data', 
      'amount': '-Rp 25.000', 
      'isDebit': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header DANA Style dengan Gradient dan Saldo
              _buildDanaHeader(context),

              // 2. Menu Utama 8 Kotak
              _buildMainMenuGrid(),

              const SizedBox(height: 24),

              // 3. Carousel Banner Otomatis
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Promo Menarik Hari Ini',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CarouselSlider( // Menggunakan CarouselSlider
                      options: CarouselOptions(
                        height: 160.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        enlargeCenterPage: true,
                        viewportFraction: 1.0, 
                        aspectRatio: 2.0,
                        enableInfiniteScroll: true,
                      ),
                      items: imgList.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.red.shade100,
                                      child: Center(
                                        child: Text(
                                          'Banner Gagal Dimuat',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red.shade700,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              
              // 4. Riwayat Transaksi Terbaru
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Transaksi Terbaru',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigasi ke ActivityPage
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF118EEA),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              
              Container(
                color: Colors.white,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactionItems.length,
                  separatorBuilder: (context, index) => _buildDivider(),
                  itemBuilder: (context, index) {
                    final item = transactionItems[index];
                    return _buildTransactionItem(
                      logo: item['logo'],
                      title: item['title'],
                      subtitle: item['subtitle'],
                      amount: item['amount'],
                      isDebit: item['isDebit'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============== WIDGET UTAMA (Header) ==============

  Widget _buildDanaHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF118EEA),
            Color(0xFF0D7FD4),
          ],
        ),
      ),
      child: Column(
        children: [
          // Top Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Avatar
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=80&h=80&fit=crop&crop=face',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF118EEA),
                                size: 24,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Halo,',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          username.length > 12
                              ? '${username.substring(0, 12)}...'
                              : username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildIcon(Icons.notifications_outlined, hasNotification: true),
                    const SizedBox(width: 8),
                    _buildIcon(Icons.qr_code_scanner),
                  ],
                ),
              ],
            ),
          ),

          // Balance Card
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo DANA Kamu',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Rp 1.250.000',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility_off_outlined,
                            size: 14,
                            color: Colors.grey.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Sembunyikan',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _buildBalanceAction(
                        icon: Icons.add_circle_outline,
                        label: 'Top Up',
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: _buildBalanceAction(
                        icon: Icons.send_outlined,
                        label: 'Transfer',
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: _buildBalanceAction(
                        icon: Icons.history,
                        label: 'Riwayat',
                        onTap: () {
                          // Navigasi ke ActivityPage
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage(username: username)));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // ============== WIDGET UTAMA (Menu Grid) ==============
  
  Widget _buildMainMenuGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8, // Mengatur tinggi item
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _buildMainMenuItem(
            icon: item['icon'],
            label: item['label'],
            iconColor: item['color'],
            onTap: () {},
          );
        },
      ),
    );
  }


  // ============== WIDGET HELPER ==============

  // Helper untuk icon di top bar
  Widget _buildIcon(IconData icon, {bool hasNotification = false}) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              icon,
              size: 20,
            ),
            color: Colors.white,
            padding: EdgeInsets.zero,
            onPressed: () {},
          ),
          if (hasNotification)
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
    );
  }

  // Helper untuk action di balance card (Top Up, Transfer, Riwayat)
  Widget _buildBalanceAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: const Color(0xFF118EEA),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF118EEA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk 8 menu utama (Grid)
  Widget _buildMainMenuItem({
    required IconData icon,
    required String label,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk item transaksi
  Widget _buildTransactionItem({
    required String logo,
    required String title,
    required String subtitle,
    required String amount,
    required bool isDebit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                logo,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey.shade400,
                    size: 24,
                  );
                },
              ),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 3),
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
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDebit ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // Divider untuk pemisah transaksi
  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade200,
      indent: 76,
    );
  }
}