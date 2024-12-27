part of 'add_book_page.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({super.key});

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  var _selectedCategory = Category.academic;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBookCubit, AddBookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          context.showSnackBar(
            message: 'Book added',
            isError: false,
          );
        } else if (state is AddBookFailure) {
          context.showSnackBar(
            message: state.message,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is AddBookLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          key: _formKey,
          child: ColumnWithSpacing(
            children: [
              Text(
                'Add Book',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              LimitWidth(
                child: Column(
                  spacing: 16,
                  children: [
                    _titleTextField(),
                    _authorTextField(),
                    _categoryDropdown(),
                    _buttonRow(context)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row _buttonRow(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: FilledButton(
            child: const Text('Save'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                context.read<AddBookCubit>().addBook(
                      title: _titleController.text,
                      author: _authorController.text,
                      category: _selectedCategory,
                    );
                context.pop();
              }
            },
          ),
        ),
        Expanded(
          child: FilledButton(
            child: const Text('Save and Add Another'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AddBookCubit>().addBook(
                      title: _titleController.text,
                      author: _authorController.text,
                      category: _selectedCategory,
                    );
                _titleController.clear();
                _authorController.clear();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryDropdown() {
    return DropdownButtonFormField<Category>(
      value: _selectedCategory,
      onChanged: (value) {
        setState(() {
          _selectedCategory = value!;
        });
      },
      items: Category.categories
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name),
            ),
          )
          .toList(),
      decoration: const InputDecoration(labelText: 'Category'),
    );
  }

  TextFormField _authorTextField() {
    return TextFormField(
      validator: authorNameValidator,
      controller: _authorController,
      decoration: const InputDecoration(
        labelText: 'Author',
      ),
    );
  }

  TextFormField _titleTextField() {
    return TextFormField(
      validator: bookTitleValidator,
      controller: _titleController,
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
    );
  }
}
