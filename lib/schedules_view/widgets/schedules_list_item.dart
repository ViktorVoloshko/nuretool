import 'package:flutter/material.dart';

// import '../../utils/utils.dart';

class SchedulesListItem extends StatelessWidget {
  const SchedulesListItem({
    super.key,
    required this.title,
    this.lastUpdated,
    this.isSelected = false,
    this.onTap,
    required this.onRefresh,
    required this.onDelete,
    this.isUpdating = false,
  });

  final String title;
  final DateTime? lastUpdated;
  final bool isSelected;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onRefresh;
  final GestureTapCallback? onDelete;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 24.0, right: 16.0),
      title: Text(
        title,
        style: !isSelected ? null : TextStyle(fontWeight: FontWeight.w700),
      ),
      // subtitle: Text(lastUpdated.toLocalDateFormatString()),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isUpdating)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 16.0,
                width: 16.0,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          if (!isUpdating)
            IconButton(onPressed: onRefresh, icon: Icon(Icons.refresh)),
          IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
