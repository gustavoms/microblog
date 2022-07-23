import 'package:flutter/material.dart';
import 'package:microblog/core/utils/custom_date_utils.dart';
import 'package:microblog/features/news/data/news_entity.dart';

class NewsItem extends StatelessWidget {
  final NewsEntity item;

  const NewsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.user?.profilePicture ?? ''),
      ),
      title: Text(item.user?.name ?? ''),
      subtitle: Column(
        children: [
          Text(item.message?.content ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                MicroblogDateUtils.format(
                  date: item.message?.createdAt ?? DateTime.now(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
