//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  final String title;

  const IntroPage({super.key, this.title = 'Default Title'});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  bool onLastPage = false;
  List colors = [Colors.pink, Colors.red, Colors.green];
  List description = [
    'exercise is good for your health',
    'sleep is important',
    'go to work'
  ];
  List images = ['assets/exercise.png', 'assets/sleep.png', 'assets/work.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('To _do_app'),
        SizedBox(
          height: 20,
          
        ),
        Expanded(
            child: PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
              print("$index, $onLastPage");
            });
          },
          itemCount: 3,
          itemBuilder: (context, index) => OnboardingWidget(
            image: images[index],
            description: description[index],
            color: colors[index],
          ),
        )),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'task');
              },
              child: Text('skip'),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: SwapEffect(
                  dotColor: Colors.blue,
                  activeDotColor: Colors.green,
                  type: SwapType.yRotation),
            ),
          ],
        )
      ],
    )
        // Stack(children: [
        //   PageView(
        //     controller: controller,
        //     onPageChanged: (index) {
        //       setState(() {
        //         onLastPage = (index == 2);
        //         print("$index, $onLastPage");
        //       });
        //     },
        //     children: [
        //         _buildPage(
        //           image: 'assets/sleep.png',
        //           title: 'Prioritize Your Sleep',
        //           description: 'A good night\'s sleep keeps your mind fresh and productive.',
        //         ),
        //       Container(
        //         color: Colors.pink,
        //         child: Image.asset('assets/sleep.png'),
        //       ),
        //       Container(
        //         color: Colors.pink,
        //         child: Image.asset('assets/exercise.png'),
        //       ),
        //       Container(
        //         color: Colors.pink,
        //         child: Image.asset('assets/work.png'),
        //       ),
        //     ],
        // ),
        //   Container(
        //     alignment: const Alignment(0, 0.85),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             Navigator.pushNamed(context, 'tasks');
        //           },
        //         ),
        //         Text(
        //           'skip',
        //           style: TextStyle(color: Colors.grey)
        //         ),

        //         SmoothPageIndicator(
        //           controller: controller,
        //           count: 3,
        //           effect: SwapEffect(
        //               dotColor: Colors.blue,
        //               activeDotColor: Colors.white,
        //               type: SwapType.yRotation),
        //         ),
        //         onLastPage
        //             ? GestureDetector(
        //                 onTap: () {
        //                   Navigator.pushNamed(context, 'tasks');
        //                 },
        //                 child: Text('done', style: TextStyle(color: Colors.grey)))
        //             : GestureDetector(
        //                 onTap: () {
        //                   controller.nextPage(
        //                       duration: Duration(microseconds: 500),
        //                       curve: Curves.easeIn);
        //                 },
        //                 child:
        //                     const Icon(Icons.arrow_forward, color: Colors.grey),
        //               )
        //       ],
        //     ),
        //   )
        // ]
        // ),
        );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String image;
  final Color color;
  final String description;
  const OnboardingWidget({
    required this.color,
    required this.description,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          width: 200,
          decoration: BoxDecoration(
            color: color,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(description)
      ],
    );
  }
}
