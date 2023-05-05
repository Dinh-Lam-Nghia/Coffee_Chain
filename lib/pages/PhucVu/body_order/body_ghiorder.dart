import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
 
class BodyGhiOrderResponsive extends StatelessWidget {
  const BodyGhiOrderResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class BodyGhiOrderPage extends StatefulWidget {
  const BodyGhiOrderPage({super.key});

  @override
  State<BodyGhiOrderPage> createState() => _BodyGhiOrderPageState();
}

enum clickMenuMon { coffee, tea, cake, more }

class _BodyGhiOrderPageState extends State<BodyGhiOrderPage> {
  String selectval = "Coffee";
  clickMenuMon? clMenuMon = clickMenuMon.coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Material(
                    color: AppColors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          clMenuMon = clickMenuMon.coffee;
                        });
                      },
                      child: Container(
                        width: 289,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (clMenuMon == clickMenuMon.coffee)
                                        ? AppColors.Sepia
                                        : AppColors.white,
                                    width: 8))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Coffee",
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Material(
                    color: AppColors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          clMenuMon = clickMenuMon.tea;
                        });
                      },
                      child: Container(
                        width: 289,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (clMenuMon == clickMenuMon.tea)
                                        ? AppColors.Sepia
                                        : AppColors.white,
                                    width: 8))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Trà",
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Material(
                    color: AppColors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          clMenuMon = clickMenuMon.cake;
                        });
                      },
                      child: Container(
                        width: 289,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (clMenuMon == clickMenuMon.cake)
                                        ? AppColors.Sepia
                                        : AppColors.white,
                                    width: 8))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Bánh",
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Material(
                    // elevation: 4,
                    color: AppColors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          clMenuMon = clickMenuMon.more;
                        });
                      },
                      child: Container(
                        width: 289,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (clMenuMon == clickMenuMon.more)
                                        ? AppColors.Sepia
                                        : AppColors.white,
                                    width: 8))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Khác",
                              style: AppStyles.lato
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  width: 752,
                  height: 54,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 40,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          hintText: 'Nhập mã/Tên món cần tìm',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  width: 390,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(25),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    value: selectval,
                    items: const [
                      DropdownMenuItem(
                        value: "Coffee",
                        child: Text('Coffee'),
                      ),
                      DropdownMenuItem(
                        value: "Trà",
                        child: Text('Trà'),
                      ),
                      DropdownMenuItem(
                        value: "Bánh",
                        child: Text('Bánh'),
                      ),
                      DropdownMenuItem(
                        value: "Khác",
                        child: Text('Khác'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectval = value.toString();
                      });
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 25)),
                Container(
                  width: 600,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "1.3 - Bàn 004/Tầng 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 111,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.people_alt,
                        size: 40,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          "5",
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shop,
                        size: 40,
                        color: AppColors.red,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.coffee,
                        size: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
