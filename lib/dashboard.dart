import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required token, required email}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
        children:[
          const SizedBox(height: 100,),
          Text("Dashboard",
            style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue)),
                const SizedBox(height: 20,),
          Text('Signed in as ',style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue)),
                ],),
                ),
      ),
      );
  }
}