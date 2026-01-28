import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

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
          'Purchase History',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),

      // ---------------- FAB ----------------
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.toNamed("/add-purchase-bill"),
        child: const Icon(Icons.add, size: 28),
      ),

      bottomNavigationBar: _bottomNav(),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard(),
            const SizedBox(height: 16),
            _searchBar(),
            const SizedBox(height: 20),
            _sectionTitle('RECENT BILLS'),
            const SizedBox(height: 8),
            _billsList(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // ---------------- SUMMARY ----------------
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SUMMARY',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$4,250.00',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Total Spent This Month',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: Colors.blue,
              size: 32,
            ),
          )
        ],
      ),
    );
  }

  // ---------------- SEARCH ----------------
  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search bill number or supplier...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ---------------- SECTION TITLE ----------------
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
        letterSpacing: 1,
      ),
    );
  }

  // ---------------- BILL LIST ----------------
  Widget _billsList() {
    final bills = [
      BillModel('OCT', '24', 'PUR-2023-892', 'Supplier A', '3 Fabrics', '\$1,250.00'),
      BillModel('OCT', '22', 'INV-77312', 'Premium Silks', '1 Fabric', '\$400.00'),
      BillModel('OCT', '18', 'GLOBAL-TX-105', 'Global Textiles', '5 Fabrics', '\$2,100.00'),
      BillModel('OCT', '15', 'B-2023-014', 'Rugged Fabrics', '2 Fabrics', '\$750.00'),
      BillModel('OCT', '12', 'TR-0045', 'Trim & Co.', '2 Items', '\$180.00'),
    ];

    return Container(
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
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bills.length,
        separatorBuilder: (_, __) =>
        const Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (_, index) {
          final bill = bills[index];
          return ListTile(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: _dateBox(bill),
            title: Text(
              'Bill #${bill.billNo}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bill.supplier),
                const SizedBox(height: 4),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    bill.items,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  bill.amount,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            onTap: () {

                Get.toNamed('/purchase_detail_page');

              // open purchase detail
            },
          );
        },
      ),
    );
  }

  Widget _dateBox(BillModel bill) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha:  0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            bill.month,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            bill.day,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
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

// ---------------- MODEL ----------------
class BillModel {
  final String month;
  final String day;
  final String billNo;
  final String supplier;
  final String items;
  final String amount;

  BillModel(
      this.month,
      this.day,
      this.billNo,
      this.supplier,
      this.items,
      this.amount,
      );
}


