import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/moneyProvider.dart';
import 'package:enlighten_astro/utils/appBar.dart';
import 'package:enlighten_astro/main.dart';
import 'package:enlighten_astro/utils/bottomNavBar.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:enlighten_astro/utils/sideDrawer.dart';
import 'package:enlighten_astro/widgets/adviceButton.dart';
import 'package:enlighten_astro/widgets/customContainer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  final YoutubePlayerController _ytcontroller = YoutubePlayerController(
    initialVideoId: 'Hk6xf1svLjY',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );
  int sliderIndex = 0;
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit!");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: myAppBar(),
      ),
      drawer: SideDrawer(),
      bottomNavigationBar: myBottomNavBar(),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: width * 0.052),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width,
                  ),
                  Column(children: <Widget>[
                    CarouselSlider(
                      items: [
                        Image.asset(
                          'assets/banner.png',
                        ),
                        Image.asset(
                          'assets/banner.png',
                        ),
                        Image.asset(
                          'assets/banner.png',
                        ),
                      ],
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            sliderIndex = index;
                          });
                        },
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              border:
                                  Border.all(width: 1, color: Colors.orange),
                              color: sliderIndex == 0
                                  ? Colors.orange[200]
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              border:
                                  Border.all(width: 1, color: Colors.orange),
                              color: sliderIndex == 1
                                  ? Colors.orange[200]
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              border:
                                  Border.all(width: 1, color: Colors.orange),
                              color: sliderIndex == 2
                                  ? Colors.orange[200]
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomContainerWdt(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(
                                'assets/astrologer.png',
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Get the best',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Astrology Consultation',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "I am K Jagadish, an Astrologer, Life coach, Author, Spiritual Thinker and an Entrepreneur, with over 50 years of experience in Astrology and approach with a research and scientific bent of mind with a holistic life challenging experience thus far.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              height: 1.4,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/consOptions');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.call),
                                SizedBox(width: 12),
                                Text(
                                  "BOOK A COONSULTATION",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomContainerWdt(
                    text: "Astrology Advice for Everyone",
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            adviceButton(
                                text: "Business Decision",
                                icon: Icons.handshake_sharp),
                            adviceButton(
                                text: "Business Decision",
                                icon: Icons.attach_money_rounded),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            adviceButton(
                                text: "Property Deals",
                                icon: Icons.home_filled),
                            adviceButton(
                                text: "Personal Life", icon: Icons.people),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomContainerWdt(
                    text: "Video",
                    child: YoutubePlayer(
                      controller: _ytcontroller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomContainerWdt(
                    text: "Shop Online",
                    child: MaterialButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://enlightenmind.org/books/mindbuilding/');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Image.asset(
                        'assets/bookcover.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
