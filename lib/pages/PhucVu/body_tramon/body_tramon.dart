import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';

class TramonPageResponsive extends StatelessWidget {
  const TramonPageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: TramonPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
        ),
        large: TramonPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
        ));
  }
}

class TramonPage extends StatefulWidget {
  const TramonPage(
      {super.key,
      required this.sizeText,
      required this.widthButton,
      required this.heightButton,
      required this.small});
  final bool small;
  final double sizeText;
  final double widthButton;
  final double heightButton;

  @override
  State<TramonPage> createState() => _TramonPageState();
}

class _TramonPageState extends State<TramonPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text("Đinh Lâm Nghĩa ",
                                    style: AppStyles.montserrat.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                const Icon(Icons.person, size: 40)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              //
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 30),
                            width: 985,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Bàn order",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                const SizedBox(
                                  width: 370,
                                ),
                                Text("Số lượng",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 84,
                            decoration: const BoxDecoration(
                              color: AppColors.brightPink,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tầng 1 - 012",
                                    style: AppStyles.lato.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("9",
                                    style: AppStyles.lato.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_box)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Tầng 1 - 004",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                const SizedBox(
                                  width: 380,
                                ),
                                Text("9",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Tầng 1 - 004",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                const SizedBox(
                                  width: 380,
                                ),
                                Text("9",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Tầng 1 - 004",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                const SizedBox(
                                  width: 380,
                                ),
                                Text("9",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 985,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: AppColors.colorrow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 30),
                            width: 770,
                            height: 84,
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("1.1 - Bàn 012/Tầng 1",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Black Coffe",
                                    style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    )),
                                Text("3",
                                    style: AppStyles.lato.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.green,
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_circle)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 79,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Row(),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20, left: 25),
                            width: 770,
                            height: 152,
                            decoration:
                                const BoxDecoration(color: Colors.white70),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(30),
                                  width: 187,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.Sepia),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          iconSize: 60,
                                          color: Colors.green,
                                          onPressed: () {},
                                          icon: const Icon(Icons.check_circle)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
