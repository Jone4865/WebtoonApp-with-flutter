import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon_prac/modules/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onPressButton() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressButton,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade400),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(10, 10),
                color: Colors.black.withOpacity(0.5),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.green.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
