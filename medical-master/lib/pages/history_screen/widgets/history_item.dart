import 'package:flutter/material.dart';
import 'package:medical_app/pages/history_screen/data/history_model.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key,required this.historyItemModel});
final HistoryItemModel historyItemModel;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin:EdgeInsets.only(top: 10) ,
      height: 140,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: -4,
              blurRadius: 4,
              offset: Offset(0, 12),
            )
          ],
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
image: DecorationImage(image: AssetImage(historyItemModel.image,),fit: BoxFit.cover),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              historyItemModel.name,
              style: theme.textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
