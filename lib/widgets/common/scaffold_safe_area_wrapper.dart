import 'package:animated_splash/main.dart';
import 'package:flutter/material.dart';

class ScaffoldSafeAreaWrapper extends StatefulWidget {
  const ScaffoldSafeAreaWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ScaffoldSafeAreaWrapper> createState() =>
      _ScaffoldSafeAreaWrapperState();
}

class _ScaffoldSafeAreaWrapperState extends State<ScaffoldSafeAreaWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appMainColor.shade50,
      body: SafeArea(
        child: widget.child,
      ),
    );
  }
}
