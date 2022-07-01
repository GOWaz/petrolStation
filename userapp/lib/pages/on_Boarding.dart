// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:userapp/pages/sign_in.dart';

class boardingModel {
  final String image;
  final String title;
  final String body;
  boardingModel({required this.image, required this.title, required this.body});
}

// ignore: camel_case_types
class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);
  static const routeName = '/onBoarding';

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  var boardingController = PageController();
  List<boardingModel> boarding = [
    boardingModel(
        image: 'images/station.png',
        title: 'Comfortably',
        body: 'Choose the station that suits you'),
    boardingModel(
        image: 'images/fuel1.png',
        title: 'On Time',
        body: 'Order fuel for your car from anywhere'),
    boardingModel(
        image: 'images/download.png',
        title: 'Easy And Fast',
        body: 'Get your fuel without waiting'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.amber,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignIn.routeName);
              },
              child: const Text(
                'SKIP',
                style: TextStyle(color: Colors.amber),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.amber,
                    activeDotColor: Colors.teal,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      boardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  backgroundColor: Colors.amber,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(boardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      );
}
