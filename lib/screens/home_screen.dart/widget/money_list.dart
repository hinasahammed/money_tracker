import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:take_care/box/boxes.dart';
import 'package:take_care/screens/home_screen.dart/widget/edit_transactions.dart';

import '../../../model/transactions_model.dart';

class MoneyList extends StatelessWidget {
  const MoneyList({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionsModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, _) {
        var data =
            box.values.toList().cast<TransactionsModel>().reversed.toList();

        return ListView.separated(
          itemBuilder: (context, index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      _removeItem(data[index]);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Transaction Deleted'),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                box.add(data[index]);
                              }),
                        ),
                      );
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _editList(context, data[index]);
                    },
                    backgroundColor: Colors.blue,
                    icon: Icons.edit_outlined,
                  ),
                ],
              ),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  leading: CircleAvatar(
                    backgroundColor:
                        data[index].transactionType == TransactionType.expense
                            ? Theme.of(context).colorScheme.error
                            : Colors.greenAccent,
                    radius: 25,
                    child: Text(
                      DateFormat.MMMd().format(data[index].date),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                  title: Text(
                    data[index].title.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  subtitle: Text(
                    '₹ ${data[index].amount}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: box.length,
        );
      },
    );
  }

  void _removeItem(TransactionsModel transactionsModel) {
    transactionsModel.delete();
  }

  void _editList(
    BuildContext context,
    TransactionsModel transactionsModel,
  ) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) =>  EditTransactions(transactionsModel: transactionsModel,));
  }
}
