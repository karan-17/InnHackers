import 'package:flutter/material.dart';
class HomePage extends StatelessWidget{

  const HomePage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("ID CARD"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/events/karen_0W6Zqpq.PNG'
                  ),
                  radius: 50,
                ),
              ),
              Divider(
                  color : Colors.deepOrangeAccent
              ),
              Text("Name",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Karan",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Text("ID ",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text("0123",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Text("Class",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Fourth",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),  ),
              SizedBox(height: 30.0,),
              Text("Guardian Name",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Dinesh",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing : 2.0,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}