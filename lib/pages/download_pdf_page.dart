/*
 * @author kevin
 * @date 2020/6/23 1:52 PM
 * @Description: flutter
*/

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPdfPage extends StatefulWidget {
  @override
  _DownloadPdfPageState createState() => _DownloadPdfPageState();
}

class _DownloadPdfPageState extends State<DownloadPdfPage> {
  PDFDocument document;
  bool _isLoading = true;

  @override
  initState() {
    super.initState();
  }

  loadDocument(path) async {
//    document = await PDFDocument.fromAsset('assets/sample.pdf');
    document = await PDFDocument.fromFile(File(path));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('download pdf'),
        actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              var tempDir = await getTemporaryDirectory();
              String fullPath = tempDir.path + "/boo2.pdf";
              debugPrint('29---download_pdf_page-----$fullPath');
              Dio dio = Dio();
              await dio.download(
                  'https://bigshot.oss-cn-shanghai.aliyuncs.com/%E5%B8%83%E5%B0%94%E6%95%99%E8%82%B2_Javascript%E5%9F%BA%E7%A1%80.pdf',
                  fullPath, onReceiveProgress: (rec, total) {
                debugPrint('35---download_pdf_page-----$rec');
                debugPrint('35---download_pdf_page-----$total');
              });
              loadDocument(fullPath);
            },
            child: Text('download'),
          ),
        ],
      ),
      body: Container(
          child: _isLoading
              ? CircularProgressIndicator()
              : PDFViewer(
                  showIndicator: false,
                  showNavigation: false,
                  showPicker: false,
                  document: document)),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
