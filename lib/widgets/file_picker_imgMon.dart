// import 'dart:convert';
// import 'dart:io';

// import 'package:coffee_chain/module/admin_provider/thucDonPage_provider.dart';
// import 'package:coffee_chain/values/app_colors.dart';
// import 'package:coffee_chain/values/app_styles.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'dart:typed_data';

// class ImagerMon extends StatefulWidget {
//   const ImagerMon({super.key, required this.model, required this.width});
//   final ThucDonPageProvider model;
//   final double width;

//   @override
//   State<ImagerMon> createState() => _ImagerMonState();
// }

// class _ImagerMonState extends State<ImagerMon> {
// //

//   // void decode() {}
// //

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: ((((widget.width / 100) * 85) - 45) / 5) * 1.65,
//       child: Column(
//         children: [
//           Text(
//             'Ảnh đại diện',
//             style: AppStyles.lato.copyWith(
//               fontSize: 25,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Container(
//               padding: const EdgeInsets.all(20),
//               width: ((((widget.width / 100) * 85) - 45) / 5),
//               // height: ((((widget.width / 100) * 85) - 45) / 5),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: AppColors.black87)),
//               child: widget.model.pickedImage == null
//                   ? Center(
//                       child: Container(
//                       height: 200,
//                       width: 200,
//                       child: Icon(
//                         Icons.image_outlined,
//                         size: 100,
//                       ),
//                     ))
//                   :
//                   // kIsWeb
//                   // ?
//                   Image.memory(
//                       widget.model.bytesImage,
//                       fit: BoxFit.fill,
//                     )
//               // : Image.file(pickedImage!, fit: BoxFit.fill),
//               ),
//           Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Material(
//                   child: InkWell(
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 1, color: AppColors.black87)),
//                       padding: const EdgeInsets.all(10),
//                       child: const Icon(
//                         Icons.clear,
//                         size: 30,
//                         color: AppColors.red,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Material(
//                   color: AppColors.white,
//                   child: InkWell(
//                     onTap: (() {
//                       widget.model.pickedImages();
//                     }),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 1, color: AppColors.black87)),
//                       padding: const EdgeInsets.all(10),
//                       child: const Icon(
//                         Icons.upload,
//                         size: 30,
//                         color: AppColors.blue,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
