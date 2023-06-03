import 'package:get_color/viewer/view.dart';

class CatalogCollectionScreen extends StatefulWidget {
  const CatalogCollectionScreen({super.key, required this.collectionName, required this.collectionNameLocale});
  final String collectionName;
  final String collectionNameLocale;

  @override
  State<CatalogCollectionScreen> createState() => _CatalogCollectionScreenState();
}

class _CatalogCollectionScreenState extends State<CatalogCollectionScreen> {

  final CollectionBloc _collectionBloc = CollectionBloc();

  @override
  void initState() {
    super.initState();
    _collectionBloc.add(LoadCollection(collectionName: widget.collectionName, null));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarHeight),
          child: TypeAppBar(title: widget.collectionNameLocale,)
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
             _collectionBloc.add(LoadCollection(collectionName: widget.collectionName, completer));
             return completer.future;
          },
          color: kGradientColor2,
          child: BlocBuilder<CollectionBloc, CollectionState>(
            bloc: _collectionBloc,
            builder: (context, state) {
              if (state is CollectionLoaded) {
                final dataList = state.collectionList;
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
              if (state is CollectionLoadingFailure) {
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