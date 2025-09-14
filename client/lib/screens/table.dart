import 'package:flutter/material.dart';

import '../core/widgets/table_responsive.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  final List<Map<String, dynamic>> rows = List.generate(20, (index) {
    return {
      "id": index + 1,
      "nama": "User ${index + 1}",
      "usia": 20 + (index % 30), 
    };
  });

  final columns = [
    ColumnConfig(key: "id", label: "ID"),
    ColumnConfig(key: "nama", label: "Nama"),
    ColumnConfig(key: "usia", label: "Usia"),
  ];

  String query = "";

  void applyFilter(String value) {
    setState(() {
      query = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, 
      appBar: AppBar(title: const Text("Responsive Table")),
      body:  ResponsiveTable(
        rows: rows,
        columns: columns,
        onFilter: applyFilter,
        query : query,
        actions: (row, context) => [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert), 
            onSelected: (value) {
              if (value == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Edit ${row['nama']}")),
                );
              } else if (value == 2) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Delete ${row['nama']}")),
                );
              }
            },
            
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.blue),
                    SizedBox(width: 8),
                    Text("Edit"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Delete"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}