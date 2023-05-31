import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/global.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            toolbarHeight: 80,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(25)),
                color: (Global.isDark == true)
                    ? const Color(0xff35313f)
                    : const Color(0xffe9e2f1),
              ),
              child: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: Align(
                  alignment: const Alignment(-0.89, -0.4),
                  child: Text(
                    "Thoughts",
                    style: GoogleFonts.arya(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color:
                          Global.isDark == true ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Thoughts List",
                          style: GoogleFonts.arya(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Global.isDark == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: (Global.thoughtList.isNotEmpty)
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Global.thoughtList.length,
                    itemBuilder: (context, i) => Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 3,
                      child: ListTile(
                        isThreeLine: true,
                        leading: Text(
                          "${i + 1}.",
                          style: GoogleFonts.play(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        title: Text(
                          Global.thoughtList[i],
                          style: GoogleFonts.play(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          Global.timeList[i].toString().split('.')[0],
                          style: GoogleFonts.play(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 250),
                        Text(
                          "Your though list is empty...",
                          style: GoogleFonts.arya(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
