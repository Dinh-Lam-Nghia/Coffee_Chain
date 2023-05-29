import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service/url.dart';

class ImageAll extends StatelessWidget {
  final String imageUrl; 

  const ImageAll({super.key, required this.imageUrl });

  Future<http.Response> getUrlResponse() {
    return http.post(Uri.parse('${Url.image}$imageUrl'));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUrlResponse(),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            child: Image.memory(
              snapshot.data!.bodyBytes,
              fit: BoxFit.fill,
            ),
            // CircleAvatar(
            //   radius: 12,
            //   backgroundColor: Colors.grey.shade200,
            //   backgroundImage: MemoryImage(
            //     snapshot.data!.bodyBytes,
            //   ),
            // ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
