import 'package:coffee_chain/module/Phucvu_provider/order_Provider/order_provider.dart';
import 'package:coffee_chain/values/app_colors.dart';
import 'package:coffee_chain/values/app_styles.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YeuCauTTResponsive extends StatelessWidget {
  const YeuCauTTResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveContainer(
      small: YeuCauTTPage(sizeText: width * 0.3 / 9),
      large: YeuCauTTPage(sizeText: width * 0.2 / 14),
    );
  }
}

class YeuCauTTPage extends StatefulWidget {
  const YeuCauTTPage({super.key, required this.sizeText});
  final double sizeText;

  @override
  State<YeuCauTTPage> createState() => _YeuCauTTPageState();
}

class _YeuCauTTPageState extends State<YeuCauTTPage> {
  OrderProvider _orderProvider = OrderProvider();
  @override
  void initState() {
    super.initState();
    _orderProvider.getListBanHD();
    _orderProvider.getSL();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>(
      create: (context) => _orderProvider,
      builder: (context, child) {
        return Consumer<OrderProvider>(
          builder: (context, model, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 11 / 6,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: model.listYCTT.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: AppColors.Sepia,
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${model.listYCTT[index].order.toString()} - ${model.listYCTT[index].tenBan.toString()}',
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
                                            model.listYCTT[index].soLuongNGuoi
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
                                '${model.listYCTT[index].tongTien.toString()}.000 VND',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            );
          },
        );
      },
    );
  }
}
