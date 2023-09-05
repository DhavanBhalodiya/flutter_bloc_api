import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_bloc.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_event.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_state.dart';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:flutter_bloc_api/ui/screens/homeDetails/screenshot_listing_widget.dart';
import 'package:flutter_bloc_api/ui/widgets/no_internet_widget.dart';
import 'package:flutter_bloc_api/utils/extentions.dart';
import 'package:flutter_bloc_api/utils/utils.dart';
import '../../../../data/model/response/app_details_response.dart';
import '../../../theme/theme.dart';
import '../../../utils/colors.dart';

class HomeDetailsPage extends StatefulWidget {
  final String? title;
  final String? id;

  const HomeDetailsPage(this.id, this.title, {super.key});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  final _scrollerControler = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeDetailBloc>().add(HomeDetailInitialEvent(widget.id));
  }

  @override
  void dispose() {
    _scrollerControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(widget.title ?? "", style: headerTextStyle),
          backgroundColor: AppColor.bgColor),
      body: SafeArea(
        child: BlocConsumer(
            bloc: context.read<HomeDetailBloc>(),
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeDetaiLoadingState:
                  return const Center(child: CircularProgressIndicator());

                case HomeDetaiSuccessState:
                  final successState = state as HomeDetaiSuccessState;
                  if (successState.appDetailsResponse?.results != null &&
                      successState.appDetailsResponse!.results!.isNotEmpty) {
                    return _apppDetailsBody(
                        successState.appDetailsResponse!.results![0]);
                  } else {
                    return const Center(child: Text("No data"));
                  }
                case HomeDetaiErrorState:
                  final errorState = state as HomeDetaiErrorState;
                  if (errorState.apiResponseEnum ==
                      ApiResponseEnum.noInternetConnection) {
                    return noInternetWidget(
                      () {
                        context
                            .read<HomeDetailBloc>()
                            .add(HomeDetailInitialEvent(widget.id));
                      },
                    );
                  }
                  return const SizedBox();

                default:
                  return const SizedBox();
              }
            },
            listener: (BuildContext context, HomeDetailsState? state) {
              if (state is HomeDetaiErrorState) {
                if (state.apiResponseEnum == ApiResponseEnum.apiServerError) {
                  Utils.showSnackBar(message: state.errorMessage);
                }
              }
            }),
      ),
    );
  }

  Widget _apppDetailsBody(AppDetailsResults results) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.isMobile) {
            return _mobileBody(results);
          } else if (constraints.isDesktop) {
            return _deskTopBody(results);
          } else {
            return _deskTopBody(results);
          }
        },
      ),
    );
  }

  Widget _mobileBody(AppDetailsResults results) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topView(results),
          const SizedBox(height: 20),
          screenShotListing(
              results.screenshotUrls, context, _scrollerControler),
          const SizedBox(height: 20),
          Text("Description",
              style: textStyle.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(results.description ?? "",
              style: textStyle.copyWith(fontSize: 14))
        ],
      ),
    );
  }

  Widget _deskTopBody(AppDetailsResults results) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topView(results),
          const SizedBox(height: 20),
          screenShotListingWeb(
              results.screenshotUrls, context, _scrollerControler),
          const SizedBox(height: 20),
          Text("Description",
              style: textStyle.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(results.description ?? "",
              style: textStyle.copyWith(fontSize: 14))
        ],
      ),
    );
  }

  Widget _topView(AppDetailsResults results) {
    return Row(
      children: [
        CachedNetworkImage(
          width: 100,
          height: 100,
          imageUrl: results.artworkUrl100 ?? "",
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        ),
        Expanded(
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  results.sellerName ?? "",
                  style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(24)),
                    child:
                        const Icon(Icons.star, color: Colors.white, size: 18),
                  ),
                  Text('${results.averageUserRating}',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(width: 10),
                  Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(24)),
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 18)),
                  Text('${results.trackContentRating}',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ]),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: (results.price ?? 0) > 0.0
                            ? Colors.red
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                        (results.price ?? 0) > 0.0
                            ? "Buy ${results.formattedPrice}"
                            : "Download",
                        style: buttonTextStyle.copyWith(fontSize: 14)))
              ],
            ),
          ),
        )
      ],
    );
  }
}
