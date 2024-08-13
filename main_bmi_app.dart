import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yourBMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),

                SizedBox(height: 21,),

                TextField(controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your weight (in Kg)'),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height (in Feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height (in Inch)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if(wt!="" && ft!="" && inch!=""){
                    //BMI CALCULATION
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
                    var totalInch = (iFt*12)+iInch;
                    var totalCm = totalInch*2.54;
                    var totalM = totalCm/100;
                    var bmi = iWt/(totalM*totalM);

                    var msg = "";
                    if(bmi>25){
                      msg = "You are overweight!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You are underweight";
                      bgColor = Colors.red.shade200;
                    }else{
                      msg = "You are healthy";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(2)}";
                    });
                  } else{
                    setState(() {
                      result = "Please fill required fields!";
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
