import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/data/model/response/apps_list_response.dart';
import '../../../theme/theme.dart';
import '../../../utils/colors.dart';

//design for mobile list item
Widget listItem(Results? results, int index) {
  return Card(
    color: AppColor.cardColor,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
      child: Row(
        children: [
          SizedBox(
            height: 72,
            width: 66,
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 6,
                  child: CachedNetworkImage(
                      width: 60,
                      height: 60,
                      imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                      imageUrl: results?.artworkUrl100 ?? ""),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Text(
                    "${index + 1}",
                    style: textStyle.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              height: 72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    results?.name ?? "",
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    results?.artistName ?? "",
                    style: textStyle.copyWith(color: Colors.grey, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("Category",
                      style:
                          textStyle.copyWith(color: Colors.blue, fontSize: 12))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//design for destop list item
Widget destoplistItem(Results? results, int index) {
  return Card(
    color: AppColor.cardColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                  ),
              imageUrl: results?.artworkUrl100
                      ?.replaceAll("100x100bb.png", "400x400bb.png") ??
                  ""),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                results?.name ?? "",
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                results?.artistName ?? "",
                style: textStyle.copyWith(color: Colors.grey, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
