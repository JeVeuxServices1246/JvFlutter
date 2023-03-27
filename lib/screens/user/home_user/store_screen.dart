import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.adaptive.arrow_back,
                color: Colors.black,
              ),
            ),
            floating: false,
            expandedHeight: size.height * .25,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Salon for Women",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/temp/img1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    const Text(
                      "Salon for Women",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xff757575),
                          size: 18,
                        ),
                        Text(
                          " 4.8 (23k)",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_box,
                          color: Color(0xff757575),
                          size: 18,
                        ),
                        Text(
                          " 354 jobs completed",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    service(),
                    const SizedBox(height: 16,),
                    const Text("Related Services",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 22),
                      physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Get.toNamed(MyRouter.summaryScreen);
                              },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: CachedNetworkImage(
                                    imageUrl: "https://images.news18.com/"
                                        "ibnkhabar/uploads/2021/06/body-spa.jpg?"
                                        "im=FitAndFill,width=480,aspect=fit,"
                                        "type=normal",
                                    fit: BoxFit.cover,
                                    height: size.width*.5,
                                    width: size.width,
                                    errorWidget: (_, __, ___) => const SizedBox(),
                                    placeholder: (_, __) => const SizedBox(),
                                  ),
                                ),
                                const SizedBox(height: 6,),
                                Row(
                                  children: [
                                    const Expanded(child: Text("Facial Name 2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black
                                    ),)),
                                    ElevatedButton(
                                        onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          minimumSize: const Size(0, 0),
                                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
                                        ),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.add,
                                              size: 18,
                                              color: Color(0xff5E17EB),),
                                            Text("Add",style: TextStyle(
                                              color: Color(0xff5E17EB),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                            ),)
                                          ],
                                        ))
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffF5C443),
                                      size: 18,
                                    ),
                                    Text(
                                      " 4.8 (23k)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "₹699",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff5E17EB)),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "₹899",
                                      style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff757575)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: List.generate(
                                      3,
                                          (index) => Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.circle,
                                              size: 10,
                                              color: Color(0xff757575),
                                            ),
                                            Text(
                                              "  For all skin types. Pinacolada mask.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Color(0xff757575)),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                        onPressed: (){
                          Get.toNamed(MyRouter.summaryScreen);
                          },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width, 50),
                          backgroundColor: Colors.black
                        ),
                        child: const Text(
                      "View summary",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),
                    )),
                    const SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  service() {
    return GestureDetector(
      onTap: (){
        Get.toNamed(MyRouter.summaryScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF2ECFD),
            borderRadius: BorderRadius.circular(14)),
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selected Services",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://images.news18.com/"
                        "ibnkhabar/uploads/2021/06/body-spa.jpg?"
                        "im=FitAndFill,width=480,aspect=fit,"
                        "type=normal",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    errorWidget: (_, __, ___) => const SizedBox(),
                    placeholder: (_, __) => const SizedBox(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Diamond Facial",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "₹699",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff5E17EB)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xff757575),
                            ),
                            Text(
                              "  For all skin types. Pinacolada mask.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff757575)),
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
