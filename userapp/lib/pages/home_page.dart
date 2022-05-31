import 'package:fill_me/widgets/page_upper_side.dart';
import 'package:flutter/material.dart';
import '../widgets/home_page_containers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/MainPage';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageUpperSide(title: 'Discover', size: size),
              const SizedBox(height: 100),
              Row(
                children: [
                  HomePageButtons(
                    onTap: () {},
                    containerIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFFFECB3),
                      size: 100,
                    ),
                    label: 'Profile',
                    size: size,
                  ),
                  HomePageButtons(
                    onTap: () {},
                    containerIcon: const Icon(
                      Icons.reorder,
                      color: Color(0xFFFFECB3),
                      size: 100,
                    ),
                    label: 'State',
                    size: size,
                  ),
                ],
              ),
              Row(
                children: [
                  HomePageButtons(
                    onTap: () {},
                    containerIcon: const Icon(
                      Icons.money,
                      color: Color(0xFFFFECB3),
                      size: 100,
                    ),
                    label: 'Bills',
                    size: size,
                  ),
                  HomePageButtons(
                    onTap: () {},
                    containerIcon: const Icon(
                      Icons.directions_car,
                      color: Color(0xFFFFECB3),
                      size: 100,
                    ),
                    label: 'Add Car',
                    size: size,
                  ),
                ],
              ),
              HomePageButtons(
                onTap: () {},
                containerIcon: const Icon(
                  Icons.add_box_rounded,
                  size: 100,
                  color: Color(0xFFFFECB3),
                ),
                label: 'Request',
                size: size,
              )
            ],
          ),
        ),
      ),
    );
  }
}
