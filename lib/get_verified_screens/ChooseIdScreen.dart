import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;

class ChooseIdScreen extends StatefulWidget {



  @override
  _ChooseIdScreenState createState() => _ChooseIdScreenState();
}

class _ChooseIdScreenState extends State<ChooseIdScreen> {

  List<String> listIdTypes=[
    "Recommended ID",
    "UMID",
    "Driver's License",
    "Philhealth Card",
    "SSS ID",
    "Passport",
    "Voter's ID",
    "Other ID",
    "Alien/Immigration Cor",
    "Government Office/GOCC ID",
    "HDMF ID (Pagibig)",
  ];

  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0133B8),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,
        color: Colors.white,),
    ),
        title: Text("Choose an ID",style: TextStyle(
          color: Colors.white,
        ),),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Choose Your ID",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Make sure your ID is valid and not expired",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemCount: listIdTypes.length,
              itemBuilder: (ctx,idx){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    _imgFromCamera();
                  },
                  child: Container(
                    width: size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Text(listIdTypes[idx],
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),),),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(height: 1,
                thickness: 1,)
              ],
            );
          }),
        )
      ],

    )
    );
  }


  void _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
