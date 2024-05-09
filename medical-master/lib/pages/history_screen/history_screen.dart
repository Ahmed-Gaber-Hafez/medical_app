 import 'package:flutter/material.dart';
import 'package:medical_app/pages/history_screen/data/history_model.dart';

import 'widgets/history_item.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  static String routeName = "history";
  bool isSearching = false;
  bool focus = true;
  TextEditingController searchController = TextEditingController();
  List<HistoryItemModel> allHistoryItem = [
    HistoryItemModel(
      image: "assets/testimage/bfda3de02c3c6bc774921749b589e5df.jpg",
      name: "mahmoud",
    ),
    HistoryItemModel(
      image: "assets/testimage/wallpaperflare.com_wallpaper.jpg",
      name: "Mooon",
    ),
    HistoryItemModel(
      image: "assets/testimage/wallpaperflare.com_wallpaper (1).jpg",
      name: "Adel",
    )
  ];

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<HistoryItemModel> searchedForHistory;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 50,
                  color: Colors.black,
                )),
            Text(
              "History",
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: widget.searchController,
              style: const TextStyle(color: Colors.black, fontSize: 15),
              onTap: () {
                widget.focus = true;
                setState(() {});
              },
              canRequestFocus: widget.focus,
              onChanged: (value) {
                addSearchedItemList(value);
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0.5),
                  fillColor: Colors.white,
                  hintText: "Search",
                  suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      )),
                  prefix: IconButton(
                      onPressed: () {
                        stopSearching();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                        size: 30,
                      )),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(25)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(25))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.searchController.text.isEmpty
                    ? widget.allHistoryItem.length
                    : searchedForHistory.length,
                itemBuilder: (context, index) {
                  return HistoryItem(
                      historyItemModel: widget.searchController.text.isEmpty
                          ? widget.allHistoryItem[index]
                          : searchedForHistory[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      widget.isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      widget.isSearching = false;
      widget.focus = false;
    });
  }

  void clearSearch() {
    setState(() {
      widget.searchController.clear();
    });
  }

  void addSearchedItemList(String value) {
    searchedForHistory = widget.allHistoryItem
        .where((e) => e.name.toLowerCase().startsWith(value))
        .toList();
    setState(() {});
  }
}
