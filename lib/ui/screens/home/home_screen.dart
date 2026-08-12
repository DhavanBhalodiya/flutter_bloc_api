import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_event.dart';
import 'package:flutter_bloc_api/bloc/home/home_state.dart';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:flutter_bloc_api/data/model/response/apps_list_response.dart';
import 'package:flutter_bloc_api/ui/screens/home/home_list_item_widget.dart';
import 'package:flutter_bloc_api/ui/screens/homeDetails/home_details_screen.dart';
import 'package:flutter_bloc_api/ui/widgets/no_internet_widget.dart';
import 'package:flutter_bloc_api/utils/colors.dart';
import 'package:flutter_bloc_api/utils/constant.dart';
import 'package:flutter_bloc_api/utils/extentions.dart';
import '../../../theme/theme.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            backgroundColor: AppColor.bgColor,
            appBar: AppBar(
              title: Text("App Listing", style: headerTextStyle),
              backgroundColor: AppColor.bgColor,
            ),
            body: SafeArea(
                child: BlocBuilder(
              builder: (BuildContext context, state) {
                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeSuccessState) {
                  return _homeBody(state.results);
                } else if (state is HomeErrorState) {
                  switch (state.responseEnum) {
                    case ApiResponseEnum.noInternetConnection:
                      return noInternetWidget(() {
                        context.read<HomeBloc>().add(HomeInitialEvent());
                      });
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
            bottomNavigationBar: constraints.isMobile
                ? NavigationBar(
                    elevation: 0,
                    backgroundColor: AppColor.whiteColor,
                    destinations: destinations,
                  )
                : null);
      },
    );
  }

  Widget _homeBody(List<Results>? results) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.isDesktop) {
          return _homeDesktopListing(results, context);
        } else if (constraints.isMobile) {
          return _homeListing(results);
        } else {
          return _homeDesktopListing(results, context);
        }
      },
    );
  }

//desktop UI for listing
  Widget _homeDesktopListing(List<Results>? results, BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 40, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: MediaQuery.of(context).size.width / 80,
            mainAxisSpacing: MediaQuery.of(context).size.width / 80,
            childAspectRatio: 1),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailsPage(
                            results?[index].id, results?[index].name)));
              },
              child: destoplistItem(results?[index], index));
        },
        itemCount: results?.length ?? 0);
  }

//mobile Ui for listing
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
              child: listItem(results?[index], index));
        },
        itemCount: results?.length ?? 0);
  }
}
