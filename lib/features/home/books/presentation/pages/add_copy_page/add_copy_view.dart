part of 'add_copy_page.dart';

class AddCopyView extends StatefulWidget {
  final String bookId;
  const AddCopyView(this.bookId, {super.key});

  @override
  State<AddCopyView> createState() => _AddCopyViewState();
}

class _AddCopyViewState extends State<AddCopyView> {
  final _formKey = GlobalKey<FormState>();
  final _conditionController = TextEditingController();
  final _ownerIdController = TextEditingController();
  final _representativeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCopyCubit, AddCopyState>(
      listener: (context, state) {
        if (state is AddCopySuccess) {
          context.showSnackBar(
            message: 'Copy added',
            isError: false,
          );
        } else if (state is AddCopyFailure) {
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
                'Add Copy',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              LimitWidth(
                child: Column(
                  spacing: 16,
                  children: [
                    _bookIdTextField(widget.bookId),
                    _conditionTextField(),
                    _ownerIdTextField(),
                    _representativeIdTextField(),
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
    void pop() => context.pop();

    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: FilledButton(
            child: const Text('Save'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final success = await context.read<AddCopyCubit>().addCopy(
                      bookId: widget.bookId,
                      ownerId: _ownerIdController.text,
                      representativeID: _representativeIdController.text,
                      condition: _conditionController.text,
                    );
                if (success) {
                  pop();
                }
              }
            },
          ),
        ),
        Expanded(
          child: FilledButton(
            child: const Text('Save and Add Another'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AddCopyCubit>().addCopy(
                      bookId: widget.bookId,
                      ownerId: _ownerIdController.text,
                      representativeID: _representativeIdController.text,
                      condition: _conditionController.text,
                    );
                _conditionController.clear();
                _ownerIdController.clear();
                _representativeIdController.clear();
              }
            },
          ),
        ),
      ],
    );
  }

  TextFormField _ownerIdTextField() {
    return TextFormField(
      validator: idValidator,
      controller: _ownerIdController,
      decoration: const InputDecoration(
        labelText: 'Owner ID',
        hintText: 'Student ID',
      ),
    );
  }

  TextFormField _representativeIdTextField() {
    return TextFormField(
      validator: idValidator,
      controller: _representativeIdController,
      decoration: const InputDecoration(
        labelText: 'Representative ID',
        hintText: 'Student ID',
      ),
    );
  }

  TextFormField _conditionTextField() {
    return TextFormField(
      controller: _conditionController,
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Condition',
        hintText: 'e.g. Slightly torn cover, Missing pages',
      ),
    );
  }

  TextFormField _bookIdTextField(String bookId) {
    return TextFormField(
      readOnly: true,
      initialValue: bookId,
      decoration: const InputDecoration(
        labelText: 'Book ID',
      ),
    );
  }
}
