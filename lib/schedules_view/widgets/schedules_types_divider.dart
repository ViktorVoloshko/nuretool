import 'package:flutter/material.dart';

class SchedulesTypesDivider extends StatelessWidget {
  const SchedulesTypesDivider({
    super.key,
    required this.typeName,
    required this.onAdd,
  });

  final String typeName;
  final GestureTapCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              typeName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(child: Divider()),
          IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
