import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseDetailsPage extends StatelessWidget {
  const PurchaseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'PUR-2023-892',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.blue),
            onPressed: () {},
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.download_rounded, size: 26),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard(),
            const SizedBox(height: 20),
            _fabricItemsSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: _bottomNav(),
    );
  }

  // ---------------- SUMMARY CARD ----------------
  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _infoBlock(
                  title: 'SUPPLIER',
                  value: 'Supplier A - Premium Fabrics',
                ),
              ),
              _infoBlock(
                title: 'DATE',
                value: 'Oct 24,\n2023',
                alignRight: true,
              ),
            ],
          ),

          const Divider(height: 28),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'TOTAL BILL AMOUNT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$1,250.00',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'PAID',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoBlock({
    required String title,
    required String value,
    bool alignRight = false,
  }) {
    return Column(
      crossAxisAlignment:
      alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          textAlign: alignRight ? TextAlign.right : TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ---------------- FABRIC ITEMS ----------------
  Widget _fabricItemsSection() {
    final items = [
      _FabricItem('01', 'CT-991', 'Pure Cotton', 'A-Grade'),
      _FabricItem('02', 'SL-422', 'Raw Silk', 'Premium'),
      _FabricItem('03', 'LN-105', 'Linen Blend', 'B-Grade'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FABRIC ITEMS (3)',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),

          _tableHeader(),
          const Divider(),

          ...items.map(_tableRow).toList(),

          const Divider(height: 28),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Quantity',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Text(
                '250m',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableHeader() {
    return Row(
      children: const [
        _Cell('SR NO.', flex: 1, header: true),
        _Cell('ITEM ID', flex: 2, header: true),
        _Cell('FABRIC TYPE', flex: 3, header: true),
        _Cell('GHAT', flex: 2, header: true),
      ],
    );
  }

  Widget _tableRow(_FabricItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _Cell(item.sr, flex: 1, muted: true),
          _Cell(item.id, flex: 2, bold: true),
          _Cell(item.type, flex: 3),
          _Cell(item.ghat, flex: 2),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2),
          label: 'Stock',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

// ---------------- TABLE CELL ----------------
class _Cell extends StatelessWidget {
  final String text;
  final int flex;
  final bool header;
  final bool bold;
  final bool muted;

  const _Cell(
      this.text, {
        required this.flex,
        this.header = false,
        this.bold = false,
        this.muted = false,
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: header ? 12 : 14,
          fontWeight: header || bold ? FontWeight.w600 : FontWeight.normal,
          color: muted
              ? Colors.grey
              : header
              ? Colors.grey
              : Colors.black,
        ),
      ),
    );
  }
}

// ---------------- MODEL ----------------
class _FabricItem {
  final String sr;
  final String id;
  final String type;
  final String ghat;

  _FabricItem(this.sr, this.id, this.type, this.ghat);
}
