import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/ui/screens/screenshot_view.dart';



//listing for mobile
  Widget screenShotListing(List<String>? screenshotUrls, BuildContext context,ScrollController scrollerControler) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.8,
      child: Scrollbar(
        controller: scrollerControler,
        thickness: 8,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppSSPagerView(screenshotUrls))),
                child: _screenShorItem(
                    url: screenshotUrls![index], context: context));
          },
          itemCount: screenshotUrls?.length ?? 0,
          shrinkWrap: true,
          controller: scrollerControler,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
        ),
      ),
    );
  }

//listing for desktop
Widget screenShotListingWeb(
    List<String>? screenshotUrls, BuildContext context,ScrollController scrollerControler) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 350,
    child: Scrollbar(
      thickness: 8,
      controller: scrollerControler,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppSSPagerView(screenshotUrls))),
              child: _screenShorItem(
                  url: screenshotUrls![index], context: context, isWeb: true));
        },
        itemCount: screenshotUrls?.length ?? 0,
        shrinkWrap: true,
        controller: scrollerControler,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    ),
  );
}


//list item 
Widget _screenShorItem(
    {String? url, BuildContext? context, bool isWeb = false}) {
  return CachedNetworkImage(
    //placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    imageUrl: url ?? "",
    fit: BoxFit.cover,
    width: isWeb ? 200 : MediaQuery.of(context!).size.width / 2,
  );
}
