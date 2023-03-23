import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class first_page extends StatefulWidget {
  const first_page({Key? key}) : super(key: key);

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {


  TextEditingController initialValue = TextEditingController();
  TextEditingController presentvalue = TextEditingController();

  double incress = 0;
  double? princres;

  double decress = 0;
  double prdecress = 0;

  bool swip = false;
  bool not = false;

  int? dif;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Percentage Changes",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                print("Inc");
                                swip = false;
                                if (initialValue.text != "" &&
                                    presentvalue.text != "") {
                                  increment();
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: swip == false
                                      ? HexColor('#38BDE7')
                                      : null,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Center(
                                child: Text('Increase',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                print("Dec");

                                swip = true;
                                print(swip);
                                if (initialValue.text != "" &&
                                    presentvalue.text != "") {
                                  Decrement();
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color:
                                    swip == true ? HexColor('#38BDE7') : null,
                              ),
                              child: Center(
                                child: Text(
                                  'Decrease',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: HexColor('#303030'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Initial Value",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: HexColor('#D9D9D9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: initialValue,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Present Value",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: HexColor('#D9D9D9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: presentvalue,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {

                      if(initialValue.text=="" || presentvalue.text=="")
                      {
                        print("Enter");
                        alert();
                      }
                      swip == false ? increment() : Decrement();
                      not = true;

                      dif=int.parse(initialValue.text)-int.parse(presentvalue.text);
                      print(dif?.abs());







                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: HexColor('#38BDE7'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                not == true
                    ? Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HexColor('#4A4949'),
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(color: Colors.orange,width: 5)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              swip == false
                                  ? Text(
                                      "Increased by",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    )
                                  : Text(
                                      "Decrease by",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                              SizedBox(height: 5,),
                              swip == false
                                  ? Text(
                                      "${(princres ?? 0).toStringAsFixed(2)}%",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 30),
                                    )
                                  : Text(
                                      "${(prdecress).toStringAsFixed(2)}%",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 30),
                                    ),
                              SizedBox(height: 20,),
                              Text("Difference",style: TextStyle(color: Colors.white,fontSize: 17),),
                              Text("${dif?.abs()}",style: TextStyle(fontSize:35,color: Colors.white),)
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          )),
          backgroundColor: Colors.white),
    );
  }

  increment() {
    //Increase=New Number−Original Number
    incress = double.parse(presentvalue.text) - double.parse(initialValue.text);
    print(incress);

    princres = (incress / double.parse(initialValue.text)).toDouble() * 100;
    print(princres);
  }

  Decrement() {
    // Decrease=Original Number−New Number

    decress = double.parse(initialValue.text) - double.parse(presentvalue.text);
    print(decress);

    prdecress = (decress / double.parse(initialValue.text)).toDouble() * 100;
    print(prdecress);
  }

  alert()
  {

     showDialog(builder: (context) {
       return CupertinoAlertDialog(
         title: new Text("Sorry!"),
         content: new Text("Please Enter the value"),
         actions:[
           CupertinoDialogAction(
             isDefaultAction: false,
             onPressed:(){
               Navigator.pop(context);
             } ,
             child: Text("Yes"),
           ),
           CupertinoDialogAction(
             onPressed: () {
               Navigator.pop(context);
             },
             child: Text("No"),
           )
         ],
       );
     },context:context);
  }
}
