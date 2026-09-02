
import 'package:flutter/material.dart';

class Viewallpage3 extends StatefulWidget {
  const Viewallpage3({super.key});

  @override
  State<Viewallpage3> createState() => _Viewallpage3State();
}

class _Viewallpage3State extends State<Viewallpage3> {
  final List<String> images = [
    'assets/disney.jpg',
    'assets/disney.jpg',
    'assets/disney.jpg',
    'assets/disney.jpg',
    'assets/disney.jpg',
  ];

  final Set<String> favoriteItems = {};

  int? selectedEpisode;

  void toggleFavorite(String id) {
    setState(() {
      if (favoriteItems.contains(id)) {
        favoriteItems.remove(id);
      } else {
        favoriteItems.add(id);
      }
    });
  }

  void showEpisodes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff1B1B20),
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Disney Princess',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Select Episode',
                style: TextStyle(
                  color: Color(0xffED2C67),
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 15),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final int episodeNumber = index + 1;
                    final bool isSelected =
                        selectedEpisode == episodeNumber;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedEpisode = episodeNumber;
                        });

                        Navigator.pop(context);

                        debugPrint(
                          'Episode $episodeNumber selected',
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xffED2C67)
                              : const Color(0xff25252B),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xffED2C67),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$episodeNumber',
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xffED2C67)
                                      : Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Episode $episodeNumber',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.play_arrow,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xffED2C67),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget disneyCard(String favoriteId) {
    return Container(
      width: 120,
      height: 125,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: const Color(0xff1B1B20),
        borderRadius: BorderRadius.circular(7),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: Image.asset(
              "assets/disney.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 17,
            child: Padding(
              padding: EdgeInsets.only(
                left: 5,
                top: 2,
              ),
              child: Text(
                'Disney Princess',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 11,
            child: Padding(
              padding: EdgeInsets.only(
                left: 5,
              ),
              child: Text(
                '10 Episodes',
                style: TextStyle(
                  color: Color(0xffED2C67),
                  fontSize: 7,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 27,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      '★ ★ ★ ★',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 5,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          showEpisodes(context);
                        },
                        child: const SizedBox(
                          width: 22,
                          height: 13,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          toggleFavorite(favoriteId);
                        },
                        child: SizedBox(
                          width: 22,
                          height: 13,
                          child: Icon(
                            favoriteItems.contains(favoriteId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: const Color(0xffED2C67),
                            size: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String prefix) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return disneyCard('$prefix$index');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Recommeded',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        iconTheme:  IconThemeData(
          color: Color(0xffED2C67),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 325,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 27,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      40,
                      40,
                      40,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Color(0xff646464),
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "search here!",
                          style: TextStyle(
                            color: Color(0xffbfbfbf),
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            buildRow('forYou'),
            const SizedBox(height: 22),
            buildRow('secondRow'),
            const SizedBox(height: 22),
            buildRow('thirdRow'),
            const SizedBox(height: 22),
            buildRow('fourthRow'),
            const SizedBox(height: 22),
            buildRow('topSearch'),
            const SizedBox(height: 22),
            buildRow('recommended'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
