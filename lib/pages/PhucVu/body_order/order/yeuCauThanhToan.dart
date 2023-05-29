import 'package:coffee_chain/module/Phucvu_provider/order_Provider/order_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YeuCauTTResponsive extends StatelessWidget {
  const YeuCauTTResponsive(
      {super.key, required this.maNV, required this.model});
  final String maNV;
  final OrderProvider model;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
      small: YeuCauTTPage(
          small: true, sizeText: width * 0.3 / 9, maNV: maNV, model: model),
      large: YeuCauTTPage(
          small: false, sizeText: width * 0.2 / 14, maNV: maNV, model: model),
    );
  }
}

class YeuCauTTPage extends StatefulWidget {
  const YeuCauTTPage(
      {super.key,
      required this.sizeText,
      required this.maNV,
      required this.model,
      required this.small});
  final String maNV;
  final OrderProvider model;
  final double sizeText;
  final bool small;

  @override
  State<YeuCauTTPage> createState() => _YeuCauTTPageState();
}

class _YeuCauTTPageState extends State<YeuCauTTPage> {
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
                  onChanged: (value) => widget.model.timKiem(value, 2),
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm',
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              )
            : Container(),
        Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 11 / 6,
                crossAxisSpacing: (!widget.small) ? 10 : 0,
                mainAxisSpacing: (!widget.small) ? 10 : 0,
              ),
              itemCount: widget.model.listYCTT.length,
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
                          color: AppColors.darkOrange,
                          height: 50,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${widget.model.listYCTT[index].order.toString()} - ${widget.model.listYCTT[index].tenBan.toString()}',
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
                                        widget.model.listYCTT[index].slKhach
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
                          color: AppColors.lightOrange,
                          width: double.infinity,
                          // height: 145,
                          child: Text(
                            '${double.parse(widget.model.listYCTT[index].tongTien.toString()).toStringAsFixed(3)}.000 VND',
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
                                icon: const Icon(Icons.calculate,
                                    color: AppColors.red),
                                onPressed: () {},
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
