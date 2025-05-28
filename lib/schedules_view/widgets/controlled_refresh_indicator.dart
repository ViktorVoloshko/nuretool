import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/schedules_view_cubit.dart';

class ControlledRefreshIndicator extends StatefulWidget {
  const ControlledRefreshIndicator({
    super.key,
    required this.child,
    this.checkStateEvery = Durations.short4,
  });

  final Widget child;
  final Duration checkStateEvery;

  @override
  State<ControlledRefreshIndicator> createState() =>
      _ControlledRefreshIndicatorState();
}

class _ControlledRefreshIndicatorState
    extends State<ControlledRefreshIndicator> {
  final _kRefreshIndicatorState = GlobalKey<RefreshIndicatorState>();
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SchedulesViewCubit, SchedulesViewState>(
      listener: (context, state) {
        _isRefreshing = state.updating;
        setState(() => _triggerRefresh());
      },
      listenWhen: (previous, current) => previous.updating != current.updating,
      child: RefreshIndicator(
        key: _kRefreshIndicatorState,
        onRefresh: _onRefresh,
        child: widget.child,
      ),
    );
  }

  void _triggerRefresh() {
    if (_isRefreshing) _kRefreshIndicatorState.currentState?.show();
  }

  Future<void> _onRefresh() async {
    while (_isRefreshing) {
      await Future.delayed(widget.checkStateEvery);
    }
  }
}
