import 'package:coffee_chain/module/Phucvu_provider/order_Provider/order_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyDangPVResponsive extends StatelessWidget {
  const BodyDangPVResponsive(
      {super.key, required this.maNV, required this.model});
  final String maNV;
  final OrderProvider model;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
      small: BodyDangPVPage(
          small: true, sizeText: width * 0.3 / 9, maNV: maNV, model: model),
      large: BodyDangPVPage(
          small: false, sizeText: width * 0.2 / 14, maNV: maNV, model: model),
    );
  }
}

class BodyDangPVPage extends StatefulWidget {
  const BodyDangPVPage({
    super.key,
    required this.sizeText,
    required this.maNV,
    required this.model,
    required this.small,
  });
  final String maNV;
  final OrderProvider model;
  final double sizeText;
  final bool small;

  @override
  State<BodyDangPVPage> createState() => _BodyDangPVPageState();
}

class _BodyDangPVPageState extends State<BodyDangPVPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.small)
            ? Container(
                color: AppColors.white,
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                child: TextFormField(
                  style: const TextStyle(color: AppColors.black87),
                  onChanged: (value) => widget.model.timKiem(value, 1),
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm',
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              )
            : Container(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 11 / 6,
                crossAxisSpacing: (!widget.small) ? 10 : 0,
                mainAxisSpacing: (!widget.small) ? 10 : 0,
              ),
              itemCount: widget.model.listDPV.length,
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
                                  '${widget.model.listDPV[index].order.toString()} - ${widget.model.listDPV[index].tenBan.toString()}',
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
                                        widget.model.listBanHD[index].slKhach
                                            .toString(),
                                        style: AppStyles.lato.copyWith(
                                          color: AppColors.white,
                                          fontSize: widget.sizeText,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          color: AppColors.brightPink,
                          width: double.infinity,
                          // height: 145,
                          child: Text(
                            '${double.parse(widget.model.listDPV[index].tongTien.toString()).toStringAsFixed(3)} VND',
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
                                icon: Icon(Icons.notifications,
                                    color: (int.parse(widget.model
                                                .listDPV[index].hoanThanhMon
                                                .toString()) ==
                                            1)
                                        ? AppColors.red
                                        : AppColors.black87),
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
                                onPressed: () => widget.model.ycthanhToan(
                                    widget.maNV,
                                    widget.model.listDPV[index].maBan
                                        .toString()),
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
                    ));
              }),
        ),
      ],
    );
  }
}
