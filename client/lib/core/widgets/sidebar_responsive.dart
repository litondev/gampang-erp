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
import "../../configs/dimension.dart";

class SidebarResponsive extends StatefulWidget {
  const SidebarResponsive({super.key});
  @override
  State<SidebarResponsive> createState() => _SidebarResponsiveState();
}

class _SidebarResponsiveState extends State<SidebarResponsive> {  
  bool isSidebarCollapsed = false;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.dashboard, 'title': 'Dashboard', 'key': 'dashboard'},
    {'icon': Icons.people, 'title': 'Profil', 'key': 'profil'},
    {'icon': Icons.list, 'title': 'Table', 'key': 'table'},
    {'icon': Icons.logout, 'title': 'Logout', 'key': 'logout'},
  ];

  Widget buildNotificationMenu(BuildContext context){
    return  PopupMenuButton<String>(
      icon: const Icon(Icons.notifications),
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'new_msg', child: Text("New Message")),
        PopupMenuItem(value: 'updates', child: Text("System Updates")),
        PopupMenuItem(value: 'reminders', child: Text("Reminders")),
      ],
    );
  }

  Widget buildProfilMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.account_circle),
      onSelected: (value) async {
        if (value == 'logout') {
          if (AppPlatform.getPlatform() == 'Web') {
            localStorage.removeItem("token");
          } else {
            await AppStorage.Secure.delete(key: "token");
          }

          Provider.of<UserProvider>(context, listen: false).setIsLogin(false);

          Navigator.of(context).pushReplacementNamed("/");
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'profile', child: Text("View Profile")),
        PopupMenuItem(value: 'settings', child: Text("Account Settings")),
        PopupMenuItem(value: 'logout', child: Text("Logout")),
      ],
    );
  }

  void toggleSidebar(){
    setState(() {
      isSidebarCollapsed = !isSidebarCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<SidebarProvider>(context);

    bool isDesktop = AppDimension.platformType(context) == 'Desktop';
    bool isTablet = AppDimension.platformType(context) == 'Tablet';
    bool isMobile = AppDimension.platformType(context) == 'Mobile';
    
    return Scaffold(
      backgroundColor: Colors.transparent, 
      appBar: isMobile
          ? AppBar(
              title: Text(menuProvider.menu[0].toUpperCase() + menuProvider.menu.substring(1)),
              backgroundColor : Colors.white,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 0.5,          
                    ),
                  ),
                ),
              ),
              actions: [
                buildNotificationMenu(context),

                buildProfilMenu(context)              
              ],
            )
          : null,
      drawer: isMobile
          ? Drawer(
              backgroundColor: const Color.fromARGB(255, 4, 63, 94),
              child: _buildSidebarContent(isSidebarCollapsed: isSidebarCollapsed,isMobile : isMobile,toggleSidebar : toggleSidebar),
            )
          : null,
      body: Row(
        children: [
          if (isDesktop || isTablet) 
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSidebarCollapsed 
                  ? 70 
                  : ( isDesktop ? 220 : (isTablet ? 100 : 70) ), 
              color: const Color.fromARGB(255, 4, 63, 94),
              child: _buildSidebarContent(isSidebarCollapsed: isSidebarCollapsed,isMobile : isMobile,toggleSidebar : toggleSidebar),
            ),
          Expanded(
            child: Column(
              children: [
                if (!isMobile)
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300, 
                          width: 0.5, 
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          menuProvider.menu[0].toUpperCase() + menuProvider.menu.substring(1),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const Spacer(),

                        buildNotificationMenu(context),

                        buildProfilMenu(context)              
                      ],
                    ),
                  ),
                Expanded(
                  child: Container(
                    color : Colors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity, 
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: isMobile ? FloatingActionButton(
        onPressed: () {},
        backgroundColor : Colors.pink,
        child: Icon(Icons.add, size: 30),
      ) : null,
      floatingActionButtonLocation: isMobile ? FloatingActionButtonLocation.centerDocked : null,
      bottomNavigationBar: isMobile ? BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFE0E0E0),
                width: 0.5,          
              ),
            ),
          ),
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
              SizedBox(width: 40), 
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
        )
      ) : null,
    );
  }

  Widget _buildSidebarContent({required bool isSidebarCollapsed,required bool isMobile,required VoidCallback toggleSidebar}) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              const SizedBox(width: 12),

              Expanded(
                child : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child : GestureDetector(
                    onTap: () {
                      if(!isMobile){
                        toggleSidebar();      
                      }              
                    },
                    child: const Icon(Icons.flutter_dash, color: Colors.white, size: 28)
                  )
                ),
              ),

              if (!isSidebarCollapsed) ...[
                SizedBox(width: 10),
                Expanded(
                  child : const Text(
                    "My App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],

              const Spacer(),
              
              if (
                !isSidebarCollapsed && 
                !isMobile
              )
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