import 'viewer/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: kFontFamily, appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
      home: const InitialScreen(),
      supportedLocales: L10n.all,
      locale: Locale(Provider.of<LocaleProvider>(context).locale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}