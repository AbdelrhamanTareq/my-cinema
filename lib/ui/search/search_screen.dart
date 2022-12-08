
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/functions.dart';
import 'package:movies_app/shared/utilis/app_size.dart';
import 'package:movies_app/shared/utilis/fonts_manger.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';
import 'package:movies_app/shared/widgets/cached_image.dart';
import 'package:movies_app/shared/widgets/error_dialog.dart';
import 'package:movies_app/ui/search/cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(AppWidth.w15, AppHeight.h25, AppWidth.w15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadText(context),
            SizedBox(
              height: AppHeight.h10,
            ),
            _buildSearchFiled(
                controller: _controller,
                onFieldSubmitted: (exprission) =>
                    BlocProvider.of<SearchCubit>(context).search(exprission)),
            SizedBox(
              height: AppHeight.h30,
            ),
            _buildSearchedDataResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadText(context) {
    return Text(
      StringManager.search,
      style: Theme.of(context)
          .textTheme
          .overline!
          .copyWith(fontWeight: FontWeightManager.regular),
    );
  }

  Widget _buildSearchFiled({
    required TextEditingController controller,
    required Function(String)? onFieldSubmitted,
  }) {
    return Form(
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        style: Theme.of(context).textTheme.bodyText1,
        controller: controller,
        decoration: const InputDecoration(
          hintText: StringManager.hintText,
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }

  _buildSearchedDataResult() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchError) {
          return ErrorDialog(error: state.error);
        } else if (state is SearchLoaded) {
          return SizedBox(
            height: AppHeight.sh0_75,
            child: ListView.builder(
              itemCount: state.data.results.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()=> navToDetalisPage(context, state.data.results[index].id),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: AppHeight.h25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppHeight.sh0_4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.r12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.r12),
                            child: CachedImage(
                              state.data.results[index].image,
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
                                state.data.results[index].title,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(
                                height: AppHeight.h25,
                              ),
                              Text(state.data.results[index].description,style:Theme.of(context).textTheme.headline4 ,),
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
        } else if(state is SearchLoading) {
          return const LinearProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
