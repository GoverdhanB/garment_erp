import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPurchaseEntryPage extends StatelessWidget {
  const NewPurchaseEntryPage({super.key});

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
          'New Purchase Entry',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      // ---------------- SAVE BUTTON ----------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 54,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 6,
            ),
            child: const Text(
              'Save Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rowFields(
                left: _supplierDropdown(
                  label: 'Supplier Name',
                 suppliers: [],
                ),
                right: _textField(
                  label: 'Bill No.',
                  hint: '0000',
                ),
              ),

              _rowFields(
                left: _textField(
                  label: 'Fabric Type',
                  hint: 'e.g. Organic Cotton',
                ),
                right: _textField(
                  label: 'Item Sr No.',
                  hint: '#001',
                ),
              ),

              _textField(
                label: 'Ghat (Workshop/Location)',
                hint: 'Enter workshop unit',
              ),

              _rowFields(
                left: _textField(
                  label: 'Quantity (m)',
                  hint: '0.00',
                  keyboardType: TextInputType.number,
                ),
                right: _textField(
                  label: 'Price / Meter',
                  hint: '\$0.00',
                  keyboardType: TextInputType.number,
                ),
              ),

              _totalCost(),

              _rowFields(
                left: _dateField(label: 'Purchase Date'),
                right: _dateField(label: 'Receive Date'),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  'All prices exclude applicable local taxes',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HELPERS ----------------

  Widget _rowFields({required Widget left, required Widget right}) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 12),
        Expanded(child: right),
      ],
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _textField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          TextField(
            keyboardType: keyboardType,
            decoration: _inputDecoration(hint),
          ),
        ],
      ),
    );
  }




  Widget _totalCost() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'TOTAL EST. COST',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          Text(
            '\$0.00',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          TextField(
            readOnly: true,
            decoration: _inputDecoration('mm/dd/yyyy').copyWith(
              suffixIcon: const Icon(Icons.calendar_today, size: 20),
            ),
            onTap: () {
              // showDatePicker(...)
            },
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD0D7E2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD0D7E2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }
  Widget _supplierDropdown({
    required String label,
    required List<String> suppliers,
    String? value,
    Function(String?)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          DropdownButtonFormField<String>(
            value: value,
            items: suppliers
                .map(
                  (supplier) => DropdownMenuItem<String>(
                value: supplier,
                child: Text(supplier),
              ),
            )
                .toList(),
            onChanged: onChanged,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: _inputDecoration('Select supplier'),
          ),
        ],
      ),
    );
  }


  // Widget _dropdownField({
  //   required String label,
  //   required String hint,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _label(label),
  //         TextField(
  //           readOnly: true,
  //           decoration: _inputDecoration(hint).copyWith(
  //             suffixIcon: const Icon(Icons.keyboard_arrow_down),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }


// Widget _readonlyField({
//   required String label,
//   required String value,
// }) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _label(label),
//         Container(
//           height: 52,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: Colors.blue.shade200,
//               style: BorderStyle.solid,
//             ),
//             color: Colors.blue.withOpacity(0.05),
//           ),
//           child: Text(
//             value,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

}
