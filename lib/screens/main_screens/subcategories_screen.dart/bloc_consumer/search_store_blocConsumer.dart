import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/global_blocs/search_bloc/search_category/search_bloc.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/containerStore_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/store_screen.dart';

class SearchStoreBlocConsumer extends StatelessWidget {
  const SearchStoreBlocConsumer({
    Key? key,
    required SearchBloc searchBloc,
  })  : _searchBloc = searchBloc,
        super(key: key);

  final SearchBloc _searchBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: _searchBloc,
      listener: (context, state) {
        if (state is ErrorSearchState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message.toString(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingSearchState) {
          return const Center(
            child: LoadingIndicatorWidget(),
          );
        }

        if (state is LoadedSearchStoreState) {
          Box storeIdBox = Hive.box('storeIdBox');
          return state.storeModelList.results!.isNotEmpty
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.storeModelList.count!,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15.h);
                  },
                  itemBuilder: (context, index) {
                    final store = state.storeModelList.results![index];
                    return ContainerStoreWidget(
                      imageUrl: store.avatar,
                      nameStore: store.name ?? 'unknown',
                      onTap: () {
                        storeIdBox.put('storeIdCache', store.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StoreScreen(),
                          ),
                        );
                      },
                    );
                  },
                )
              : const Center(
                  child: Text('Заведения с таким названием нет'),
                );
        }
        return const SizedBox();
      },
    );
  }
}
