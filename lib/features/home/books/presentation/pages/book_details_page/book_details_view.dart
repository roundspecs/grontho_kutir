part of 'book_details_page.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) {
        if (state is BookDetailsError) {
          context.showSnackBar(message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is BookDetailsLoading) {
          return Center(child: CircularProgressIndicator());
        }

        state as BookDetailsLoaded;
        final book = state.book;
        final copies = state.copies;

        return ColumnWithSpacing(
          children: [
            Column(
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      book.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Chip(
                      label: Text(book.category.name),
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ],
                ),
                Text(
                  book.author,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.go('/books/${book.id}/add');
                  },
                  child: Text('Add New Copy'),
                ),
              ],
            ),
            Text(
              'Copies of Book #${book.id}',
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
                ...copies.map((e) {
                  return DataRow(cells: [
                    DataCell(Text(e.id.toString())),
                    DataCell(Text(e.condition)),
                    DataCell(Text(e.owner.name)),
                    DataCell(Text(e.representative.name)),
                  ]);
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
