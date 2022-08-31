import 'package:flutter/material.dart';

class AddNoteRoute<T> extends PageRoute<T> {
  final Function(BuildContext context) widgetBuilder;
  final bool isFullscreenDialog;

  AddNoteRoute({
    required this.widgetBuilder,
    this.isFullscreenDialog = false})
      :super(fullscreenDialog: isFullscreenDialog);

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  Color? get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => "Add note";

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widgetBuilder(context);
  }
}
