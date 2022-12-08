import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/widgets/cached_image.dart';
import 'package:movies_app/shared/widgets/circle_progrees.dart';
import 'package:movies_app/ui/genre_data/cubit/genre_data_cubit.dart';

import '../../shared/functions.dart';
import '../../shared/utilis/app_size.dart';
import '../../shared/widgets/error_dialog.dart';

class GenreDataScreen extends StatelessWidget {
  const GenreDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenreDataCubit, GenreDataState>(
        builder: (context, state) {
          if (state is GenreDataError) {
            return ErrorDialog(error: state.error);
          } else if (state is GenreDataLoaded) {
            return SizedBox(
              height: AppHeight.sh0_75,
              child: ListView.builder(
                itemCount: state.data.results?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => navToDetalisPage(
                        context, state.data.results![index].id.toString(),isGenreDetails: true),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: AppHeight.h25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppHeight.sh0_4,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r12),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r12),
                              child: CachedImage(
                                getImagePath(
                                    state.data.results![index].posterPath!),
                                width: AppWidth.sw0_45,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppWidth.w10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.data.results![index].title!,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  height: AppHeight.h25,
                                ),
                                Text(
                                  state.data.results![index].overview!,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const CircleProgress();
          }
        },
      ),
    );
  }
}
