import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class ProviderData with ChangeNotifier {
  bool palyaArea = false;
  int _selectedIndex = 0;
  int correntIndex = 0;
  int get selectedIndex => _selectedIndex;
  int get you => _selectedIndex;
  String correntbindex = '';

  TabController? tabController;
  YoutubePlayerController? youtubePlayerController;
  PdfController? pdfController;

//set pdf
  setPdf(url) async {
    pdfController =
        PdfController(document: PdfDocument.openData(InternetFile.get(url)));

    notifyListeners();
  }

//set video
  setVideo(videourl) {
    videourl = YoutubePlayer.convertUrlToId(videourl);

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videourl!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    notifyListeners();
  }

//initialize Tabs
  initializeTabController(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync);
  }

  @override
  void dispose() {
    tabController?.dispose();

    super.dispose();
  }

  void setTabIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
