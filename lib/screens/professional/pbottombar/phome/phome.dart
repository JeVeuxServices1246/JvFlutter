import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_home_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/professional/pbottombar/pdashboard/line_charts.dart';
import 'package:jv_app/screens/professional/widget/phoneongoingservice_widget.dart';

class PHome extends StatefulWidget {
  const PHome({super.key});

  @override
  State<PHome> createState() => _PHomeState();
}

class _PHomeState extends State<PHome> {
  final controller = Get.put(PHomeController());
  RxInt controlValue = 0.obs;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDetailsWidget(),
              const SizedBox(
                height: 16,
              ),
              const GetText(
                  text: 'Ongoing service',
                  size: 16,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff161616)),
              const SizedBox(
                height: 11,
              ),
              PHomeOnGoingService(),
              const SizedBox(
                height: 32,
              ),
              buildSlider(screenSize),
              const SizedBox(
                height: 48,
              ),
              graphWidget(),
              const SizedBox(
                height: 42,
              )
            ],
          ),
        ),
      ),
    );
  }

  graphWidget() {
    return SizedBox(
      height: 250,
      child: LineChart(LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(strokeWidth: 0.5, color: const Color(0xffBFA2F7));
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.white, strokeWidth: 0);
              }),
          borderData: FlBorderData(
              show: true,
              border: Border.all(width: 1, color: const Color(0xffBFA2F7))),
          lineBarsData: [
            LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(2.6, 2),
                  const FlSpot(4.9, 5),
                  const FlSpot(6.8, 2.5),
                  const FlSpot(8, 4),
                  const FlSpot(9, 4),
                  const FlSpot(10, 4.3),
                  const FlSpot(11, 4.3),
                ],
                isCurved: true,
                barWidth: 2,
                color: const Color(0xff5E17EB),
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                        colors: [Color(0xff5E17EB), Color(0xffFFFFFF)])))
          ])),
    );
  }

  userDetailsWidget() {
    return Container(
      height: 83,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.black),
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 13, top: 7),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                GetText(
                    text: 'Hello, Ana',
                    size: 14,
                    fontFamily: popionsBold,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff161616)),
                GetText(
                    text: 'You’ve completed 3 jobs today !',
                    size: 12,
                    fontFamily: popionsRegular,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGreyColor)
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icon/hy_emoji.png',
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }

  graphTabBar() {
    return Container();
  }

  buildSlider(Size size) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.maxFinite,
          child: CarouselSlider(
            items: List.generate(
                4,
                (index) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/pbanner.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                    )),
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pauseAutoPlayOnTouch: true,
                viewportFraction: .92,
                onPageChanged: (value, _) {
                  controlValue.value = value;
                }),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              4,
              (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controlValue.value == index
                              ? const Color(0xff8C52FF)
                              : const Color(0xffE4D6FF),
                        ),
                        height: 6,
                        width: controlValue.value == index ? 32 : 6,
                      );
                    }),
                  )),
        ),
      ],
    );
  }
}
