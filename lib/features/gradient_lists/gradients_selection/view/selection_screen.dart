import 'package:get_color/viewer/view.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final SelectionBloc _selectionBloc = SelectionBloc();

  @override
  void initState() {
    super.initState();
    _selectionBloc.add(LoadSelection(null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarHeight),
          child: TypeAppBar(title: AppLocalizations.of(context)!.selection,)
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
             _selectionBloc.add(LoadSelection(completer));
             return completer.future;
          },
          color: kGradientColor2,
          child: BlocBuilder<SelectionBloc, SelectionState>(
            bloc: _selectionBloc,
            builder: (context, state) {
              if (state is SelectionLoaded) {
                final dataList = state.selectionList;
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
              if (state is SelectionLoadingFailure) {
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