import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookId;
  const BookDetailsPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          Text(
            'Copies of Book $bookId',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Condition')),
              DataColumn(label: Text('Owner')),
              DataColumn(label: Text('Representative')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Some pages are missing')),
                DataCell(Text('John Doe')),
                DataCell(Text('Jane Doe')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('Intact')),
                DataCell(Text('Jane Doe')),
                DataCell(Text('John Doe')),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
