import 'package:flutter/material.dart';

class ResponsiveTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  final List<ColumnConfig> columns;
  final void Function(Map<String, dynamic> row)? onDelete;
  final void Function(Map<String, dynamic> row)? onEdit;

  const ResponsiveTable({
    super.key,
    required this.rows,
    required this.columns,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    if (isMobile) {
      // 📱 Card list untuk mobile
      return ListView.builder(
        itemCount: rows.length,
        itemBuilder: (context, index) {
          final row = rows[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(row[columns[0].key].toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columns.skip(1).map((col) {
                  return Text("${col.label}: ${row[col.key] ?? '-'}");
                }).toList(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onEdit != null)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => onEdit!(row),
                    ),
                  if (onDelete != null)
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDelete!(row),
                    ),
                ],
              ),
            ),
          );
        },
      );
    }

    // 💻 DataTable untuk desktop
    // Hitung total kolom, tambahkan "Aksi" kalau ada tombol edit/delete
    final totalColumns = List<ColumnConfig>.from(columns);
    if (onEdit != null || onDelete != null) {
      totalColumns.add(ColumnConfig(key: "__actions", label: "Aksi"));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: totalColumns
            .map((col) => DataColumn(
                  label: Text(col.label, style: const TextStyle(fontSize: 13)),
                ))
            .toList(),
        rows: rows.map((row) {
          final cells = columns.map((col) {
            return DataCell(Text(row[col.key]?.toString() ?? "-"));
          }).toList();

          // Tambahkan cell aksi jika perlu
          if (onEdit != null || onDelete != null) {
            cells.add(
              DataCell(Row(
                children: [
                  if (onEdit != null)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => onEdit!(row),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  if (onDelete != null)
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onDelete!(row),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              )),
            );
          }

          return DataRow(cells: cells);
        }).toList(),
      ),
    );
  }
}

class ColumnConfig {
  final String key;
  final String label;

  ColumnConfig({required this.key, required this.label});
}
