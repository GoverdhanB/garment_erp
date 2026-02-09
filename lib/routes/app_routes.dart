import 'package:first_app/pages/purchase_detail_page.dart';
import 'package:flutter/material.dart';
import '../pages/add_purchase_bill_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/purchase_history_page.dart';
import '../pages/supplier_master_page.dart';
import '../pages/add_supplier_page.dart';
import '../pages/stock_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/dashboard': (_) => const DashboardPage(),
    '/suppliers': (_) => const SupplierMasterPage(),
    '/add-supplier': (_) => const AddSupplierPage(),
    '/purchase-history': (_) => const PurchaseHistoryPage(),
    '/add-purchase-bill': (_) => const NewPurchaseEntryPage(),
    '/purchase_detail_page': (_) => const PurchaseDetailsPage(),
    '/stock': (_) => const StockPage(),
  };
}
