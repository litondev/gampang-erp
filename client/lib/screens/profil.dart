import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sidebar.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<SidebarProvider>(context, listen: false)
          .selectMenu('dashboard');
      },
      child: Text("Kembali ke Dashboard"),
    );
  }
}