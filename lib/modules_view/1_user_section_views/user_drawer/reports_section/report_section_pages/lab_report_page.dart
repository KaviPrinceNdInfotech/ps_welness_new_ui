import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LabReportPdf extends StatelessWidget {
  const LabReportPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyTheme.ThemeColors,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.01,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  left: size.width * 0.67,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.20,
                      width: size.width * 0.26,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/lab_equi1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Container(
                          height: size.height * 0.04,
                          width: size.width * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: size.width * 0.04,
                            ),
                          ))),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'See Your',
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                //color: Color(0xff023382)
                              ),
                            ),
                            TextSpan(
                              text: ' Reports',
                              style: GoogleFonts.alatsi(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple.shade500,
                                //color: Color(0xff023382)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Lab\'s Report!',
                        style: GoogleFonts.alatsi(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff023382)),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      PhysicalModel(
                        color: Colors.lightBlueAccent,
                        shadowColor: Colors.grey,
                        elevation: 7,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              height: size.height * 0.65,
                              width: size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white10),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // child: SfPdfViewer.network(
                              //     'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'
                              //     //'https://www.pdfdrive.com/no-drama-discipline-the-whole-brain-way-to-calm-the-chaos-and-nurture-your-childs-developing-mind-e60737124.html'
                              //     //'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'
                              //     ,
                              //     scrollDirection:
                              //         PdfScrollDirection.vertical)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
