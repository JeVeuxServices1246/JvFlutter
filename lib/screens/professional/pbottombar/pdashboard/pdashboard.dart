import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/pdashboard_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/professional/pbottombar/pdashboard/line_charts.dart';

class PDashboard extends StatefulWidget {
  const PDashboard({super.key});

  @override
  State<PDashboard> createState() => _PDashboardState();
}

class _PDashboardState extends State<PDashboard> {
  final controller = Get.put(PDashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            rankingWidget(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userBookingInfoWidget('assets/icon/totalbookingicon.png',
                      'total\nbookings', '26', false),
                  userBookingInfoWidget('assets/icon/totalearningicon.png',
                      'total\nearnings', '₹5.1', true),
                  userBookingInfoWidget('assets/icon/overallratingicon.png',
                      'overall\nratings', '4.5', false),
                ],
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            graphTabBar(),
            const SizedBox(
              height: 16,
            ),
            graphWidget()
          ],
        ),
      ),
    );
  }

  graphWidget() {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16),
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

  graphTabBar() {
    return Container(
      height: 49,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xff393939),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tabbarUI('this week', 0, () {
            controller.changeTabValue(0);
          }),
          tabbarUI('this month', 1, () {
            controller.changeTabValue(1);
          }),
          tabbarUI('this year', 2, () {
            controller.changeTabValue(2);
          }),
        ],
      ),
    );
  }

  tabbarUI(String title, int index, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: controller.currentTab.value == index
                ? AppColors.whiteColor
                : const Color(0xff393939),
            borderRadius: BorderRadius.circular(25),
          ),
          height: 33,
          width: 102,
          alignment: Alignment.center,
          child: GetText(
              text: title,
              size: 14,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: controller.currentTab.value == index
                  ? AppColors.textBlackColor
                  : AppColors.whiteColor),
        ),
      ),
    );
  }

  userBookingInfoWidget(String img, String title1, String title2, bool show) {
    return SizedBox(
      height: 134,
      child: Stack(
        children: [
          Container(
            height: 116,
            width: 105,
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetText(
                    text: title1,
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor),
                SizedBox(
                  height: 34,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GetText(
                          text: title2,
                          size: 26,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor),
                      const SizedBox(
                        width: 4,
                      ),
                      show
                          ? const GetText(
                              text: 'k',
                              size: 14,
                              fontFamily: popionsMedium,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor)
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 32,
            child: Image.asset(
              img,
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
    );
  }

  rankingWidget() {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.pLeadsBoard);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.blackColor,
              width: 1.5,
            )),
        child: Row(children: [
          Image.asset(
            'assets/icon/Medal.png',
            width: 56,
            height: 56,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GetText(
                  text: 'Weekly Ranking',
                  size: 16,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor),
              GetText(
                  text: 'you are rank 3',
                  size: 14,
                  fontFamily: popionsRegular,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff515151))
            ],
          ),
          const Spacer(),
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                color: Color(0xff010101), shape: BoxShape.circle),
            child: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
