import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_chain/models/phucvu/mon_model.dart';
import 'package:coffee_chain/module/Phucvu_provider/order_Provider/ghiOrder_Provider.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order/DSmon.dart';

class BodyGhiOrderResponsive extends StatelessWidget {
  const BodyGhiOrderResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
        small: BodyGhiOrderPage(
          sizeText: width * 0.3 / 15,
          widthButton: width * 0.3,
          heightButton: width * 0.3 / 5,
          small: true,
        ),
        large: BodyGhiOrderPage(
          sizeText: width * 0.2 / 15,
          widthButton: width * 0.2,
          heightButton: width * 0.2 / 6,
          small: false,
        ));
  }
}

class BodyGhiOrderPage extends StatefulWidget {
  const BodyGhiOrderPage(
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
  State<BodyGhiOrderPage> createState() => _BodyGhiOrderPageState();
}

enum clickMenuMon { coffee, tea, cake, more }

class _BodyGhiOrderPageState extends State<BodyGhiOrderPage> {
  String selectval = "Coffee";
  String selectval1 = "Bàn 1 tầng 1";
  clickMenuMon? clMenuMon = clickMenuMon.coffee;

  final GhiorderProvider _ghiorderProvider = GhiorderProvider();

  @override
  void initState() {
    _ghiorderProvider.getListDSmon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<GhiorderProvider>(
      create: (context) => _ghiorderProvider,
      builder: (context, child) {
        return Consumer<GhiorderProvider>(
          builder: (context, model, child) {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
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
                                                    color: (clMenuMon ==
                                                            clickMenuMon.coffee)
                                                        ? AppColors.Sepia
                                                        : AppColors.white,
                                                    width: 8))),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Coffee",
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600)),
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
                                                    color: (clMenuMon ==
                                                            clickMenuMon.tea)
                                                        ? AppColors.Sepia
                                                        : AppColors.white,
                                                    width: 8))),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Trà",
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600)),
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
                                                    color: (clMenuMon ==
                                                            clickMenuMon.cake)
                                                        ? AppColors.Sepia
                                                        : AppColors.white,
                                                    width: 8))),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Bánh",
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600)),
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
                                                    color: (clMenuMon ==
                                                            clickMenuMon.more)
                                                        ? AppColors.Sepia
                                                        : AppColors.white,
                                                    width: 8))),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Khác",
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text("Đinh Lâm Nghĩa ",
                                            style: AppStyles.montserrat
                                                .copyWith(
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
                      const SizedBox(height: 10),
                      //
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: (width / 5) * 3,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: (((width / 5) * 3) / 5) * 3,
                                            height: 54,
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                      Icons.search,
                                                      size: 40,
                                                    ),
                                                    suffixIcon: IconButton(
                                                      icon: const Icon(
                                                          Icons.clear),
                                                      onPressed: () {
                                                        /* Clear the search field */
                                                      },
                                                    ),
                                                    hintText:
                                                        'Nhập mã/Tên món cần tìm',
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                          //
                                          Container(
                                            width: (((width / 5) * 3) / 5) * 2,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
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
                                          //
                                        ],
                                      ),
                                    ),
                                    //
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(20),
                                      child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 300,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: model.ListDSmon.length,
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return Container(
                                              color: AppColors.white,
                                              child: Column(
                                                children: [
                                                  Image.asset(model
                                                      .ListDSmon[index].image
                                                      .toString()),
                                                  Container(
                                                    width: double.infinity,
                                                    child: Column(
                                                      children: [
                                                        AutoSizeText(
                                                          model.ListDSmon[index]
                                                              .tenMon
                                                              .toString(),
                                                          style: AppStyles
                                                              .montserrat
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: AppColors
                                                                .black87,
                                                          ),
                                                          maxFontSize: 20,
                                                          minFontSize: 15,
                                                          maxLines: 1,
                                                        ),
                                                        AutoSizeText(
                                                          '${model.ListDSmon[index].giaTien.toString()} VND',
                                                          style: AppStyles
                                                              .montserrat
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 20,
                                                            color:
                                                                AppColors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    //
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ((width / 5) * 2),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          width: ((width / 5) * 4) / 3,
                                          height: 50,
                                          child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            icon: const Icon(Icons.search),
                                            elevation: 16,
                                            value: selectval1,
                                            items: const [
                                              DropdownMenuItem(
                                                value: "Bàn 1 tầng 1",
                                                child: Text('Bàn 1 tầng 1'),
                                              ),
                                              DropdownMenuItem(
                                                value: "Bàn 2 tầng 2",
                                                child: Text('Bàn 2 tầng 2'),
                                              ),
                                              DropdownMenuItem(
                                                value: "Bàn 3 tầng 3",
                                                child: Text('Bàn 3 tầng 3'),
                                              ),
                                              DropdownMenuItem(
                                                value: "Bàn 4 tầng 4",
                                                child: Text('Bàn 4 tầng 4'),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                selectval1 = value.toString();
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          width: 77,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon:
                                                      const Icon(Icons.people)),
                                              Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    '5',
                                                    style: AppStyles.lato
                                                        .copyWith(fontSize: 16),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 77,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  color: Colors.red,
                                                  onPressed: () {},
                                                  icon:
                                                      const Icon(Icons.house)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 77,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon:
                                                      const Icon(Icons.coffee)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 23),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 30),
                                    width: 700,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      color: AppColors.colorrow,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Tên món",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        Text("Số lượng",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                        Text("Thành tiền",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Trà thạch đào",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("49.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.colorrow,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Black Coffee   ",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("25.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Cappuccino     ",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("65.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.colorrow,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Black Coffee   ",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("25.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Black Coffee   ",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("25.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 75,
                                    decoration: const BoxDecoration(
                                      color: AppColors.colorrow,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Black Coffee   ",
                                            style: AppStyles.lato.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          height: 64,
                                          child: Card(
                                            color: AppColors.Box,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text("25.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 25),
                                    width: 700,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.info_outline)),
                                        Text("Tổng tiền",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                        const SizedBox(
                                          width: 150,
                                        ),
                                        Text("341.000 VND",
                                            style: AppStyles.lato.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 126,
                                            height: 110,
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    iconSize: 70,
                                                    color: Colors.blue,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.local_dining)),
                                                // Container(
                                                //     alignment:
                                                //         Alignment.topCenter,
                                                //     child: Text(
                                                //       'Gửi',
                                                //       style: AppStyles.lato
                                                //           .copyWith(
                                                //               fontSize: 18,
                                                //               color:
                                                //                   Colors.blue),
                                                //     ))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: 121,
                                            height: 110,
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    iconSize: 70,
                                                    color: Colors.red,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.cancel)),
                                                // Container(
                                                //     alignment:
                                                //         Alignment.topCenter,
                                                //     child: Text(
                                                //       'Gửi',
                                                //       style: AppStyles.lato
                                                //           .copyWith(
                                                //               fontSize: 18,
                                                //               color:
                                                //                   Colors.blue),
                                                //     ))
                                              ],
                                            ),
                                          )
                                        ]),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            width: 126,
                                            height: 110,
                                            child: Row(),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: 121,
                                            height: 110,
                                          )
                                        ]),
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
          },
        );
      },
    );
  }
}
