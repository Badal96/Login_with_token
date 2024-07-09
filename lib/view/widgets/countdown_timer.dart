import 'dart:async';

import 'package:flutter/widgets.dart';

class CountdownController {
  VoidCallback? onPause;

  VoidCallback? onResume;

  VoidCallback? onRestart;

  VoidCallback? onStart;

  bool? isCompleted;

  final bool autoStart;

  CountdownController({this.autoStart = false});

  final valueChanged = ValueNotifier<int>(0);

  start() {
    if (onStart != null) {
      onStart!();
    }
  }

  setOnStart(VoidCallback onStart) {
    this.onStart = onStart;
  }

  pause() {
    if (onPause != null) {
      onPause!();
    }
  }

  setOnPause(VoidCallback onPause) {
    this.onPause = onPause;
  }

  resume() {
    if (onResume != null) {
      onResume!();
    }
  }

  setOnResume(VoidCallback onResume) {
    this.onResume = onResume;
  }

  restart() {
    if (onRestart != null) {
      onRestart!();
    }
  }

  setOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }
}

class Countdown extends StatefulWidget {
  final int seconds;

  final Widget Function(BuildContext, double) build;

  final Function? onFinished;

  final Duration interval;

  final CountdownController? controller;

  const Countdown({
    Key? key,
    required this.seconds,
    required this.build,
    this.interval = const Duration(seconds: 1),
    this.onFinished,
    this.controller,
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  final int _secondsFactor = 1000000;

  Timer? _timer;

  bool _onFinishedExecuted = false;

  late int _currentMicroSeconds;

  @override
  void initState() {
    _currentMicroSeconds = widget.seconds * _secondsFactor;

    widget.controller?.setOnStart(_startTimer);
    widget.controller?.setOnStart(_startTimer);
    widget.controller?.setOnPause(_onTimerPaused);
    widget.controller?.setOnResume(_onTimerResumed);
    widget.controller?.setOnRestart(_onTimerRestart);
    widget.controller?.isCompleted = false;

    if (widget.controller == null || widget.controller!.autoStart == true) {
      _startTimer();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(Countdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds) _currentMicroSeconds = widget.seconds * _secondsFactor;
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(
      context,
      _currentMicroSeconds / _secondsFactor,
    );
  }

  void _onTimerPaused() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }

  void _onTimerResumed() {
    _startTimer();
  }

  void _onTimerRestart() {
    widget.controller?.isCompleted = false;
    _onFinishedExecuted = false;

    if (mounted) {
      setState(() {
        _currentMicroSeconds = widget.seconds * _secondsFactor;
      });

      _startTimer();
    }
  }

  void _startTimer() {
    if (_timer?.isActive == true) {
      _timer!.cancel();

      widget.controller?.isCompleted = true;
    }

    _timer = Timer.periodic(
      widget.interval,
      (Timer timer) {
        if (_currentMicroSeconds <= 0) {
          widget.controller!.valueChanged.value = 0;
          timer.cancel();

          if (widget.onFinished != null) {
            widget.onFinished!();
            _onFinishedExecuted = true;
          }
          widget.controller?.isCompleted = true;
        } else {
          _onFinishedExecuted = false;
          setState(() {
            _currentMicroSeconds = _currentMicroSeconds - widget.interval.inMicroseconds;
            widget.controller!.valueChanged.value = _currentMicroSeconds;
          });
        }
      },
    );
  }
}
