import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paytm/paytm.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//  Map<String,dynamic> s={"ORDER_ID":"5698"};
  String orderId = DateTime.now().millisecondsSinceEpoch.toString();

  checkSum() async {
    await http.post("https://promethean2k19.000webhostapp.com/paytmKit/generateChecksum.php",
        headers: {
           "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          "MID": "ParloS79006455919746",
          "CHANNEL_ID": "WAP",
          "INDUSTRY_TYPE_ID": "Retail",
          "WEBSITE": "APPSTAGING",
          "PAYTM_MERCHANT_KEY": "ZZq!5y!a3hU1mTS_",
          "TXN_AMOUNT": "10",
          "ORDER_ID": orderId,
          "CUST_ID": "122"
        }

    ).then((http.Response a) async {
      print(a.body);
      print(a.contentLength);
      print(a.headers);
       String callBackUrl = 'https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=' + orderId;

       var paytmResponse = Paytm.startPaytmPayment(
        true, 
        "ParloS79006455919746",
        orderId, 
        "122", 
        "WAP",
        "10",
        "APPSTAGING",
        callBackUrl,
        "Retail", 
        a.body
        );

    paytmResponse.then((value){
      print(value);
      // print(paytmResponse);
    });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Payment"),automaticallyImplyLeading: true,),
        body: Center(child: FlatButton(
          onPressed: (){
          checkSum();
        }, child: Text("Pay")),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// import 'package:paytm/paytm.dart';



// void main() => runApp(MyApp());



// class MyApp extends StatefulWidget {

//  @override

//  _MyAppState createState() => _MyAppState();

// }



// class _MyAppState extends State<MyApp> {

//  String payment_response = '';



//  @override

//  void initState() {

//    super.initState();

//  }



//  @override

//  Widget build(BuildContext context) {

//    return MaterialApp(

//      home: Scaffold(

//        appBar: AppBar(

//          title: const Text('Paytm example app'),

//        ),

//        body: Padding(

//          padding: EdgeInsets.all(10.0),

//          child: Column(

//            crossAxisAlignment: CrossAxisAlignment.stretch,

//            mainAxisAlignment: MainAxisAlignment.center,

//            children: <Widget>[

//              Text('Running on: $payment_response\n'),

//              RaisedButton(

//                onPressed: () {

//                  //Firstly Generate CheckSum bcoz Paytm Require this

//                  generateCheckSum();

//                },

//                color: Colors.blue,

//                child: Text(

//                  "Pay Now",

//                  style: TextStyle(color: Colors.white),

//                ),

//              )

//            ],

//          ),

//        ),

//      ),

//    );

//  }



//  void generateCheckSum() async {

// //    var url ='http://promethean2k19.000webhostapp.com/paytmKit/generateCheckSum.php';
//    var url =
//        'https://us-central1-mrdishant-4819c.cloudfunctions.net/generateCheckSum';


//    String orderId = DateTime.now().millisecondsSinceEpoch.toString();



//    //Please use your parameters here

//    //CHANNEL_ID etc provided to you by paytm



//    final response = await http.post(url, headers: {

//      "Content-Type": "application/x-www-form-urlencoded"

//    }, body: {

//      "mid": "GmvHHd58746018888699",

//      "CHANNEL_ID": "WAP",

//      'INDUSTRY_TYPE_ID': 'Retail',

//      'WEBSITE': 'APPSTAGING',

//      'PAYTM_MERCHANT_KEY': 'ZZq!5y!a3hU1mTS_',

//      'TXN_AMOUNT': '10',

//      'ORDER_ID': orderId,

//      'CUST_ID': '122',

//    });

//    print(response.headers);
//    print(response.contentLength);



//    //for Testing(Stagging) use this



//    //https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=



//    //https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=



//    String callBackUrl ='https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID='+orderId;



// //    print("Response :" + response.body);



//    //Parameters are like as per given below



//    // Testing (Staging or Production) if true then Stagginh else Production

//    // MID provided by paytm

//    // ORDERID your system generated order id

//    // CUSTOMER ID

//    // CHANNEL_ID provided by paytm

//    // AMOUNT

//    // WEBSITE provided by paytm

//    // CallbackURL (As used above)

//    // INDUSTRY_TYPE_ID provided by paytm

//    // checksum generated now



//    //Testing Credentials

//    //Mobile number: 7777777777

//    //OTP: 489871


//    var paytmResponse = Paytm.startPaytmPayment(

//        true,

//        "GmvHHd58746018888699",

//        orderId,

//        "122",

//        "WAP",

//        "10",

//        'APPSTAGING',

//        callBackUrl,

//        'Retail',

//        response.body);
//     //  print(response.body);


//    paytmResponse.then((value) {

//      setState(() {

//        payment_response = value.toString();

//      });

//    });

//  }

// }
