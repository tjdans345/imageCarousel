import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Timer? timer;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int currentPage = pageController.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      pageController.animateToPage(
          nextPage, duration: const Duration(milliseconds: 400),
          curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView( // 리스트를 받아 페이지 형식으로 넘겨주는 클래스
        controller: pageController,
        children: [1, 2, 3, 4, 5]
            .map((e) =>
            Image.asset(
              'asset/img/image_$e.jpeg',
              fit: BoxFit.cover,
            ))
            .toList(),
      ),
    );
  }
}
