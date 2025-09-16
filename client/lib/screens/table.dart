import 'package:flutter/material.dart';

import '../core/widgets/table_responsive.dart';
import './core/utils/widgets/layout_reponsive.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutResponsive(
      // title: "Table",
      child: TableDataPage,
    );
  }
}

class TableDataPage extends StatefulWidget {
  const TableDataPage({super.key});
  @override
  _TablePageDataState createState() => _TablePageDataState();
}

class _TablePageDataState extends State<TableDataPage> {  
  final columns = [
    ColumnConfig(key: "id", label: "ID"),
    ColumnConfig(key: "nama", label: "Nama"),
    ColumnConfig(key: "usia", label: "Usia"),
  ];

  final List<Map<String, dynamic>> rows = List.generate(25, (index) {
    return {
      "id": index + 1,
      "nama": "User ${index + 1}",
      "usia": 20 + (index % 30), 
    };
  });

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
      appBar: AppBar(title: const Text("Responsive Table")),
      // ALAT BANTU
       // TAMPILKAN / SEMBUNYIKAN WIDGET/FILTER
       // TAMPILKAN / SEMBUNYIKNA KOLOM
       // GUNAKAN FUTRURE BUILDER UNTUK AMBIL DATA DARI API DAN LISTVIEW BUILDER UNTUK MOBILE / DATATABLE UNTUK DESKTOP
      body:  ResponsiveTable( 
        /*
          KONSEP RESPONSIVE TABLE DIA MAMPUNG TEMPLATE UMUM WIDGET YANG DIGUNKAN PADA SCREEN INDEX TRANSAKSI DENGAN FITUR
          - WIDGET
          - FILTER
          - TABLE 
          - PAGINATION
          SEDANGKAN SCREEN BERFUNGSI MENGAMBIL DATA DARI SERVICE LALU DIMASUKAN KE TABLE REPONSIVE 
          TETAPI TIDAK SEMUA SCREEN MENGUNKAN KONSEP REPONSIVE TABLE DAN HANYA UNTUK INDEX UNTUK FORM 
          YANG MENGUNAKAN TABLE DISARANKAN CUSTOM KARNEA PERBEDAAN INPUTAN YANG SANGAT KOMPLEKS
        */

        // WIDGET 

        // FILTER 
        onFilter: applyFilter,

        // QUERY
        query : query,

        // TABLE COLUMNS 
        columns: columns,

        // TABLE ROWS 
        rows: rows,
        
        // TABLE ACTION
        actions: (row, context) => [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert), 
            onSelected: (value) {
              if (value == 1) {
                ScaffoldMessenger
                  .of(context)
                  .showSnackBar(
                    SnackBar(content: Text("Edit ${row['nama']}")),
                  );
              } else if (value == 2) {
                ScaffoldMessenger
                  .of(context)
                  .showSnackBar(
                    SnackBar(content: Text("Delete ${row['nama']}")),
                  );
              }
            },
            
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 8),
                    Text("Edit"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.delete),
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