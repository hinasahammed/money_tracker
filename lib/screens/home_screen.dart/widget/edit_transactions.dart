import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:take_care/model/transactions_model.dart';

class EditTransactions extends StatefulWidget {
  const EditTransactions({
    super.key,
    required this.transactionsModel,
  });
  final TransactionsModel transactionsModel;
  @override
  State<EditTransactions> createState() => _EditTransactionsState();
}

class _EditTransactionsState extends State<EditTransactions> {
  DateTime? _selectedDate;

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            keyBoardSpace + 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit your Transaction',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _titleController,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                decoration: const InputDecoration(
                  label: Text('Amount'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat.yMMMMd().format(_selectedDate!),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      _submitEditedData();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitEditedData() async {
    widget.transactionsModel.title = _titleController.text.toString();
    widget.transactionsModel.amount = _amountController.text.toString();
    widget.transactionsModel.date = _selectedDate!;
    await widget.transactionsModel.save();
  }
}
