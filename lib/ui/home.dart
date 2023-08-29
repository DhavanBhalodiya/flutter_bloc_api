import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_event.dart';
import 'package:flutter_bloc_api/bloc/home/home_state.dart';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:flutter_bloc_api/data/model/response/apps_list_response.dart';
import 'package:flutter_bloc_api/ui/home_details.dart';
import 'package:flutter_bloc_api/utils/colors.dart';
import '../theme/theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.borderColor,
      appBar: AppBar(title: Text("App Listing", style: headerTextStyle)),
      body: SafeArea(
          child: BlocBuilder(
        builder: (BuildContext context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccessState) {
            return _homeListing(state.results);
          } else if (state is HomeErrorState) {
            switch (state.responseEnum) {
              case ApiResponseEnum.noInternetConnection:
                return Text(state.errorMessage ?? "");
                case ApiResponseEnum.apiServerError:
                return const Text("Server Error");
              default:
                return const Text("Error");
            }
          } else {
            return const SizedBox();
          }
        },
        bloc: context.watch<HomeBloc>(),
      )),
    );
  }

  Widget _homeListing(List<Results>? results) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailsPage(
                            results?[index].id, results?[index].name)));
              },
              child: _listItem(results?[index], index));
        },
        itemCount: results?.length ?? 0);
  }

  Widget _listItem(Results? results, int index) {
    return Card(
      color: Colors.white,
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
                      style:
                          textStyle.copyWith(color: Colors.grey, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Category",
                        style: textStyle.copyWith(
                            color: Colors.blue, fontSize: 12))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
