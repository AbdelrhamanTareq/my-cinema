import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/widgets/circle_progrees.dart';
import 'package:movies_app/shared/widgets/error_dialog.dart';
import 'package:movies_app/ui/home/cubit/home_cubit.dart';

import '../../shared/functions.dart';
import '../../shared/utilis/app_size.dart';
import '../../shared/utilis/colors_manger.dart';
import '../../shared/utilis/string_manager.dart';
import '../../shared/widgets/cached_image.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  _changeIndex(index) {
    setState(() {
      _current = index;
    });
  }

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeError) {
            return ErrorDialog(
              error: state.error,
            );
          }
          if (state is HomeLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _buildTitleText(context, StringManager.trending),
                _buildCommingSoon(
                  controller,
                  state.homeData.comingSoon!.items!,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: _buildTitleText(context, StringManager.theWeekTop5,
                        isTextBig: true)),
                _bulidWeekTop5(context, state.homeData.boxOffice!.items!),
                _buildTitleText(context, StringManager.recomindation),
                _buildPopularTvs(state.homeData.mostPopularTvs!.items!),
                _buildTitleText(context, StringManager.collections),
                _buildPopularMovies(state.homeData.mostPopularMovies!.items!),
                _buildTitleText(context, StringManager.genre),
                _buildGenre(state.homeData.genre!.genres!),
              ],
            );
          } else {
            return const CircleProgress();
          }
        },
      ),
    );
  }

  Widget _buildCommingSoon(
    CarouselController controller,
    List data,
  ) {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: 5,
      itemBuilder: (context, index, i) {
        return InkWell(
          onTap: () => navToDetalisPage(context, data[index].id),
          child: _bulidSlider(context,
              current: _current,
              imageUrl: getImagePath1(
                data[index].image,
              ),
              tag: data[index].id,
              title: data[index].title,
              count: 5,
              controller: controller),
        );
      },
      options: CarouselOptions(
          onPageChanged: (index, _) {
            _changeIndex(index);
          },
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1),
    );
  }

  Widget _buildTitleText(context, String data, {bool isTextBig = false}) {
    return Padding(
      padding: EdgeInsets.all(AppWidth.w10),
      child: Text(data,
          style: isTextBig
              ? Theme.of(context).textTheme.headline1
              : Theme.of(context).textTheme.headline2),
    );
  }

  Widget _bulidSlider(context,
      {required String imageUrl,
      String? title,
      required int count,
      required int current,
      required String tag,
      required CarouselController controller}) {
    return Container(
      height: AppHeight.h200,
      padding: EdgeInsets.only(
        top: AppHeight.h10,
        bottom: AppHeight.h10,
      ),
      child: Stack(
        children: [
          Hero(
              tag: tag,
              child: CachedImage(
                imageUrl,
                width: AppWidth.sw,
              )),
          Positioned(
            bottom: AppHeight.h40,
            left: AppWidth.w10,
            child: Container(
              color: ColorManager.grey.withOpacity(0.5),
              padding: EdgeInsets.all(AppWidth.w10),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: AppHeight.h2),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        count,
                        (index) => GestureDetector(
                              onTap: () => controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.linear),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: AppHeight.h10,
                                    horizontal: AppWidth.w4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.white.withOpacity(
                                      current == index ? 0.9 : 0.4),
                                ),
                              ),
                            )),
                  ))),
        ],
      ),
    );
  }

  _buildCarouslSlider(
      {required int itemCount,
      required CarouselOptions options,
      required Widget Function(BuildContext, int, int)? itemBuilder}) {
    return CarouselSlider.builder(
        itemCount: itemCount, itemBuilder: itemBuilder, options: options);
  }

  Widget _bulidWeekTop5(
    context,
    List data,
  ) {
    return _buildCarouslSlider(
        itemCount: 5,
        options: CarouselOptions(
            height: AppHeight.h300, initialPage: 0, autoPlay: true),
        itemBuilder: (context, index, _) {
          return InkWell(
            onTap: () => navToDetalisPage(context, data[index].id),
            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.r8),
                child: CachedImage(data[index].image, width: AppWidth.sw0_6),
              ),
            ),
          );
        });
  }

  Widget _buildPopularTvs(List data) {
    return _buildMostPopularData(data, AppWidth.sw0_5);
  }

  Widget _buildPopularMovies(List data) {
    return _buildMostPopularData(data, AppWidth.sw0_75);
  }

  Widget _buildMostPopularData(List<dynamic> data, double imageWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w10, vertical: AppHeight.h10),
      width: AppWidth.sw,
      height: AppHeight.sh0_6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: ListView.separated(
        itemCount: 8,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => navToDetalisPage(context, data[index].id),
            child: Column(
              children: [
                SizedBox(
                  height: AppHeight.sh0_5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    child: CachedImage(data[index].image!, width: imageWidth),
                  ),
                ),
                SizedBox(
                  height: AppHeight.h2,
                ),
                Text(
                  data[index].title!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: AppWidth.w10,
        ),
      ),
    );
  }

  Widget _buildGenre(List data) {
    return Container(
      width: AppWidth.sw,
      height: AppHeight.sh0_4,
      padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w10, vertical: AppHeight.h10),
      child: GridView.builder(
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.genreData,
                  arguments: data[index].id),
              child: Container(
                //width: AppWidth.sw0_5,
                alignment: Alignment.center,
                //height: AppHeight.h10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    border: Border.all(color: ColorManager.secondry, width: 2.0)
                    //color: ColorManager.white),
                    ),
                child: Text(
                  data[index].name!,
                  style: Theme.of(context).textTheme.overline,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
    );
  }

  
}



