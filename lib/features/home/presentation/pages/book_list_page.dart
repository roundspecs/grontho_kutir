import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class BookListPage extends StatefulWidget {
  static const String path = '/books';

  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final _searchController = TextEditingController();
  var _selectedCategory = Category.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          SearchBar(
            controller: _searchController,
            hintText: 'Search books',
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              // TODO: Implement search
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ...Category.values.map((category) {
                final isSelected = category == _selectedCategory;
                return ChoiceChip(
                  label: Text(category.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedCategory = category);
                    }
                  },
                );
              }),
            ],
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Author')),
              DataColumn(label: Text('Count'), numeric: true),
              DataColumn(label: Text('Category')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('1')),
                  DataCell(InkWell(
                    child: Text(
                      'Book 1',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      context.go('${BookListPage.path}/${1}');
                    },
                  )),
                  DataCell(Text('Author 1')),
                  DataCell(Text('10')),
                  DataCell(Text('Academic')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('2')),
                  DataCell(InkWell(
                    child: Text(
                      'Book 2',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      context.go('${BookListPage.path}/${2}');
                    },
                  )),
                  DataCell(Text('Author 2')),
                  DataCell(Text('5')),
                  DataCell(Text('Non-Academic')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
