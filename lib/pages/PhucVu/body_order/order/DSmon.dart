import 'package:coffee_chain/module/Phucvu_provider/order_Provider/ghiOrder_Provider.dart';
import 'package:coffee_chain/widgets/responsive/tesponsive_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DsMonReponsive extends StatelessWidget {
  const DsMonReponsive({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return DSmon();
  }
}

class DSmon extends StatefulWidget {
  const DSmon({super.key});

  @override
  State<DSmon> createState() => _DSmonState();
}

class _DSmonState extends State<DSmon> {
  GhiorderProvider _GhiorderProvider = GhiorderProvider();

  @override
  void initState() {
    super.initState();
    _GhiorderProvider.getListDSmon();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GhiorderProvider>(
      create: (context) => _GhiorderProvider,
      builder: (context, child) {
        return Consumer<GhiorderProvider>(
          builder: (context, model, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              child:
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 11 / 6,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: model.ListDSmon.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      child: Column(
                        children: [
                          Image.asset(model.ListDSmon[index].image.toString())
                        ],
                      ),
                    );
                  }),
            );
          },
        );
      },
    );
  }
}
