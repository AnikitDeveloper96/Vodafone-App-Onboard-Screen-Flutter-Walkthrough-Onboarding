// ignore_for_file: avoid_print

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onboarding_screen_flutter_app/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController controller = PageController(initialPage: 0);
  Widgets widgets = Widgets();
  List<Widget> pages = [
    Widgets().pageone(),
    Widgets().pagetwo(),
    Widgets().pagethree(),
  ];
  void getChangedPageAndMoveBar(int page) {
    _currentPage = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (int index) {
            getChangedPageAndMoveBar(index);
          },
          scrollDirection: Axis.horizontal,
          children: pages,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: SmoothPageIndicator(
                      textDirection: TextDirection.ltr,
                      controller: controller,
                      count: pages.length,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(seconds: 5),
                          curve: Curves.bounceInOut),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 28.0),
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //           color: AppColors.backgroundcolorone,
                  //           border:
                  //               Border.all(color: AppColors.backgroundcolor),
                  //           borderRadius: BorderRadius.circular(20.0)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: SizedBox(
                  //           width: 90.0,
                  //           child: Center(
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 controller.animateToPage(_currentPage,
                  //                     duration: Duration(seconds: 5),
                  //                     curve: Curves.bounceInOut);
                  //               },
                  //               child: Text(
                  //                 "next",
                  //                 //     : "Lets get started",
                  //                 style: TextStyle(
                  //                     //   height: 1.5,
                  //                     color: Colors.white,
                  //                     fontSize: 15.0,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     fontWeight: FontWeight.normal),
                  //                 maxLines: 1,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       )),
                  // )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class Widgets {
  Widget pageone() {
    return CustomWidget(
      backgroundcolor: AppColors.backgroundcolor,
      heading: "recharge & pay bill for self & others",
      headingcolor: Colors.white,
      textcolor: Colors.white,
      iconcolor: Colors.white,
      listofstring: const [
        "Link and manage upto 25 profiles to your account on Vi app ,",
        "Make payments with UPI,cards or other payments methods of choice,",
        "Check real time usage & get notififed when your next recharge is due,"
      ],
      customicon: const [
        Icons.manage_accounts,
        Icons.credit_card,
        Icons.history,
      ],
    );
  }

  Widget pagetwo() {
    return CustomWidget(
      backgroundcolor: AppColors.backgroundcolorone,
      heading: "get exclusive offers only on Vi app",
      headingcolor: AppColors.backgroundcolor,
      textcolor: AppColors.backgroundcolor,
      iconcolor: AppColors.backgroundcolor,
      listofstring: const [
        "Explore wide range of Vi recharge packs & collect cashback coupons,",
        "Avail hand-picked deals & offers as part of Vi Tuesdays,",
        "Get recommended recharge offers created just for you ,"
      ],
      customicon: const [
        Icons.credit_card,
        Icons.card_giftcard,
        Icons.card_membership,
      ],
    );
  }

  Widget pagethree() {
    return CustomWidget(
      backgroundcolor: AppColors.backgroundcolortwo,
      heading: "don't worry, Vi app is here to help you !",
      headingcolor: Colors.white,
      textcolor: Colors.white,
      listofstring: const [
        "24x7 help available for all your queries",
        "Update your profile & manage services like DND,",
        "Check your past recharges & download their receipts ,"
      ],
      iconcolor: Colors.white,
      customicon: const [
        Icons.panorama_fish_eye_sharp,
        Icons.settings,
        Icons.document_scanner,
      ],
    );
  }
}

class CustomWidget extends StatefulWidget {
  final Color backgroundcolor;
  final String heading;
  final List<String> listofstring;
  final List<IconData> customicon;
  final Color headingcolor;
  final Color textcolor;
  final Color iconcolor;

  CustomWidget({
    required this.backgroundcolor,
    required this.heading,
    required this.headingcolor,
    required this.iconcolor,
    required this.textcolor,
    required this.listofstring,
    required this.customicon,
  });
  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundcolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: widget.backgroundcolor,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(top: 20.0, right: 30.0),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: const Text(
        //         "Skip",
        //         style: TextStyle(color: Colors.white, fontSize: 12.0),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Text(
                widget.heading,
                style: TextStyle(
                    color: widget.headingcolor,
                    fontSize: 52.0,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
                maxLines: 3,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                  child: ListView.separated(
                      itemCount: widget.listofstring.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 30.0,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              widget.customicon[index],
                              size: 50.0,
                              color: widget.iconcolor,
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.listofstring[index],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: widget.textcolor,
                                          fontSize: 18.0,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.normal),
                                      maxLines: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
            ],
          )),
    );
  }
}
