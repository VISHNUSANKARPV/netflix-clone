import 'package:flutter/material.dart';
import 'package:net_flix/presentation/downloads/screen_downloads.dart';
import 'package:net_flix/presentation/fastlaugh/screenfast_laugh.dart';
import 'package:net_flix/presentation/home/screen_home.dart';
import 'package:net_flix/presentation/mainpage/screen_bottom.dart';
import 'package:net_flix/presentation/new_hot/screen_new_hot.dart';
import 'package:net_flix/presentation/search/search.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _pages = [const HomeScreen(), const Newhot(), const FastLaugh(), const Search(), const Downloads()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ValueListenableBuilder(
        valueListenable: indexchangingNotifier,
        builder: (BuildContext context, int value, Widget? child) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: const BottumNavWidgets(),
    );
  }
}
