import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final String username;

  const ActivityPage({Key? key, required this.username}) : super(key: key);

  final List<Map<String, dynamic>> transactions = const [
    {'month': 'Minggu Ini', 'data': [
      {'icon': Icons.fastfood_outlined, 'type': 'Pembayaran Makanan', 'date': '03 Nov 2025 • 12:00', 'amount': '- Rp 35.000', 'isDebit': true, 'isFailed': false},
      {'icon': Icons.send_outlined, 'type': 'Transfer ke Bank XYZ', 'date': '02 Nov 2025 • 18:30', 'amount': '- Rp 1.000', 'isDebit': true, 'isFailed': true},
      {'icon': Icons.add_circle_outline, 'type': 'Top Up dari BCA', 'date': '01 Nov 2025 • 09:15', 'amount': '+ Rp 200.000', 'isDebit': false, 'isFailed': false},
    ]},
    {'month': 'Oktober 2025', 'data': [
      {'icon': Icons.wifi_outlined, 'type': 'Pembayaran Internet', 'date': '28 Okt 2025 • 10:00', 'amount': '- Rp 150.000', 'isDebit': true, 'isFailed': false},
      {'icon': Icons.shopping_bag_outlined, 'type': 'Pembayaran Shopee', 'date': '25 Okt 2025 • 20:45', 'amount': '- Rp 85.000', 'isDebit': true, 'isFailed': false},
      {'icon': Icons.local_gas_station_outlined, 'type': 'Isi Bensin', 'date': '20 Okt 2025 • 08:30', 'amount': '- Rp 50.000', 'isDebit': true, 'isFailed': false},
      {'icon': Icons.receipt_long, 'type': 'Pulsa Telkomsel', 'date': '15 Okt 2025 • 11:00', 'amount': '- Rp 25.000', 'isDebit': true, 'isFailed': false},
    ]},
    {'month': 'September 2025', 'data': [
      {'icon': Icons.add_circle_outline, 'type': 'Top Up dari Mandiri', 'date': '10 Sep 2025 • 15:00', 'amount': '+ Rp 1.000.000', 'isDebit': false, 'isFailed': false},
      {'icon': Icons.theaters_outlined, 'type': 'Bayar Tiket Bioskop', 'date': '05 Sep 2025 • 19:00', 'amount': '- Rp 120.000', 'isDebit': true, 'isFailed': false},
      {'icon': Icons.fastfood_outlined, 'type': 'Pembayaran Kopi', 'date': '01 Sep 2025 • 07:00', 'amount': '- Rp 20.000', 'isDebit': true, 'isFailed': false},
    ]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Aktivitas',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari transaksi kamu di sini...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      ),
                    ),
                  ),
                ),

                // Tab Filters
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildTab('Semua', true),
                      const SizedBox(width: 8),
                      _buildTab('Pembayaran', false),
                      const SizedBox(width: 8),
                      _buildTab('Top Up', false),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          
          // Daftar Transaksi
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final section = transactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section['month'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            for (var i = 0; i < (section['data'] as List).length; i++) ...[
                              _buildTransactionItem(
                                icon: (section['data'] as List)[i]['icon'] as IconData,
                                type: (section['data'] as List)[i]['type'] as String,
                                date: (section['data'] as List)[i]['date'] as String,
                                amount: (section['data'] as List)[i]['amount'] as String,
                                isDebit: (section['data'] as List)[i]['isDebit'] as bool,
                                isFailed: (section['data'] as List)[i]['isFailed'] as bool,
                              ),
                              if (i < (section['data'] as List).length - 1) _buildDivider(),
                            ],
                          ],
                        ),
                      ),
                      if (index == transactions.length - 1) const SizedBox(height: 24),
                    ],
                  ),
                );
              },
              childCount: transactions.length,
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk tab filter
  Widget _buildTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF118EEA) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isSelected ? const Color(0xFF118EEA) : Colors.grey.shade400),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: isSelected ? Colors.white : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Helper untuk item transaksi
  Widget _buildTransactionItem({
    required IconData icon,
    required String type,
    required String date,
    required String amount,
    required bool isDebit,
    required bool isFailed,
  }) {
    return Padding(
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
                  type,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                if (isFailed) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Gagal',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isFailed
                  ? Colors.red.shade600
                  : isDebit ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
        ],
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