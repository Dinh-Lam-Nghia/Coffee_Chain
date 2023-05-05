import 'package:coffee_chain/module/phaChe_provider/DSmchenien_provider/DSmchenien_provider.dart';
import 'package:coffee_chain/values/app_assets.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DSMCheBienPage extends StatefulWidget {
  const DSMCheBienPage({super.key});

  @override
  State<DSMCheBienPage> createState() => _DSMCheBienPageState();
}

class _DSMCheBienPageState extends State<DSMCheBienPage> {
  DSmonCheBienProvider _dSmonCheBienProvider = DSmonCheBienProvider();

  @override
  void initState() {
    super.initState();
    _dSmonCheBienProvider.getListBanHD();
    _dSmonCheBienProvider.getListMonCheBien();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DSmonCheBienProvider>(
      create: (context) => _dSmonCheBienProvider,
      builder: (context, child) {
        return Consumer<DSmonCheBienProvider>(
          builder: (context, model, child) {
            return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Row(
                                children: [
                                  Material(
                                    color: AppColors.redPink,
                                    child: InkWell(
                                      onTap: () {},
                                      splashColor: AppColors.grey,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.darkRed)),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add_alert_outlined,
                                                size: 40,
                                                color: AppColors.darkRed),
                                            Text(" Báo hết",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  Material(
                                    color: AppColors.green,
                                    child: InkWell(
                                      onTap: () {},
                                      splashColor: AppColors.grey,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 13),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.darkGreen)),
                                        child: Row(
                                          children: [
                                            Image.asset(AppAssetIcon.iconChuong,
                                                width: 40),
                                            Text(" Trả hết",
                                                style: AppStyles.lato.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

                      //
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 550,
                              childAspectRatio: 5 / 5,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30,
                            ),
                            itemCount: model.listBanHD.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              return Material(
                                color: (model.soLanClick == true &&
                                        model.chonBan ==
                                            model.listBanHD[index].maBan)
                                    ? AppColors.darkGrey
                                    : AppColors.grey,
                                child: InkWell(
                                  onTap: () => model.onClickBan(
                                      model.listBanHD[index].maBan.toString()),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            height: 70,
                                            child: Text(
                                              model.listBanHD[index].tenBan
                                                  .toString(),
                                              style: AppStyles.lato.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.black87),
                                            ), //
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            color: AppColors.white,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Order: ",
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .black87),
                                                    ),
                                                    Text(
                                                      model.listBanHD[index]
                                                          .order
                                                          .toString(),
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black87),
                                                    ) //
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Phục vụ: ",
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColors
                                                                  .black87),
                                                    ),
                                                    Text(
                                                      model.listBanHD[index]
                                                          .phucVu
                                                          .toString(),
                                                      style: AppStyles.lato
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black87),
                                                    ) //
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              child: ListView.builder(
                                                itemCount: model
                                                    .getSLuongMonTrenBan(model
                                                        .listBanHD[index].maBan
                                                        .toString()),
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    width: double.infinity,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    child: Stack(children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                                width: 30),
                                                            SizedBox(
                                                              child: Text(
                                                                model
                                                                    .listDSmonCheBienTungBan[
                                                                        index]
                                                                    .tenMon
                                                                    .toString(),
                                                                style: AppStyles.lato.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColors
                                                                        .black87),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              child: Text(
                                                                '(${model.listDSmonCheBienTungBan[index].soLuong.toString()})',
                                                                style: AppStyles.lato.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        AppColors
                                                                            .red),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            hoverColor: null,
                                                            icon: const Icon(
                                                              Icons
                                                                  .notifications,
                                                              size: 30,
                                                              color: AppColors
                                                                  .grey,
                                                            )),
                                                      ),
                                                    ]),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
                      //
                    ],
                  ),
                )),
                bottomNavigationBar: BottomAppBar(
                  height: 100,
                  color: AppColors.brightPink,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 10 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: model.listBanHD.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                              alignment: Alignment.center,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  border: Border.all(
                                      width: 1, color: AppColors.red),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                model.listBanHD[index].tenBan.toString(),
                                style: AppStyles.lato.copyWith(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ));
                        }),
                  ),
                ));
          },
        );
      },
    );
  }
}
