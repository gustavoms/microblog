import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/feed/data/feed_entity.dart';

class FeedItem extends StatelessWidget {
  final FeedEntity item;
  final int currentUserId;
  final Function()? onTap;

  const FeedItem({
    Key? key,
    required this.item,
    required this.currentUserId,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kDefMargin),
      onTap: currentUserId == item.userId ? onTap : null,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(kDefPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(item.photo),
                      ),
                      const SizedBox(
                        width: kDefMargin,
                      ),
                      Text(
                        item.user,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: currentUserId == item.userId,
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kDefMargin,
              ),
              Text(
                item.message,
              ),
              const SizedBox(
                height: kDefMargin,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd MMM. HH:mm').format(item.date),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
