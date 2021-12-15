import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanket/app_screen/Nursery_owner/Owner_login.dart';
import 'package:sanket/app_screen/Nursery_owner/Add_Product.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Reset.dart';
import 'package:sanket/app_screen/first.dart';
import 'package:sanket/app_screen/Nursery_owner/User/UserLogin.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Nursry_Home.dart';
import 'package:sanket/app_screen/Nursery_owner/User/plants_detail.dart';
import 'package:sanket/app_screen/Nursery_owner/User/productspage.dart';
import 'package:sanket/app_screen/Nursery_owner/User/search_By_Plant.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Cart.dart';
import 'package:sanket/rough_screen/productdetail.dart';
import 'package:sanket/rough_screen/plants.dart';
import 'package:sanket/app_screen/Nursery_owner/User/registration.dart';
import 'package:sanket/app_screen/Nursery_owner/User/Search_Appbar.dart';
// import 'package:sanket/app_screen/Location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'app_screen/Nursery_owner/Nursery_List.dart';
import 'app_screen/Nursery_owner/Nursery_Regestration.dart';
import 'app_screen/Nursery_owner/User/ContactUS.dart';
import 'rough_screen/detailsofproduct.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // home: AnimatedSplashScreen(
            //     duration: 3000,
            //     splash: Splash(),
            //     // splash: Container(
            //     //     decoration: BoxDecoration(color: Colors.green),
            //     //     child: Image.asset(
            //     //       'assets/images/agventurelogo.png',
            //     //       fit: BoxFit.scaleDown,
            //     //     )),
            //     nextScreen: Choose(),
            //     splashTransition: SplashTransition.fadeTransition,
            //     backgroundColor: Colors.white),
            // debugShowCheckedModeBanner: false,
            // initialRoute: '/',
            routes: {
              '/Cart': (context) => Atharv(),
              '/': (context) => SplashScreen(),
              '/Login_page_User': (context) => login_page(),
              '/ContactUs': (context) => ContactUs(),
              '/login_page_Owner': (context) => login_page_Owner(),
              '/addproduct': (context) => Add_Producct(),
              '/Nursery': (context) => home_Nursery(),
              '/register': (context) => registration_page(),
              '/password': (context) => ResetP(),
              '/plant': (context) => HomePage(),
              "/Nursery_Regestration": (context) => Nursery_Regestration(),
              "/O_Nursery_List": (context) => O_Nursery_List(),

              // '/location': (context) =>home_Nursery(),
              // '/xyz': (context) => product(),
              // '/detail': (context) => Detail()
              // '/product_page': (context) => productpage(),
              // '/product_detailpage': (context) => ProductDetailPage(),
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  // const SplashScreen({required Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (100)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            // Image(image: AssetImage("assets/images/agventurelogo.png")),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_jfbnp4d2.json',
                controller: _controller,
                height: MediaQuery.of(context).size.height * 1,
                animate: true,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().whenComplete(() => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Choose()),
                        ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Lottie.network(
//             "https://assets10.lottiefiles.com/packages/lf20_30jzypta.json",
//             fit: BoxFit.cover),
//       ),
//     );
//   }
// }