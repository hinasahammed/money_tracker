import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyList extends StatelessWidget {
  MoneyList({super.key});
  final today = DateFormat.MMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            leading: CircleAvatar(
              radius: 25,
              child: Text(
                today,
                textAlign: TextAlign.center,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
            title: Text(
              'titleName $index',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              '₹500',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
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
      itemCount: 10,
    );
  }
}
