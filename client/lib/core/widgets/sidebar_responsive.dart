import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

import '../../screens/dashboard.dart';
import '../../screens/profil.dart';
import '../../screens/table.dart';
import '../../providers/sidebar.dart';
import '../../providers/user.dart';
import '../../configs/storage.dart';
import '../../configs/platform.dart';


class SidebarResponsive extends StatefulWidget {
  const SidebarResponsive({super.key});
  @override
  State<SidebarResponsive> createState() => _SidebarResponsiveState();
}

class _SidebarResponsiveState extends State<SidebarResponsive> {
  late bool isLogin;
  bool isSidebarCollapsed = false;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.dashboard, 'title': 'Dashboard', 'key': 'dashboard'},
    {'icon': Icons.people, 'title': 'Profil', 'key': 'profil'},
    {'icon': Icons.list, 'title': 'Table', 'key': 'table'},
    {'icon': Icons.logout, 'title': 'Logout', 'key': 'logout'},
  ];

  void toggleSidebar(){
    setState(() {
      isSidebarCollapsed = !isSidebarCollapsed;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isLogin = Provider.of<UserProvider>(context, listen: true).getIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<SidebarProvider>(context);

    final width = MediaQuery.of(context).size.width;

    bool isDesktop = width >= 900;
    bool isTablet = width >= 600 && width < 900;
    bool isMobile = width < 600;
    
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: Text(menuProvider.menu[0].toUpperCase() + menuProvider.menu.substring(1)),
              backgroundColor : const Color.fromARGB(255, 163, 217, 14),
              actions: [
                PopupMenuButton<String>(
                  icon: const Icon(Icons.notifications),
                  onSelected: (value) {
                    debugPrint('Notif selected: $value');
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'new_msg', child: Text("New Message")),
                    PopupMenuItem(value: 'updates', child: Text("System Updates")),
                    PopupMenuItem(value: 'reminders', child: Text("Reminders")),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.account_circle),
                  onSelected: (value) {
                    if (value == 'logout') {
                      debugPrint('User logged out');
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'profile', child: Text("View Profile")),
                    PopupMenuItem(value: 'settings', child: Text("Account Settings")),
                    PopupMenuItem(value: 'logout', child: Text("Logout")),
                  ],
                ),
              ],
            )
          : null,
      drawer: isMobile
          ? Drawer(
              child: _buildSidebarContent(isSidebarCollapsed: isSidebarCollapsed,toggleSidebar : toggleSidebar),
            )
          : null,
      body: Row(
        children: [
          if (isDesktop || isTablet)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSidebarCollapsed ? 70 : ( isDesktop
                  ? 220
                  : (isTablet ? 100 : 70) ), // Lebar sidebar buat tablet dan desktop
              color: const Color.fromARGB(255, 4, 63, 94),
              child: _buildSidebarContent(isSidebarCollapsed: isSidebarCollapsed,toggleSidebar : toggleSidebar),
            ),
          Expanded(
            child: Column(
              children: [
                if (!isMobile)
                  Container(
                    height: 60,
                    color: const Color.fromARGB(255, 252, 147, 147),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          menuProvider.menu[0].toUpperCase() + menuProvider.menu.substring(1),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.notifications),
                          onSelected: (value) {
                            debugPrint('Notif selected: $value');
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'new_msg', child: Text("New Message")),
                            PopupMenuItem(value: 'updates', child: Text("System Updates")),
                            PopupMenuItem(value: 'reminders', child: Text("Reminders")),
                          ],
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.account_circle),
                          onSelected: (value) async {
                            if (value == 'logout') { 
                              if(AppPlatform.getPlatform() == 'Web'){  
                                localStorage.removeItem("token");         
                              }else{
                                await AppStorage.Secure.delete(key: "token");
                              }

                              Provider.of<UserProvider>(context,listen : false).setIsLogin(false);

                              Navigator.of(context).pushReplacementNamed("/");        
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'profile', child: Text("View Profile")),
                            PopupMenuItem(value: 'settings', child: Text("Account Settings")),
                            PopupMenuItem(value: 'logout', child: Text("Logout")),
                          ],
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey[100],
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: isMobile ? FloatingActionButton(
        onPressed: () {
          // Aksi tombol tengah
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add, size: 30),
      ) : null,
      floatingActionButtonLocation: isMobile ? FloatingActionButtonLocation.centerDocked : null,
      bottomNavigationBar: isMobile ? BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            SizedBox(width: 40), // space buat FAB
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ) : null,
    );
  }

  Widget _buildSidebarContent({required bool isSidebarCollapsed,required VoidCallback toggleSidebar}) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.flutter_dash, color: Colors.white, size: 28),
              if (!isSidebarCollapsed) ...[
                const SizedBox(width: 10),
                const Text(
                  "My App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
              const Spacer(),
              if (!isSidebarCollapsed)
                IconButton(
                  icon: Icon(
                    isSidebarCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: (){
                    toggleSidebar();                    
                  }
                ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const Divider(color: Colors.white54, height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final menu = menuItems[index];
              
              final isSelected = Provider.of<SidebarProvider>(context).menu == menu['key'];
              return InkWell(
                onTap: () {
                  setState(() {
                     Provider.of<SidebarProvider>(context, listen: false)
                        .selectMenu(menu['key']!);


                    // menuProvider.menu = menu['key']!;
                    // Jika drawer terbuka (mobile), tutup drawer saat pilih menu
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  color: isSelected
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  child: Row(
                    children: [
                      Icon(menu['icon'] as IconData,
                          color: isSelected ? Colors.blue : Colors.white),
                      if (!isSidebarCollapsed) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            menu['title'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.blue : Colors.white,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (Provider.of<SidebarProvider>(context).menu) {
      case 'dashboard':
        return Dashboard();
      case 'profil':
        return Profil();
      case 'table':
        return TablePage();
      default:
        return const Center(child: Text("Menu Tidak Ditemukan", style: TextStyle(fontSize: 24)));
    }
  }
}
