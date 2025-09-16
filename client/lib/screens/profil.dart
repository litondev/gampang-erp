import './core/utils/widgets/layout_reponsive.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      // title: "Profil",
      child: Center(child: Text("Profil")),
    );
  }
}