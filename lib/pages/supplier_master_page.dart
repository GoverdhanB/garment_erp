import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupplierMasterPage extends StatelessWidget {
  const SupplierMasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Supplier Master',
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
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.toNamed('/add-supplier'),
        child: const Icon(Icons.add, size: 28),
      ),

      bottomNavigationBar: _bottomNav(),

      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
            _filterChips(),
            Expanded(child: _supplierList()),
          ],
        ),
      ),
    );
  }

  // ---------------- SEARCH ----------------
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by name or contact',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ---------------- FILTER CHIPS ----------------
  Widget _filterChips() {
    final filters = ['All Fabrics', 'Silk', 'Denim', 'Cotton'];

    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final selected = index == 0;
          return ChoiceChip(
            label: Text(filters[index]),
            selected: selected,
            selectedColor: Colors.blue,
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
            onSelected: (_) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }

  // ---------------- SUPPLIER LIST ----------------
  Widget _supplierList() {
    final suppliers = [
      SupplierModel(
        name: 'Global Textiles Ltd.',
        primary: 'Premium Cotton',
        contact: 'John Doe',
        phone: '+1 234-567-890',
        image: 'assets/fabric1.png',
      ),
      SupplierModel(
        name: 'Silk Road Exports',
        primary: 'Pure Silk',
        contact: 'Jane Smith',
        phone: '+1 987-654-321',
        image: 'assets/fabric2.png',
      ),
      SupplierModel(
        name: 'Indigo Blue Co.',
        primary: 'Japanese Denim',
        contact: 'Mike Ross',
        phone: '+1 555-019-928',
        image: 'assets/fabric3.png',
      ),
      SupplierModel(
        name: 'Organic Fiber Hub',
        primary: 'Organic Cotton',
        contact: 'Sarah Chen',
        phone: '+1 444-222-111',
        image: 'assets/fabric4.png',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: suppliers.length,
      itemBuilder: (_, index) {
        return SupplierCard(supplier: suppliers[index]);
      },
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Suppliers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
class SupplierCard extends StatelessWidget {
  final SupplierModel supplier;

  const SupplierCard({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              supplier.image,
              errorBuilder: (ctx,obj,st){
                return Icon(Icons.hide_image,size: 36,color: Colors.grey,);
              },
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  supplier.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Primary: ${supplier.primary}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(supplier.contact),
                    const SizedBox(width: 12),
                    const Icon(Icons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      supplier.phone,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
class SupplierModel {
  final String name;
  final String primary;
  final String contact;
  final String phone;
  final String image;

  SupplierModel({
    required this.name,
    required this.primary,
    required this.contact,
    required this.phone,
    required this.image,
  });
}
