import 'package:flutter/material.dart';

class AddSupplierPage extends StatelessWidget {
  const AddSupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNewSupplierScreenGrok();
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Add Supplier')),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       children: const [
    //         TextField(decoration: InputDecoration(labelText: 'Supplier Name')),
    //         TextField(decoration: InputDecoration(labelText: 'Phone')),
    //       ],
    //     ),
    //   ),
    // );
  }
}




class AddNewSupplierScreen extends StatelessWidget {
  const AddNewSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Supplier',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      _label('Supplier Name'),
                      _inputField(
                        hint: 'e.g. Vardhman Textiles',
                      ),

                      _label('Contact Person'),
                      _inputField(
                        hint: 'Enter name',
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Phone Number'),
                                _inputField(
                                  hint: '+91 00000',
                                  keyboardType: TextInputType.phone,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label('Email'),
                                _inputField(
                                  hint: 'name@email.com',
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _label('GST Number'),
                          const Text(
                            'Optional',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      _inputField(
                        hint: 'Enter 15-digit GSTIN',
                      ),

                      _label('Address'),
                      _inputField(
                        hint: 'Enter full business address',
                        maxLines: 4,
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),

              _saveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------ Widgets ------------------

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _inputField({
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD0D7E2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD0D7E2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () {
            // TODO: Save supplier logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 6,
          ),
          child: const Text(
            'Save Supplier',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}




class AddNewSupplierScreenGrok extends StatefulWidget {
  const AddNewSupplierScreenGrok({super.key});

  @override
  State<AddNewSupplierScreenGrok> createState() => _AddNewSupplierScreenGrokState();
}

class _AddNewSupplierScreenGrokState extends State<AddNewSupplierScreenGrok> {
  final _formKey = GlobalKey<FormState>();

  // Controllers (you can connect them to your backend / state management later)
  final _nameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _gstController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactPersonController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gstController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Supplier',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            // Supplier Name
            _buildLabel('Supplier Name'),
            _buildTextField(
              hint: 'e.g. Vardhman Textiles',
              controller: _nameController,
              isRequired: true,
            ),
            const SizedBox(height: 24),

            // Contact Person
            _buildLabel('Contact Person'),
            _buildTextField(
              hint: 'Enter name',
              controller: _contactPersonController,
            ),
            const SizedBox(height: 24),

            // Phone & Email row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Phone Number'),
                      _buildTextField(
                        hint: '+91 00000000',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Email'),
                      _buildTextField(
                        hint: 'name@email.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // GST Number
            _buildLabel('GST Number'),
            _buildTextField(
              hint: 'Enter 15-digit GSTIN',
              controller: _gstController,
              helperText: 'Optional',
              helperTextColor: Colors.grey.shade600,
            ),
            const SizedBox(height: 24),

            // Address
            _buildLabel('Address'),
            TextFormField(
              controller: _addressController,
              maxLines: 4,
              minLines: 3,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: 'Enter full business address',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save supplier logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Supplier saved!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save Supplier',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    String? helperText,
    Color? helperTextColor,
    bool isRequired = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: isRequired
          ? (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        return null;
      }
          : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        helperText: helperText,
        helperStyle: TextStyle(color: helperTextColor ?? Colors.grey.shade600),
      ),
    );
  }
}
