import 'viewer/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp
    ]
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocaleProvider>(create: (context) => LocaleProvider()),
      ChangeNotifierProvider<FavouriteProvider>(create: (context) => FavouriteProvider()),
    ],
    child: const MyApp()
  ));
}

