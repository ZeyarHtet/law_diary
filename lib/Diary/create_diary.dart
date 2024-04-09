import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:law_diary/Diary/daily_diary.dart';
import 'package:law_diary/Law-Category/law-category.dart';
import 'package:law_diary/common.dart';
import 'package:law_diary/main.dart';

import '../API/api.dart';

class CreateDiary extends StatefulWidget {
  String userId;
  CreateDiary({super.key, required this.userId});

  @override
  State<CreateDiary> createState() => _CreateDiaryState();
}

class _CreateDiaryState extends State<CreateDiary> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caseController = TextEditingController();
  final TextEditingController _caseNumController = TextEditingController();
  final TextEditingController _caseTypeController = TextEditingController();
  final TextEditingController _startdateController = TextEditingController();
  final TextEditingController _appointmentController = TextEditingController();
  final TextEditingController _actionsController = TextEditingController();
  final TextEditingController _toDoController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  bool isLoading = false;
  DateTime? picked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdcolor,
      appBar: AppBar(
        backgroundColor: thirdcolor,
        elevation: 0,
        leading: BackButton(
          color: darkmain,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyDiary(
                  userId: widget.userId,
                ),
              ),
            );
          },
        ),
        title: Text(
          'နေ့စဉ်မှတ်တမ်း',
          style: GoogleFonts.poppins(
            fontSize: 17,
            color: darkmain,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async{
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyDiary(
                  userId: widget.userId,
                ),
              ),
            );
            return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'အမှုနံပါတ်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _caseNumController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'အမှု',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _caseController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'အမှုသည်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _nameController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'အမှုအမျိုးအစား',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _caseTypeController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    onTap: () {
                      _DateDialog();
                    },
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'နေ့စွဲ',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _startdateController,
                    validator: (value) {
                      return value!.isEmpty ? 'Please Enter Start Date!' : null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    onTap: () {
                      _pickDateDialog();
                    },
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'ရုံးချိန်းရက်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _appointmentController,
                    validator: (value) {
                      return value!.isEmpty ? 'Please Enter Appointment!' : null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'ဆောင်ရွက်ရန်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _actionsController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'ဆောင်ရွက်ချက်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _toDoController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                  left: 15,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextFormField(
                    style: TextStyle(color: backcolor),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: fifthcolor),
                      ),
                      labelText: 'မှတ်ချက်',
                      labelStyle: TextStyle(color: fifthcolor),
                      // border: InputBorder.none,
                    ),
                    controller: _notesController,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    color: darkmain,
                    onPressed: () {
                      if (_caseNumController.text == "") {
                        showToast(context, "အမှုနံပါတ်ထည့်ပါ!!", Colors.red);
                      } else if (_caseController.text == "") {
                        showToast(context, "အမှုထည့်ပါ", Colors.red);
                      } else if (_nameController.text == "") {
                        showToast(context, "အမှုသည်နာမည်ထည့်ပါ", Colors.red);
                      } else {
                        setState(() {
                          createDiary(widget.userId);
                        });
                      }
                    },
                    child: isLoading
                        ? const SpinKitRing(
                            size: 23,
                            lineWidth: 3,
                            color: Colors.black,
                          )
                        : Text(
                            'Create',
                            style: GoogleFonts.poppins(
                                color: seccolor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String diaryId = "";

  createDiary(userId) async {
    print("++++++++++++++++++++++$userId");
    isLoading = true;
    final response = await API().createDiaryApi(
      userId,
      _caseNumController.text,
      _caseController.text,
      _nameController.text,
      _caseTypeController.text,
    );
    print("hererere");
    var res = jsonDecode(response.body);
    var data = res['data'];
    print('+++++++++++++${data}');

    diaryId = data['diaryId'];
    print("========$diaryId");
    if (diaryId != '') {
      createDetails(diaryId);
    }
    // print(
    //     ">>>>>>>>>>> create diary response statusCode ${response.statusCode}");
    // print(">>>>>>>>>>> create diary response body ${response.body}");
    // if (response.statusCode == 200) {
    //   print("herer 0--");
    //   // ignore: use_build_context_synchronously
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const DailyDiary(),
    //     ),
    //   );
    // } else if (response.statusCode == 500) {
    //   showToast(context, res['message'], Colors.red);
    // }
    // setState(() {
    //   isLoading = false;
    // });
  }

  createDetails(id) async {
    final response = await API().createDiaryDetailsApi(
      id,
      _startdateController.text,
      _appointmentController.text,
      _actionsController.text,
      _toDoController.text,
      _notesController.text,
    );
    print("hererere");
    var res = jsonDecode(response.body);
    print(
        ">>>>>>>>>>> create diary response statusCode ${response.statusCode}");
    print(">>>>>>>>>>> create diary response body ${response.body}");

    if (response.statusCode == 200) {
      print("herer 0--");
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DailyDiary(
            userId: widget.userId,
          ),
        ),
      );
    } else if (response.statusCode == 500) {
      showToast(context, res['message'], Colors.red);
    }
    setState(() {
      isLoading = false;
    });
    setState(() {
      isLoading = false;
    });
  }

  void _pickDateDialog() async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        // _start_dateController.text = '${picked!.year} - ${picked!.month} ${picked!.day}';
        _appointmentController.text = DateFormat('yyyy-MM-dd').format(picked!);
      });
    }
  }

  void _DateDialog() async {
    print("-------");
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(2100),
    );
    print('-----++++++');
    if (picked != null) {
      print('00000000');
      setState(() {
        // _start_dateController.text = '${picked!.year} - ${picked!.month} ${picked!.day}';
        _startdateController.text = DateFormat('yyyy-MM-dd').format(picked!);
        print(_startdateController);
      });
    }
  }
}