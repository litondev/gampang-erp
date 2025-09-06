import 'package:flutter/material.dart';
import "../../configs/dimension.dart";

class ResponsiveTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  final List<ColumnConfig> columns;
  final List<Widget> Function(Map<String, dynamic>, BuildContext) actions;

  const ResponsiveTable({
    super.key,
    required this.rows,
    required this.columns,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {    
    final totalColumns = List<ColumnConfig>.from(columns);

    totalColumns.add(ColumnConfig(key: "__actions", label: "Aksi"));

    bool isMobile = AppDimension.platformType(context) == 'Mobile';

    if (isMobile) {
      return Column(
        children: [    
          // FILTER 
               
          Expanded(
            child: ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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

    return SizedBox(
      width: double.infinity, 
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child : Column(
          children: [ 
            // FILTER

            Row(
              children : [
                Expanded(
                  child : DataTable(
                    columns: totalColumns
                        .map((col) => DataColumn(
                          label: Text(
                            col.label,
                            style: const TextStyle(fontSize: 13),
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
            )

            // PAGINATION
          ]
        )
      )
    );
  }
}

class ColumnConfig {
  final String key;
  final String label;

  ColumnConfig({required this.key, required this.label});
}
