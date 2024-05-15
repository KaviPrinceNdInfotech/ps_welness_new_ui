import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';

class Sharelinkweight extends StatefulWidget {
  const Sharelinkweight({Key? key}) : super(key: key);

  @override
  SharelinkweightState createState() => SharelinkweightState();
}

class SharelinkweightState extends State<Sharelinkweight> {
  final TextEditingController _controller = TextEditingController();

  //TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    ///....///.....///.....///.....///......///.......///.......///......///......
    //AccountNoController = TextEditingController(text: '9898666666');
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        //text:
        // "https://play.google.com/store/apps/details?id=com.ndinfotech.pswellnessapp.ps_welness_new_ui",
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String text =
      "This Is My New P S Wellness App Link You can Download and Share It :- ${"https://play.google.com/store/apps/details?id=com.ndinfotech.pswellnessapp.ps_welness_new_ui"}";
  String link = 'Ps Wellness App link';
  //'https://play.google.com/store/apps/details?id=com.ndinfotech.pswellnessapp.ps_welness_new_ui';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///todo:......///.....todo:....///....///.......///......///...

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ps Wellness Share App'),
          elevation: 0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            ///todo:.........///todo:.........///todo:...........//todo:...........
            image: DecorationImage(
                image: NetworkImage(

                    ///
                    "https://images.unsplash.com/photo-1663836657800-39ab390d80b9?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    //"https://images.unsplash.com/photo-1573883430060-1678c9cd4221?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                    //"https://images.unsplash.com/photo-1573883431205-98b5f10aaedb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                    // "https://images.unsplash.com/photo-1584308878768-57d3387b1882?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2082&q=80"
                    //"https://images.unsplash.com/photo-1544108182-8810058c3a7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80"
                    //"https://images.unsplash.com/photo-1517196084897-498e0abd7c2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=800&q=60"
                    ),
                fit: BoxFit.cover),

            //https://images.unsplash.com/photo-1513366208864-87536b8bd7b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.12,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        // shape: BoxShape.circle,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        // image: DecorationImage(image: AssetImage(
                        //     //"https://images.unsplash.com/photo-1544108182-8810058c3a7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2669&q=80"
                        //     "lib/assets/image/ps_welness2.png"),
                        //     fit: BoxFit.cover),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 140,
                        child: CircleAvatar(
                          radius: 110,
                          //backgroundColor: Colors.black,
                          backgroundImage:
                              AssetImage('lib/assets/image/ps_welness2.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    ///.......................
                    Container(
                      height: size.height * 0.34,
                      width: size.width * 0.90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextFormField(
                              readOnly: true,
                              controller: TextEditingController(text: text),
                              //         "https://play.google.com/store/apps/details?id=com.ndinfotech.pswellnessapp.ps_welness_new_ui"),
                              decoration: const InputDecoration(
                                labelText: 'App Link:',
                                hintText: '',
                              ),
                              maxLines: 3,
                              onChanged: (String value) => setState(() {
                                text = value;
                              }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: TextEditingController(text: link),
                              decoration: const InputDecoration(
                                labelText: 'Subject:',
                                //hintText: 'Enter subject to share',
                              ),
                              maxLines: 1,
                              onChanged: (String value) => setState(() {
                                link = value;
                              }),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(bottom: 12.0)),
                            Builder(
                              builder: (BuildContext context) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.cyan,
                                    onPrimary: Colors.white,
                                    elevation: 5, // Elevation
                                    shadowColor: Colors.red, // Shadow Color
                                  ),
                                  onPressed: text.isEmpty
                                      ? null
                                      : () => _onShare(context),
                                  child: const Text('Share'),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///...................
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(text,
        subject: link,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
