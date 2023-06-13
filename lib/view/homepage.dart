import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/view/pdf_view.dart';
import 'package:video_player_app/model/pdf_model.dart';
import 'package:video_player_app/controller/provider.dart';
import 'package:video_player_app/model/video_model.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

int buttonIndex = 0;
int pdfindex = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void dispose() {
    Provider.of<ProviderData>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProviderData>(context, listen: false)
        .initializeTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ProviderData>(builder: (context, getdata, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getdata.youtubePlayerController != null
                  ? SizedBox(
                      child: Column(
                      children: [
                        YoutubePlayer(
                          controller: getdata.youtubePlayerController!,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                            RemainingDuration(),
                            const PlaybackSpeedButton(),
                          ],
                          topActions: [FullScreenButton()],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          Videos[buttonIndex].name,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ))
                  : const SizedBox(),
              SizedBox(
                height: 50,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: const Color.fromARGB(255, 246, 116, 61),
                  labelColor: const Color.fromARGB(255, 246, 116, 61),
                  unselectedLabelColor: Colors.grey,
                  controller: getdata.tabController,
                  tabs: const [
                    Tab(text: "Up next"),
                    Tab(text: "Study Materials"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: getdata.tabController,
                  children: [
                    // Tab 1 content
                    ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyHomePage(),
                                  ),
                                  (route) => false);
                              // getdata.setAria();

                              getdata.setVideo(Videos[index].url);
                              buttonIndex = index;
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: SizedBox(
                                    height: 80,
                                    width: 100,
                                    child: Image.network(
                                      Videos[index].thumbnail,
                                      scale: 6,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    Videos[index].name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.grey,
                          );
                        },
                        itemCount: Videos.length),
                    // Tab 2 content
                    ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            child: InkWell(
                              onTap: () {
                                pdfindex = index;
                                getdata.setPdf(pdf[index].url);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PdfviewPage(index: index),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 245, 217, 205),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 200,
                                height: size.height * 8 / 50,
                                child: Stack(children: [
                                  Positioned(
                                      left: 10,
                                      top: 15,
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 240, 157, 134),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                            'assets/images/slider-icon.png',
                                            scale: 14,
                                          ))),
                                  Positioned(
                                      left: 100,
                                      top: 18,
                                      child: SizedBox(
                                        width: 160,
                                        height: 70,
                                        child: Text(
                                          pdf[index].title,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  const Positioned(
                                      bottom: 10,
                                      left: 100,
                                      child: Text('PDF')),
                                  const Positioned(
                                      left: 230,
                                      bottom: 0,
                                      child: SizedBox(
                                          width: 160,
                                          height: 50,
                                          child: Icon(
                                            Icons.download,
                                            color:
                                                Color.fromARGB(255, 84, 82, 82),
                                            size: 23,
                                          )))
                                ]),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 0,
                          );
                        },
                        itemCount: pdf.length)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
