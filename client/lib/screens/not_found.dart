import './core/utils/widgets/layout_reponsive.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      // title: "Dashboard",
      child: Center(child: Text("Halaman Tidak Ditemukan")),
    );
  }
}