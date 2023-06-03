import 'package:get_color/viewer/view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key, required this.favList});

  final List<String>? favList;

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final FavouriteBloc _favouriteBloc = FavouriteBloc();

  @override
  void initState() {
    super.initState();
    _favouriteBloc.add(LoadFavourite(widget.favList ?? [], null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarHeight),
          child: TypeAppBar(title: AppLocalizations.of(context)!.favourites,)
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
             _favouriteBloc.add(LoadFavourite(widget.favList ?? [], completer));
             return completer.future;
          },
          color: kGradientColor2,
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            bloc: _favouriteBloc,
            builder: (context, state) {
              if (state is FavouriteLoaded) {
                final dataList = state.favouriteList;
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column( 
                    children: List.generate(dataList.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientCard(gradient: dataList[index])
                        ],
                      );
                    }),
                  )
                );
              }
              if (state is FavouriteLoadingFailure) {
                return const ConnectionErrorWidget();
              }
              return const LoadingWidget();
            },
          ),
        ),
      )
    );
  }
}