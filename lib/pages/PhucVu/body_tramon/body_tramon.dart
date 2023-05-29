import 'package:coffee_chain/module/Phucvu_provider/tramon_Provider/tramon_Provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/phache_widgets.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TramonPageResponsive extends StatelessWidget {
  const TramonPageResponsive({super.key, required this.maNV});
  final String maNV;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ResponsiveContainer(
        small: TramonPage(
          small: true,
          maNV: maNV,
          heightRow: (height / 10) * 6,
        ),
        large: TramonPage(
          small: false,
          maNV: maNV,
          heightRow: (height / 10) * 8.3,
        ));
  }
}

class TramonPage extends StatefulWidget {
  const TramonPage(
      {super.key,
      required this.small,
      required this.maNV,
      required this.heightRow});
  final String maNV;
  final bool small;
  final double heightRow;

  @override
  State<TramonPage> createState() => _TramonPageState();
}

class _TramonPageState extends State<TramonPage> {
  final TraMonProvider _traMonProvider = TraMonProvider();

  @override
  void initState() {
    super.initState();
    _traMonProvider.getAccPQ(widget.maNV);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<TraMonProvider>(
      create: (context) => _traMonProvider,
      builder: (context, child) {
        return Consumer<TraMonProvider>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      (widget.small)
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AccUser(
                                    maNV: widget.maNV,
                                    tenNV: model.tenNV,
                                    PQPV: model.PQPV,
                                    PQTN: model.PQTN,
                                    PQAD: model.PQAD,
                                    PQPC: model.PQPC,
                                    XDTrang: 'phucVu',
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      //
                      SizedBox(
                          width: double.infinity,
                          child: (widget.small)
                              ? Column(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceAround,
                                  children: [
                                    row1(context, model, widget.heightRow),
                                    row2(context, model, widget.heightRow),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    row1(context, model, widget.heightRow),
                                    row2(context, model, widget.heightRow),
                                  ],
                                )),
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

  Widget row1(BuildContext context, TraMonProvider model, double heightRow) {
    return Container(
      padding: EdgeInsets.only(
          bottom: (widget.small) ? 20 : 0,
          left: (widget.small) ? 20 : 0,
          right: (widget.small) ? 20 : 0),
      height: heightRow,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            width: 985,
            height: (widget.small) ? 60 : 80,
            decoration: const BoxDecoration(
              color: AppColors.brightPink,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Bàn order",
                    style: AppStyles.lato.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,                                                    
                        color: AppColors.white1)),
                Text("(Số lượng)",
                    style: AppStyles.lato.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.red)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: SizedBox(
              width: 985,
              child: SingleChildScrollView(
                child: Column(
                                                                                                                                                                         =======
              const SizedBox(
                height: 80,
              ),
              //

              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < model.banHDodel.length; i++)
                      InkWell(
                        onTap: () =>
                            model.clickBan(model.banHDodel[i].maBan.toString()),
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                          ),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          width: 985,
                          height: (widget.small) ? 55 : 70,
                          decoration: BoxDecoration(
                            color: (model.maBan.toString() ==
                                    model.banHDodel[i].maBan.toString())
                                ? AppColors.brightPink
                                : AppColors.colorrow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(model.banHDodel[i].tenBan.toString(),
                                      style: AppStyles.lato.copyWith(
                                        color: (model.maBan.toString() ==
                                                model.banHDodel[i].maBan
                                                    .toString())
                                            ? AppColors.white1
                                            : AppColors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      )),
                                  Text(
                                      "(${model.slMon(model.banHDodel[i].maBan.toString())})",
                                      style: AppStyles.lato.copyWith(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                              IconButton(
                                  iconSize: 50,
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.check_box)),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget row2(BuildContext context, TraMonProvider model, double heightRow) {
    return Container(
      padding: EdgeInsets.only(
          bottom: (widget.small) ? 20 : 0,
          left: (widget.small) ? 20 : 0,
          right: (widget.small) ? 20 : 0),
      height: heightRow,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            width: 770,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white70,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(model.tenBan.toString(),
                    style: AppStyles.lato.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 770,
              color: AppColors.white,
              child: SingleChildScrollView(
                child: Column(children: [
                  for (int i = 0; i < model.MonCB.length; i++)
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 25),
                      width: 770,
                      height: (widget.small) ? 55 : 70,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.black87))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(model.MonCB[i].tenMon.toString(),
                                  style: AppStyles.lato.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  )),
                              Text(" (${model.MonCB[i].slMon.toString()})",
                                  style: AppStyles.lato.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: AppColors.red)),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            color: AppColors.grey1,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              onChanged: (value) => model.chonMonTra(
                                  value.toString(),
                                  model.MonCB[i].maMon.toString()),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: '0', border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
                ]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, left: 25),
            width: 770,
            height: (widget.small) ? 100 : 150,
            decoration: const BoxDecoration(color: Colors.white70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => model.tramon(widget.maNV),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: (widget.small) ? 100 : 180,
                    height: (widget.small) ? 100 : 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.Sepia),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 50,
                          color: Colors.green,
                        ),
                        (!widget.small)
                            ? Text(
                                'Trả món',
                                style: AppStyles.lato
                                    .copyWith(color: AppColors.green),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
