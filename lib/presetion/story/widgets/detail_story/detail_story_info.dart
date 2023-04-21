import 'package:client_app/presetion/story/widgets/widgets/story_card_widget.dart';
import 'package:flutter/material.dart';

class DetailStoryInfo extends StatelessWidget {
  final InfoStory infoStory;
  const DetailStoryInfo({Key? key, required this.infoStory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoryCardWidget(
        child: Column(
      children: [
        _RowData(title: "Tác giả", content: infoStory.author,),
        _RowData(title: "Thể loại", content: infoStory.type.join(", "),),
        _RowData(title: "Chương", content: infoStory.numOfChapter.toString(),),
        _RowData(title: "Trạng thái", content: infoStory.status,),
        _RowData(title: "Lượt đánh giá", content: infoStory.rateCount.toString(),),
        _RowData(title: "Đánh giá", content: infoStory.rate.toString(),),
        _RowData(title: "Đăng", content: infoStory.createAt.toDDMMYYYY),
        _RowData(title: "Cập nhật", content: infoStory.updateAt.toDDMMYYYY,),
      ],
    ));
  }
}

class _RowData extends StatelessWidget {
  final String title;
  final String content;
  const _RowData({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: "),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }
}

extension ToString on DateTime{
  String get toDDMMYYYY =>
    '${stringTime(day)}/${stringTime(month)}/$year';
}

String stringTime(int time)
{
  return time> 10? time.toString(): "0$time";
}
class InfoStory {
  final String author;
  final List<String> type;
  final int? numOfChapter;
  final String status;
  final int? rateCount;
  final int? rate;
  final DateTime createAt;
  final DateTime updateAt;
  final int? numOfPropose;

  InfoStory(
      {required this.author,
      required this.type,
      this.numOfChapter,
      required this.status,
      this.rateCount,
      this.rate,
      required this.createAt,
      required this.updateAt,
      this.numOfPropose});
}
