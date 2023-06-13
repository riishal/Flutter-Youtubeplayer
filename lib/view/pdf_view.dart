import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/view/homepage.dart';
import 'package:video_player_app/controller/provider.dart';

import '../model/pdf_model.dart';

class PdfviewPage extends StatelessWidget {
  const PdfviewPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(builder: (context, getdata, child) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(pdf[pdfindex].title),
            backgroundColor: const Color.fromARGB(255, 240, 157, 134),
            actions: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  'pages:${pdf[pdfindex].num}',
                  style: const TextStyle(color: Colors.black),
                ),
              ))
            ],
          ),
          body: Stack(
            children: [
              getdata.pdfController != null
                  ? PdfView(controller: getdata.pdfController!)
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
            ],
          ));
    });
  }
}
