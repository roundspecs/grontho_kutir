part of 'book_list_page.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  final _searchController = TextEditingController();
  var _selectedCategory = Category.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Expanded(child: _searchBar(context)),
            _addBookButton(context),
          ],
        ),
        _categoryFilter(context),
        _bookTable(context),
      ],
    );
  }

  Widget _bookTable(BuildContext context) {
    return Builder(builder: (context) {
      final isLoading = context
          .select((BookListCubit cubit) => cubit.state is BookListLoading);
      if (isLoading) {
        return const CircularProgressIndicator();
      }
      final isError =
          context.select((BookListCubit cubit) => cubit.state is BookListError);
      if (isError) {
        return const Text('Error loading books');
      }
      final books = context.select(
          (BookListCubit cubit) => (cubit.state as BookListLoaded).books);
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Title')),
            DataColumn(label: Text('Author')),
            DataColumn(label: Text('Count'), numeric: true),
            DataColumn(label: Text('Category')),
          ],
          rows: [
            ...books.map(
              (e) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        e.id.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataCell(InkWell(
                      child: Text(
                        e.title,
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        context.go('${BookListPage.path}/${e.id}');
                      },
                    )),
                    DataCell(Text(e.author)),
                    DataCell(Text(e.copiesCount.toString())),
                    DataCell(Text(e.category.name)),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }

  FilledButton _addBookButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.go('${BookListPage.path}/${AddBookPage.path}');
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 16,
          top: 6,
          bottom: 6,
        ),
        child: Row(
          spacing: 8,
          children: const [
            Icon(Icons.add),
            Text('Add Book'),
          ],
        ),
      ),
    );
  }

  SearchBar _searchBar(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      hintText: 'Search books by title or author',
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.search),
      ),
      onSubmitted: (value) {
        context.read<BookListCubit>().fetchBooks(
              category: _selectedCategory,
              searchQuery: _searchController.text.trim(),
            );
      },
    );
  }

  Row _categoryFilter(BuildContext context) {
    return Row(
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
                context.read<BookListCubit>().fetchBooks(
                      category: category,
                      searchQuery: _searchController.text.trim(),
                    );
              }
            },
          );
        }),
      ],
    );
  }
}
