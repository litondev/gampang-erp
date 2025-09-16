import 'package:flutter/material.dart';

import '../core/widgets/layout_responsive.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      title: "Profil",
      child: Center(child: Text("Profil")),
    );
  }
}