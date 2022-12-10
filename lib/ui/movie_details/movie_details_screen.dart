import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/functions.dart';

import 'package:movies_app/shared/utilis/colors_manger.dart';
import 'package:movies_app/shared/utilis/fonts_manger.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';
import 'package:movies_app/shared/widgets/cached_image.dart';
import 'package:movies_app/shared/widgets/circle_progrees.dart';
import 'package:movies_app/shared/widgets/error_dialog.dart';
import 'package:movies_app/ui/movie_details/cubit/movie_details_cubit.dart';

import '../../shared/utilis/app_size.dart';

class MovieDeailsScreen extends StatelessWidget {
  MovieDeailsScreen({super.key});

  final EdgeInsetsGeometry mainPadding =
      EdgeInsets.symmetric(horizontal: AppWidth.w10, vertical: AppHeight.h15);

  //final String id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsError) {
            return ErrorDialog(error: state.error);
          } else if (state is MovieDetailsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildMainHeroImage(
                    context,
                    state.data.id!,
                    state.data.image ?? "N/A",
                    state.data.title ?? "N/A",
                    state.data.genres ?? "N/A",
                    state.data.releaseDate ?? "N/A",
                    state.data.ratings ?? "N/A",
                  ),
                  _buildActionRow(
                    context,
                    bookmarkButtonOnPreesed: () {},
                    trailerButtonOnPreesed: () {
                      _navToTrailerScreen(context, state.data.trailer!.link!);
                    },
                    downloadButtonOnPreesed: () {},
                  ),
                  _buildDescription(context, state.data.plot),
                  _buildCrewAndCast(context, state.data.actorList!),
                  _buildSimilarMovies(context, state.data.similars!),
                ],
              ),
            );
          } else if (state is MovieDetailsGenreLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildMainHeroImage(
                    context,
                    state.data.id.toString(),
                    getImagePath(state.data.posterPath!),
                    state.data.title ?? "N/A",
                    state.data.genres![0].name ?? "N/A",
                    state.data.releaseDate ?? "N/A",
                    state.data.voteAverage!.toStringAsFixed(1),
                  ),
                  _buildActionRow(
                    context,
                    bookmarkButtonOnPreesed: () {},
                    trailerButtonOnPreesed: () {
                      _navToTrailerScreen(context, state.data.homepage!);
                    },
                    downloadButtonOnPreesed: () {},
                  ),
                  _buildDescription(context, state.data.overview),
                  //_buildCrewAndCast(context, state.data.actorList!),
                  //_buildSimilarMovies(context, state.data.similars!),
                ],
              ),
            );
          }
          return const CircleProgress();
        },
      )),
    );
  }

  void _navToTrailerScreen(context, String link) {
    Navigator.pushNamed(context, Routes.trailer, arguments: link);
  }

  _buildMainHeroImage(BuildContext context, String id, String imageUrl,
      String title, String genre, String releasedData, String rate) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: AppHeight.sh0_6,
      child: Stack(
        children: [
          Hero(
            tag: id,
            child: CachedImage(imageUrl,
                width: AppWidth.sw, color: ColorManager.grey.withOpacity(0.4)),
          ),
          Positioned(
            bottom: AppHeight.h10,
            left: AppWidth.w10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: AppHeight.h1,
                ),
                Text(
                  genre,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: AppHeight.h1,
                ),
                Text(
                  releasedData,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: AppHeight.h1,
                ),
                Text(
                  rate,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(
    context, {
    void Function()? trailerButtonOnPreesed,
    void Function()? downloadButtonOnPreesed,
    void Function()? bookmarkButtonOnPreesed,
  }) {
    return Padding(
      padding: mainPadding,
      child: Row(
        children: [
          SizedBox(
            width: AppWidth.sw0_7,
            height: AppHeight.h40,
            child: ElevatedButton(
              onPressed: trailerButtonOnPreesed,
              child: const Text(
                StringManager.trailer,
                style: TextStyle(color: ColorManager.black),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            color: ColorManager.white,
            iconSize: AppRadius.r30,
            onPressed: downloadButtonOnPreesed,
            icon: const Icon(Icons.download_outlined),
          ),
          IconButton(
            color: ColorManager.white,
            iconSize: AppRadius.r30,
            onPressed: bookmarkButtonOnPreesed,
            icon: const Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(context, desc) {
    return Padding(
      padding: mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManager.description,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: AppHeight.h10,
          ),
          Text(
            desc?? "N/A",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  _buildCrewAndCast(context, List data) {
    return Padding(
      padding: mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManager.crowAndCast,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: AppHeight.h10,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 20,
                childAspectRatio: 1.3,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: AppRadius.r40,
                      backgroundImage: NetworkImage(
                        data[index].image,
                      ),
                    ),
                    SizedBox(
                      width: AppWidth.w4,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              data[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(height: AppHeight.h1),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            height: AppHeight.h10,
                          ),
                          Flexible(
                            child: Text(
                              data[index].asCharacter,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color: ColorManager.ligthGrey,
                                      fontSize: FontSize.s14),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  Widget _buildSimilarMovies(context, List data) {
    return Padding(
      padding: mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManager.similarMovies,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: AppHeight.h10,
          ),
          Container(
            width: AppWidth.sw,
            height: AppHeight.sh0_5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            child: ListView.separated(
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => navToDetalisPage(context, data[index].id),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppHeight.sh0_4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.r12),
                          child: CachedImage(data[index].image!,
                              width: AppWidth.sw0_5),
                        ),
                      ),
                      SizedBox(
                        height: AppHeight.h2,
                      ),
                      Text(
                        data[index].title!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: ColorManager.secondry,
                          ),
                          SizedBox(
                            width: AppWidth.w4,
                          ),
                          Text(
                              (data[index].imDbRating.length != 0)
                                  ? data[index].imDbRating
                                  : "N/A",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: AppWidth.w10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
