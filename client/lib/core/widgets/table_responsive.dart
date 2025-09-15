import 'package:flutter/material.dart';

import "info_card_widget.dart";
import "../../configs/dimension.dart";

class ColumnConfig {
  final String key;
  final String label;

  ColumnConfig({required this.key, required this.label});
}

class ResponsiveTable extends StatelessWidget {  
  final Function(String) onFilter;
  final String query;

  final List<Map<String, dynamic>> rows;
  final List<ColumnConfig> columns;
  final List<Widget> Function(Map<String, dynamic>, BuildContext) actions;
  
  const ResponsiveTable({
    super.key,
    required this.rows,
    required this.columns,
    required this.actions,
    required this.onFilter,
    required this.query
  });

  @override
  Widget build(BuildContext context) {    
    final totalColumns = List<ColumnConfig>.from(columns);

    totalColumns.add(ColumnConfig(key: "__actions", label: "Aksi"));

    bool isMobile = AppDimension.platformType(context) == 'Mobile';

    if (isMobile) {
      // BISA DIPISAH-PISAH KE PRIVATE FUNCTION 
      return Column(
        children: [    
          // QUERY
          Text(query),

          // WIDGET 
          Row(
            children: [
              Expanded(child: InfoCardWidget(icon: Icons.inventory, title: "Jumlah", value: "5")),
              Expanded(child: InfoCardWidget(icon: Icons.shopping_cart, title: "Harga Beli", value: "10000")),
              Expanded(child: InfoCardWidget(icon: Icons.sell, title: "Harga Jual", value: "12000")),
              Expanded(child: InfoCardWidget(icon: Icons.widgets, title: "Total Barang", value: "60000")),
            ],
          ),

          // FILTER 
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.list),
                        labelText: "Select Item",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: "item1", child: Text("Item 1")),
                        DropdownMenuItem(value: "item2", child: Text("Item 2")),
                        DropdownMenuItem(value: "item3", child: Text("Item 3")),
                      ],
                      onChanged: (value) {
                        if(value != null){
                          onFilter(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit),
                        labelText: "Input",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
          // TABLE
          Expanded(
            child: ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: ListTile(      
                    title: Text(row["nama"] ?? "-",
                    style: const TextStyle(fontSize: 12)),

                    subtitle: Text("Usia : ${row["usia"] ?? '-'}",
                    style: const TextStyle(fontSize: 10)),
                    
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions(row, context),
                    ),
                  ),
                );
              },
            ),
          ),

          // INFINITY SCROLL
        ],
      );
    }
    
    // BISA DIPISAH-PISAH KE PRIVATE FUNCTION 
    return SizedBox(
      width: double.infinity, 
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child : 
        Column(
          children: [ 
            // QUERY
            Text(query),

            // WIDGET 
            Row(
              children: [
                Expanded(child: InfoCardWidget(icon: Icons.inventory, title: "Jumlah", value: "5")),
                Expanded(child: InfoCardWidget(icon: Icons.shopping_cart, title: "Harga Beli", value: "10000")),
                Expanded(child: InfoCardWidget(icon: Icons.sell, title: "Harga Jual", value: "12000")),
                Expanded(child: InfoCardWidget(icon: Icons.widgets, title: "Total Barang", value: "60000")),
              ],
            ),

            // FILTER
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.list),
                          labelText: "Select Item",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(value: "item1", child: Text("Item 1")),
                          DropdownMenuItem(value: "item2", child: Text("Item 2")),
                          DropdownMenuItem(value: "item3", child: Text("Item 3")),
                        ],
                        onChanged: (value) {
                          if(value != null){
                            onFilter(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit),
                          labelText: "Input",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // TABLE
            Row(
              children : [
                Expanded(
                  child : DataTable(
                    columns: totalColumns
                        .map((col) => DataColumn(
                          label: Text(
                            col.label,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ))
                        .toList(),
                    rows: rows.map((row) {
                      final cells = columns.map((col) {
                        return DataCell(Text(row[col.key]?.toString() ?? "-"));
                      }).toList();

                      cells.add(
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: actions(row, context),
                          ),
                        ),
                      );
                      return DataRow(cells: cells);
                    }).toList(),
                  )
                )
              ]
            ),

            // PAGINATION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  child: Text("Prev"),
                ),
                SizedBox(width: 20),

                SizedBox(
                  width: 100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () => {},
                  child: Text("Next"),
                ),
              ],
            )
          ]
        )
      )
    );
  }
}