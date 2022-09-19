import 'package:flutter/material.dart';
import 'package:net_flix/presentation/common_widgets/common_head.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar:   PreferredSize(
          preferredSize:  Size.fromHeight(50),
          child: AppbarCommon()),
      ),
    );
  }
}