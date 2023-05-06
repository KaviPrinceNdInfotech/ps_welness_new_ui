import 'package:flutter/material.dart';

class NurseReportView extends StatelessWidget {

 final List item=[
  "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg",
   "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           ListView.builder(
             itemCount: item.length,
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context,index){
                 return  Padding(
                   padding: const EdgeInsets.only(top: 5.0),
                   child: Container(
                     //height: 250, width: double.infinity,
                     color: Colors.red,
                     child: Image.network(item[index],
                       fit: BoxFit.fill,),
                   ),
                 );
               })
          ],
        ),
      ),
    );
  }
}
