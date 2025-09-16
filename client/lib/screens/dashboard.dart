import './core/utils/widgets/layout_reponsive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      // title: "Dashboard",
      child: Center(child: Text("Dashboard content")),
    );
  }
}