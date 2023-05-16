// // ignore_for_file: non_constant_identifier_names

// import 'package:coffee_chain/module/thuNgan_provider/thanhtoan_Provider/thanhToan_provider.dart';
// import 'package:coffee_chain/module/thuNgan_provider/thungan_Provider.dart';
// import 'package:coffee_chain/pages/thungan/body_thanhtoan/body_mangve.dart';
// import 'package:coffee_chain/pages/thungan/body_thanhtoan/body_thanhtoan.dart';

// import 'package:coffee_chain/values/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:provider/provider.dart';

// class ThanhtoanPage extends StatefulWidget {
//   const ThanhtoanPage({super.key});

//   @override
//   State<ThanhtoanPage> createState() => _ThanhtoanPageState();
// }

// class _ThanhtoanPageState extends State<ThanhtoanPage> {
//   final ThunganProvider _ThanhtoanProvider = ThunganProvider();
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThunganProvider>(
//       create: (context) => _ThanhtoanProvider,
//       builder: (context, child) {
//         return Consumer<ThunganProvider>(
//           builder: (context, model, child) {
//             return Scaffold(
//               backgroundColor: AppColors.backgroundColor,
//               body: (model.chonBody == menuTN.thanhtoan)
//                   ? const ThanhToanPageReponsive()
//                   : const MangVePageReponsive(),
//             );
//           },
//         );
//       },
//     );
//   }
// }
