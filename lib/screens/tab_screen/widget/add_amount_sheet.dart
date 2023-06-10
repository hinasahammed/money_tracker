import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:take_care/screens/tab_screen/widget/radio_button_custom.dart';
import 'package:take_care/screens/tab_screen/widget/submit_button.dart';

import '../../../model/transactions_model.dart';

class AddAmountSheet extends StatefulWidget {
  const AddAmountSheet({super.key});

  @override
  State<AddAmountSheet> createState() => _AddAmountSheetState();
}

class _AddAmountSheetState extends State<AddAmountSheet> {
  CategoryType _selectedcategory = CategoryType.food;
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
                'Enter your Transaction',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
              const Row(
                children: [
                  RadioButtonCustom(
                      title: 'income', type: TransactionType.income),
                  RadioButtonCustom(
                      title: 'Expense', type: TransactionType.expense)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedcategory,
                    items: CategoryType.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          if (value == null) {
                            return;
                          }
                          _selectedcategory = value;
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : DateFormat.yMMMMd().format(_selectedDate!),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
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
                  SubmitButton(
                    titleController: _titleController.text,
                    amountController: _amountController.text,
                    selectTime:
                        _selectedDate == null ? DateTime.now() : _selectedDate!,
                    selectedcategory: _selectedcategory,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
