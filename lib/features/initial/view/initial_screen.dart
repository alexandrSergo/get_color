import 'package:get_color/viewer/view.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteProvider>(context, listen: false).getFavorList();
  }


  @override
  Widget build(BuildContext context) {
    String selectLanguage =  Provider.of<LocaleProvider>(context, listen: false).locale.toUpperCase();
    final List<String>? prefs =  Provider.of<FavouriteProvider>(context).favList;
    final int prefsLen = prefs?.length ?? 0;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectLanguage,
                        items: languages.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isDense: true,
                        elevation: 1,
                        onChanged:(value) {
                          Provider.of<LocaleProvider>(context, listen: false).changeLocale();
                          selectLanguage = Provider.of<LocaleProvider>(context, listen: false).locale.toUpperCase();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text('RGB', style: textStyleRGB,),
                                Text('${kGradientColor1.red}, ${kGradientColor1.green}, ${kGradientColor1.blue}', style: textStyleRGB,)
                              ],
                            ),
                            Column(
                              children: [
                                const Text('RGB', style: textStyleRGB,),
                                Text('${kGradientColor2.red}, ${kGradientColor2.green}, ${kGradientColor2.blue}', style: textStyleRGB,)
                              ],
                            ),
                            Column(
                              children: [
                                const Text('RGB', style: textStyleRGB,),
                                Text('${kGradientColor3.red}, ${kGradientColor3.green}, ${kGradientColor3.blue}', style: textStyleRGB,)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            child: Image.asset('assets/images/get_color.png')
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Text(AppLocalizations.of(context)!.gradients_for_everyone, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              const SizedBox(height: 140,),
              buttonGradient(AppLocalizations.of(context)!.color_catalog, () {
                routeUp(context, const CatalogScreen());
              }),
              const SizedBox(height: 20,),
              buttonBorderColor(AppLocalizations.of(context)!.selection, () {
                routeUp(context, const SelectionScreen());
              }),
              const SizedBox(height: 20,),
              buttonBorderColor('${AppLocalizations.of(context)!.favourites} - $prefsLen', () {
                routeUp(context, FavouriteScreen(favList: prefs,));
              }),
            ],
          ),
        ),
      )
    );
  }
}