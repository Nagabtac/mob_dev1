import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageFromAssetScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Theme Example'),
      ),

      body: Center(

        // child: Text('Hello, Flutter!'),
        //
        child: Column( //displays the children in a column format
          mainAxisAlignment: MainAxisAlignment.center,//centers the texts

          children: <Widget>[

            Text('Welcome to CCSE!',style: TextStyle(color: Colors.red,fontSize: 20.0,),),

            Text('Hello, Darwin!',style: TextStyle(color: Colors.white,fontSize: 20.0,), ),

          ],

        ),


      ),

      backgroundColor: Colors.black,


    );
  }

}class ImageFromAssetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Image from Asset')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/car.jpg', width: 150, height: 150),
                  Image.asset('assets/images/akon.jpg', width: 150, height: 150),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/dawg in him.jpg', width: 150, height: 150),
                  Image.asset('assets/images/meme.jpg', width: 150, height: 150),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/miku.png', width: 150, height: 150),
                  Image.asset('assets/images/pfp.jpg', width: 150, height: 150),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





