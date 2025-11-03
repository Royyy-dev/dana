import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  final String username;

  const WalletPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Dompet',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            _buildBalanceCard(),

            const SizedBox(height: 10),

            // Section 1: Fitur Dompet
            _buildWalletSection(
              title: 'Fitur Dompet',
              items: [
                _buildWalletItem(
                  icon: Icons.credit_card_outlined,
                  title: 'Kartu Tersimpan',
                  subtitle: 'Hubungkan kartu bank/debit',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildWalletItem(
                  icon: Icons.local_offer_outlined,
                  title: 'Voucher & Kupon',
                  subtitle: 'Klaim dan gunakan kuponmu',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildWalletItem(
                  icon: Icons.lock_outline,
                  title: 'DANA Protection',
                  subtitle: 'Perlindungan transaksi kamu',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Section 2: Lainnya
            _buildWalletSection(
              title: 'Lainnya',
              items: [
                _buildWalletItem(
                  icon: Icons.receipt_long_outlined,
                  title: 'Pusat Tagihan',
                  subtitle: 'Lihat daftar dan riwayat tagihan',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildWalletItem(
                  icon: Icons.account_balance_outlined,
                  title: 'DANA Bisnis',
                  subtitle: 'Kelola bisnis kamu dengan DANA',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildWalletItem(
                  icon: Icons.lightbulb_outline,
                  title: 'DANA Goals',
                  subtitle: 'Wujudkan impianmu dengan menabung',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildWalletItem(
                  icon: Icons.language_outlined,
                  title: 'Ganti Bahasa',
                  subtitle: 'Pilih bahasa aplikasi',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper untuk Balance Card
  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF118EEA),
            Color(0xFF0D7FD4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Saldo Utama DANA',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Rp 1.250.000',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status: Premium',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.visibility_off_outlined,
                size: 20,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper untuk membuat section menu
  Widget _buildWalletSection({
    required String title,
    required List<Widget> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: items,
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk item dompet
  Widget _buildWalletItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF118EEA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF118EEA),
                size: 24,
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
                  const SizedBox(height: 4),
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

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade200,
      indent: 76,
    );
  }
}