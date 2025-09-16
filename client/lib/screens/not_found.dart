import 'package:flutter/material.dart';

import '../core/widgets/layout_responsive.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      title: "Dashboard",
      child: Center(child: Text("Halaman Tidak Ditemukan")),
    );
  }
}