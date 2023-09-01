import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppSSPagerView extends StatelessWidget {
  final List<String> screenshotUrls;
  const AppSSPagerView(this.screenshotUrls, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: PageView.builder(
        itemBuilder: (context, index) => _pageViewItem(screenshotUrls[index]),
        itemCount: screenshotUrls.length,
      )),
    );
  }

  Widget _pageViewItem(String url) {
    return CachedNetworkImage(
        imageUrl: url, width: double.infinity, height: double.infinity);
  }
}
