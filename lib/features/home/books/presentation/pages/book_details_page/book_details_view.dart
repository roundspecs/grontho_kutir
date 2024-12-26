part of 'book_details_page.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(
      children: [
        Text(
          'Copies of Book ${1}',
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
    );
  }
}
