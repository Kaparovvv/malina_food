import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/containerStore_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_event.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_state.dart';
import 'package:malina_app/screens/store_screen/store_screen.dart';

class StoreListBlocConsumer extends StatelessWidget {
  const StoreListBlocConsumer({
    Key? key,
    required StoreListBloc storeListBloc,
  })  : _storeListBloc = storeListBloc,
        super(key: key);

  final StoreListBloc _storeListBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreListBloc, StoreListState>(
      bloc: _storeListBloc,
      listener: (context, state) {
        if (state is ErrorStoreListState) {
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
        if (state is ErrorStoreListState) {
          return SizedBox(
            width: 100.w,
            height: 50,
            child: ElevatedButton(
              onPressed: () => _storeListBloc.add(
                GetStoreListEvent(),
              ),
              style: ElevatedButton.styleFrom(),
              child: const Text('Try Again'),
            ),
          );
        }
        if (state is LoadingStoreListState) {
          return const Center(
            child: LoadingIndicatorWidget(),
          );
        }

        if (state is LoadedStoreListState) {
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
                  child: Text('Здесь пока ничего нет'),
                );
        }
        return const SizedBox();
      },
    );
  }
}