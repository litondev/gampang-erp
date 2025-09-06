import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sidebar.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Langsung pakai sidebar
    return ElevatedButton(
      onPressed: () {
        Provider.of<SelectedMenuProvider>(context, listen: false)
        .selectMenu('dashboard');
        // Set selected menu di SidebarResponsive menjadi 'dashboard'
        // Cara termudah: gunakan Navigator untuk push ke SidebarResponsive
      
      },
      child: Text("Kembali ke Dashboard"),
    );
  }
}