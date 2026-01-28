import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/info_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 8),
            Expanded(child: _dashboardGrid()),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome 👋',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'Business Overview',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ---------------- GRID ----------------
  Widget _dashboardGrid() {
    final items = [
      _DashboardItem(
        title: 'Suppliers',
        value: '24',
        icon: Icons.people_alt_rounded,
        onTap: onTappedSuppliers,
      ),
      _DashboardItem(
        title: 'Purchases',
        value: '120',
        icon: Icons.shopping_cart_rounded,
        onTap: onTappedPurchases,
      ),
      _DashboardItem(
        title: 'Stock Value',
        value: '₹4.2L',
        icon: Icons.inventory_2_rounded,
        onTap: onTappedStock,
      ),
      _DashboardItem(
        title: 'Pending',
        value: '8',
        icon: Icons.pending_actions_rounded,
        onTap: () {},
      ),
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (_, index) {
        final item = items[index];
        return InfoCard(
          title: item.title,
          value: item.value,
          icon: item.icon,
          onPressed: item.onTap,
        );
      },
    );
  }

  // ---------------- ACTIONS ----------------
  void onTappedSuppliers() {
    Get.toNamed("/suppliers");
  }

  void onTappedPurchases() {
    Get.toNamed("/purchase-history");
  }

  void onTappedStock() {
    Get.toNamed("/stock");
  }
}

// ---------------- MODEL ----------------
class _DashboardItem {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  _DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  });
}
