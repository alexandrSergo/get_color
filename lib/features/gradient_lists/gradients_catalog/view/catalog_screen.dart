import 'package:get_color/viewer/view.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarHeight),
          child: TypeAppBar(title: AppLocalizations.of(context)!.color_catalog,)
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              children: List.generate(catalogColorList.length, (index) {
                return Center(
                  child: collectionColorCard(catalogColorList[index], context)
                );
              }),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () async { //* dev
        //   String collectionName = "silver";
        //   final List<int> c1 = [  110, 110, 110 ];
        //   final List<int> c2 = [     165, 165, 165 ];
        //   final List<int> c3 = [    221, 221, 221 ];

        //   final data = {
        //     "color1": c1,
        //     "color2": c2,
        //     "color3": c3,
        //   };

        //   await db.collection(collectionName).add(data);
        // }, child: const Icon(Icons.ads_click),),
      )
    );
  }
}