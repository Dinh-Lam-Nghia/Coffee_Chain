import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart'; 
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart'; 

class BodyChoTTResponsive extends StatelessWidget {
  const BodyChoTTResponsive(
      {super.key, required this.model, required this.maNV});
  final ThanhToanProvider model;
  final String maNV;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
      small: BodyChoTTPage(sizeText: width * 0.3 / 9, model: model, maNV: maNV),
      large:
          BodyChoTTPage(sizeText: width * 0.2 / 14, model: model, maNV: maNV),
    );
  }
}

class BodyChoTTPage extends StatefulWidget {
  const BodyChoTTPage(
      {super.key,
      required this.sizeText,
      required this.model,
      required this.maNV});
  final double sizeText;
  final ThanhToanProvider model;
  final String maNV;

  @override
  State<BodyChoTTPage> createState() => _BodyChoTTPageState();
}

class _BodyChoTTPageState extends State<BodyChoTTPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 11 / 6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemCount: widget.model.listCTT.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.Sepia,
                        height: 50,
                        width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.model.listCTT[index].order.toString()} - ${widget.model.listCTT[index].tenBan.toString()}',
                                style: AppStyles.lato.copyWith(
                                  color: AppColors.white,
                                  fontSize: widget.sizeText,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.people_alt,
                                    size: 30,
                                    color: AppColors.white,
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      widget.model.listCTT[index].slKhach
                                          .toString(),
                                      style: AppStyles.lato.copyWith(
                                        color: AppColors.white,
                                        fontSize: widget.sizeText,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ])),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      color: AppColors.brightPink,
                      width: double.infinity,
                      // height: 145,
                      child: Text(
                        '${widget.model.listBanHD[index].tongTien.toString()} VND',
                        style: AppStyles.lato.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: widget.sizeText,
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.notifications),
                            onPressed: () {},
                          ),
                          IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.event_note),
                            onPressed: () {},
                          ),
                          IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.calculate),
                            onPressed: () => widget.model.thanhToan(
                                widget.model.listBanHD[index].maBan.toString()),
                          ),
                          IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
