import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidebar + Responsive Table',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedMenu = "dashboard";
  bool isSidebarCollapsed = false;

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.dashboard, 'title': 'Dashboard', 'key': 'dashboard'},
    {'icon': Icons.person, 'title': 'Profile', 'key': 'profile'},
    {'icon': Icons.settings, 'title': 'Settings', 'key': 'settings'},
    {'icon': Icons.table_chart, 'title': 'Table', 'key': 'table'},
    {'icon': Icons.logout, 'title': 'Logout', 'key': 'logout'},
  ];

  void toggleSidebar(){
    setState(() {
      isSidebarCollapsed = !isSidebarCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isDesktop = width >= 900;
    bool isTablet = width >= 600 && width < 900;
    bool isMobile = width < 600;
    
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: Text(_selectedMenu[0].toUpperCase() + _selectedMenu.substring(1)),
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
                          _selectedMenu[0].toUpperCase() + _selectedMenu.substring(1),
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
              final isSelected = _selectedMenu == menu['key'];
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedMenu = menu['key']!;
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
    switch (_selectedMenu) {
      case 'dashboard':
        return const Center(child: Text("Dashboard Content", style: TextStyle(fontSize: 24)));
      case 'profile':
        return const Center(child: Text("Profile Page", style: TextStyle(fontSize: 24)));
      case 'settings':
        return const Center(child: Text("Settings Page", style: TextStyle(fontSize: 24)));
      case 'table':
        return const ResponsiveTable();
      default:
        return const Center(child: Text("Select a menu", style: TextStyle(fontSize: 24)));
    }
  }
}

class ResponsiveTable extends StatefulWidget {
  const ResponsiveTable({super.key});
  @override
  State<ResponsiveTable> createState() => _ResponsiveTableState();
}

class _ResponsiveTableState extends State<ResponsiveTable> {
  final List<Map<String, dynamic>> allData = [
    {"id": 1, "nama": "Andi", "usia": 25},
    {"id": 2, "nama": "Budi", "usia": 30},
    {"id": 3, "nama": "Citra", "usia": 28},
    {"id": 4, "nama": "Dewi", "usia": 26},
  ];

  List<Map<String, dynamic>> filteredData = [];
  final TextEditingController searchController = TextEditingController();
  String selectedFilter = "Semua";

  @override
  void initState() {
    super.initState();
    filteredData = List.from(allData);
  }

  void filterData() {
    final q = searchController.text.toLowerCase();
    setState(() {
      filteredData = allData.where((row) {
        final nama = (row["nama"] as String).toLowerCase();
        final usia = row["usia"] as int;
        final matchesSearch = nama.contains(q);
        final matchesFilter = selectedFilter == "Semua" ||
            (selectedFilter == "< 28" && usia < 28) ||
            (selectedFilter == ">= 28" && usia >= 28);
        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;
    const double fontSize = 12;
    const double inputHeight = 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search, filter, bantuan bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Tooltip(
                message: "Cari nama pada tabel",
                child: SizedBox(
                  width: 150,
                  height: inputHeight,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 18),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: "Cari Nama",
                      labelStyle: TextStyle(fontSize: fontSize),
                    ),
                    style: const TextStyle(fontSize: fontSize),
                    onChanged: (val) => filterData(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: inputHeight,
                child: DropdownButton<String>(
                  value: selectedFilter,
                  items: const [
                    DropdownMenuItem(
                        value: "Semua",
                        child: Text("Semua", style: TextStyle(fontSize: fontSize))),
                    DropdownMenuItem(
                        value: "< 28",
                        child: Text("< 28", style: TextStyle(fontSize: fontSize))),
                    DropdownMenuItem(
                        value: ">= 28",
                        child: Text(">= 28", style: TextStyle(fontSize: fontSize))),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedFilter = value;
                        filterData();
                      });
                    }
                  },
                  underline: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  isDense: true,
                  style:
                      const TextStyle(fontSize: fontSize, color: Colors.black87),
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(Icons.help_outline, size: 24),
                tooltip: "Bantuan",
                onSelected: (value) {
                  if (value == 'tentang') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Aplikasi versi 1.0")),
                    );
                  } else if (value == 'bantuan') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text("Gunakan kotak pencarian dan filter untuk mempersempit data.")),
                    );
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'tentang', child: Text("Tentang")),
                  PopupMenuItem(value: 'bantuan', child: Text("Bantuan")),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: isMobile
              ? ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final row = filteredData[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        title: Text(row["nama"],
                            style: const TextStyle(fontSize: fontSize)),
                        subtitle: Text("Usia: ${row["usia"]}",
                            style: const TextStyle(fontSize: fontSize)),
                        leading: CircleAvatar(
                            child: Text(row["id"].toString(),
                                style: const TextStyle(fontSize: fontSize))),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              filteredData.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${row['nama']} dihapus")),
                            );
                          },
                        ),
                      ),
                    );
                  },
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                    child: DataTable(
                      columnSpacing: 40,
                      headingRowHeight: 32,
                      dataRowHeight: 32,
                      columns: const [
                        DataColumn(label: Text("ID", style: TextStyle(fontSize: fontSize))),
                        DataColumn(label: Text("Nama", style: TextStyle(fontSize: fontSize))),
                        DataColumn(label: Text("Usia", style: TextStyle(fontSize: fontSize))),
                        DataColumn(label: Text("Aksi", style: TextStyle(fontSize: fontSize))),
                      ],
                      rows: filteredData.map((row) {
                        return DataRow(cells: [
                          DataCell(Text(row["id"].toString(),
                              style: const TextStyle(fontSize: fontSize))),
                          DataCell(Text(row["nama"],
                              style: const TextStyle(fontSize: fontSize))),
                          DataCell(Text(row["usia"].toString(),
                              style: const TextStyle(fontSize: fontSize))),
                          DataCell(
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  filteredData.remove(row);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${row['nama']} dihapus")),
                                );
                              },
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
