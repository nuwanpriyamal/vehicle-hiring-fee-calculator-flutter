import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ffff",
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final currencyTypes = ['lkr','usd'];
  String currency='lkr';
  String resultText="";
  TextEditingController distancecontroller= TextEditingController();
  TextEditingController fuelunitcontroller= TextEditingController();
  TextEditingController fuelpricecontroller= TextEditingController();
  TextEditingController fixedpricecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("fuel cal"),leading:Icon(Icons.directions_car,color: Colors.yellowAccent,),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            TextField(
              controller: fuelunitcontroller,
              decoration: InputDecoration(
                labelText: "Distance per fuel unit",
                hintText: "23",
              ),
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: distancecontroller,
              decoration: InputDecoration(
                labelText: "Distance ",
                hintText: "23",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: fuelpricecontroller,
              decoration: InputDecoration(
                labelText: "price",
                hintText: "23",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: fixedpricecontroller,
              decoration: InputDecoration(
                labelText: "fixed price",
                hintText: "23",
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(items: currencyTypes.map((String value){
              return DropdownMenuItem<String>(value:value ,
                child: Text(value, textScaleFactor: 2),
              );
            }).toList(),
            value: currency,
              onChanged: (String value) {
              onDropDownChanged(value);
              },
            ),

            RaisedButton(
                color: Colors.amber, child: Text("calculator", textScaleFactor: 2.06,), padding: EdgeInsets.all(25),
                onPressed: (){
                  setState(() {
                    resultText=calculatefuelprice();
                  });
                }),
            Text(""),
            Text(resultText, textAlign: TextAlign.center, textScaleFactor: 2,),
             ],
        ),
      ),
    );
  }
  onDropDownChanged(String value){
    setState(() {
      this.currency=value;
    });
  }
  String calculatefuelprice(){
    double distancetravelled =double.parse(distancecontroller.text);
    double fuelunit= double.parse(fuelunitcontroller.text);
    double pricefuel= double.parse(fuelpricecontroller.text);
    double fixedprice= double.parse(fixedpricecontroller.text);
    double totalcost=((distancetravelled/fuelunit)*pricefuel)+fixedprice;
    String resultText ="Total cost "+totalcost.toString()+" "+currency;
    return resultText;
  }
}

