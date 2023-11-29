import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../box/boxes.dart';
import '../../../model/transactions_model.dart';

class IncomeAnalytics extends StatelessWidget {
  const IncomeAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionsModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, _) {
        var data = box.values
            .where((type) => type.transactionType == TransactionType.income)
            .toList()
            .cast<TransactionsModel>()
            .reversed
            .toList();
        var foodData = data
            .where((category) => category.categoryType == CategoryType.food);
        var transportData = data.where(
            (category) => category.categoryType == CategoryType.transport);
        var rentData = data
            .where((category) => category.categoryType == CategoryType.rent);
        var etcData =
            data.where((category) => category.categoryType == CategoryType.etc);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   'Spent details',
            //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            //         color: Theme.of(context).colorScheme.inverseSurface,
            //       ),
            // )
            Card(
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: foodData.isEmpty
                                  ? 0
                                  : foodData.length.toDouble() + 10,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Food',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: transportData.isEmpty
                                  ? 0
                                  : transportData.length.toDouble() + 10,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Transport',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: rentData.isEmpty
                                  ? 0
                                  : rentData.length.toDouble() + 10,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rent',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: etcData.isEmpty
                                  ? 0
                                  : etcData.length.toDouble() + 10,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Etc',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
