import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/dimensions.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Services for woman",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index1) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Spa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 226),
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(MyRouter.storeListScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(1, 1),
                                    spreadRadius: 0,
                                    blurRadius: 1),
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(-1, -1),
                                    spreadRadius: 0,
                                    blurRadius: 1),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              // horizontal: AddSize.padding14,
                              vertical: AddSize.size5),
                          width: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: const Offset(1, 1),
                                          spreadRadius: 0,
                                          blurRadius: 1),
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: const Offset(-1, -1),
                                          spreadRadius: 0,
                                          blurRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://grazia.wwmindia.com/content/2016/nov/moroccan-oil-hair-spa-at-myglamm_gallery_large_1489407067.jpg",
                                    errorWidget: (_, __, ___) =>
                                        const SizedBox(),
                                    placeholder: (_, __) => const SizedBox(),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Facial for glow",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            );
          }),
    );
  }
}
