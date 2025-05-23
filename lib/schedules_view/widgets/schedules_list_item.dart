import 'package:flutter/material.dart';

// import '../../utils/utils.dart';

class SchedulesListItem extends StatelessWidget {
  const SchedulesListItem({
    super.key,
    required this.title,
    this.lastUpdated,
    this.onTap,
    required this.onRefresh,
    required this.onDelete,
  });

  final String title;
  final DateTime? lastUpdated;
  final GestureTapCallback? onTap;
  final GestureTapCallback onRefresh;
  final GestureTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 24.0, right: 16.0),
      title: Text(title),
      // subtitle: Text(lastUpdated.toLocalDateFormatString()),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onRefresh, icon: Icon(Icons.refresh)),
          IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
