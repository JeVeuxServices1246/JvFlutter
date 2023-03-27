import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({Key? key}) : super(key: key);

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(MyRouter.storeScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.only(right: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/temp/model.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Salon Classic",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              height: 1.2),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff52B46B).withOpacity(.3),
                                  borderRadius: BorderRadius.circular(6)),
                              padding: const EdgeInsets.all(1),
                              child: const Icon(Icons.attach_money_sharp,
                                  size: 14, color: Color(0xff52B46B)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "ECONOMICAL",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA3A3A3),
                                  fontSize: 14,
                                  height: 1.4),
                            ),
                          ],
                        ),
                        const Text(
                          "VLCC | RICHELON | Crave",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7B7B7B),
                              fontSize: 14,
                              height: 1.3),
                        ),
                      ],
                    )),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
