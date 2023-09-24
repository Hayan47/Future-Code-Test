import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:future_code_test/view/screens/vehicles_screen.dart';
import 'package:future_code_test/view/widgets/mydropdown.dart';
import 'package:future_code_test/view/widgets/mytextfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final formKey = GlobalKey<FormState>();

  String dropdownValue1 = 'سيارة';
  List<String> types = [
    'سيارة',
    'دراجة',
  ];
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final boardNumberController = TextEditingController();

  Uint8List? carImage;
  Uint8List? boardImage;
  Uint8List? idImage;
  Uint8List? mechanicImage;
  Uint8List? delegateImage;

  List<Uint8List> carImages = [];

  uploadCarImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = await image.readAsBytes();
      setState(() {
        carImage = imageTemporary;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

  uploadBoardImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = await image.readAsBytes();
      setState(() {
        boardImage = imageTemporary;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

  uploadIdImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = await image.readAsBytes();
      setState(() {
        idImage = imageTemporary;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

  uploadMechanicImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = await image.readAsBytes();
      setState(() {
        mechanicImage = imageTemporary;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

  uploadDelegateImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = await image.readAsBytes();
      setState(() {
        delegateImage = imageTemporary;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

//? pick images
  pickImages() async {
    try {
      List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
      for (var pickedFile in pickedFiles) {
        final image = File(pickedFile.path);
        final imageData = await image.readAsBytes();
        setState(() {
          carImages.add(Uint8List.fromList(imageData));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('حدث حطأ'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Container(
              padding: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'اضافة مركبة',
          style: GoogleFonts.cairo(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    //!type
                    MyDropdown(
                      label: 'نوع المركبة',
                      dropdownValue: dropdownValue1,
                      icon: 'assets/icons/steering.png',
                      items: types
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownValue1 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                    //!model
                    MyTextField(
                      hint: 'الموديل',
                      controller: modelController,
                      inputType: TextInputType.text,
                      actionType: TextInputAction.next,
                      validator: (value) {
                        if (value == "") {
                          return 'ادخل موديل السيارة';
                        }
                        return null;
                      },
                      prefix: Image.asset('assets/icons/car.png'),
                    ),
                    //!color
                    MyTextField(
                      hint: 'اللون',
                      controller: colorController,
                      inputType: TextInputType.text,
                      actionType: TextInputAction.next,
                      validator: (value) {
                        if (value == "") {
                          return 'ادخل لون السيارة';
                        }
                        return null;
                      },
                      prefix: Image.asset('assets/icons/ColorPalette.png'),
                    ),
                    //!board number
                    MyTextField(
                      hint: 'رقم اللوحة',
                      controller: boardNumberController,
                      inputType: TextInputType.number,
                      actionType: TextInputAction.done,
                      validator: (value) {
                        if (value == "") {
                          return 'ادخل رقم لوحة السيارة';
                        }
                        return null;
                      },
                      prefix: Image.asset(
                        'assets/icons/PlateNumber.png',
                        width: 19,
                        height: 19,
                      ),
                    ),
                    //!car image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صورة المركبة',
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: uploadCarImage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: carImage != null
                                  ? Image.memory(carImage!)
                                  : Image.asset('assets/images/carholder2.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //!board image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صورة اللوحة',
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: uploadBoardImage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: boardImage != null
                                  ? Image.memory(boardImage!)
                                  : Image.asset(
                                      'assets/images/plateplaceholder.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //!id image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الهوية الشخصية',
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: uploadIdImage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: idImage != null
                                  ? Image.memory(idImage!)
                                  : Image.asset(
                                      'assets/images/idplaceholder.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //!mechanic image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صورة الميكانيك',
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: uploadMechanicImage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: mechanicImage != null
                                  ? Image.memory(mechanicImage!)
                                  : Image.asset(
                                      'assets/images/licenceplaceholder2.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //!delegate image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الوكالة أو التفويض',
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: uploadDelegateImage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: delegateImage != null
                                  ? Image.memory(delegateImage!)
                                  : Image.asset(
                                      'assets/images/contractplaceholder2.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    //!pick album
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'أضف صور لليسارة',
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: pickImages,
                        child: SizedBox(
                          height: 220,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                              ),
                            ),
                            child: GridView.count(
                              crossAxisCount: 3,
                              children: (carImages.isEmpty)
                                  ? List.generate(
                                      9,
                                      (index) => Card(
                                        child: Image.asset(
                                            'assets/images/carholder2.png'),
                                      ),
                                    )
                                  : List.generate(
                                      carImages.length,
                                      (index) {
                                        return Card(
                                          child: Image.memory(
                                            carImages[index],
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    //!add button
                    GestureDetector(
                      onTap: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('ادخل بيانات صحيحة'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        } else if (carImage == null ||
                            boardImage == null ||
                            idImage == null ||
                            mechanicImage == null ||
                            delegateImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('أضف الصور المطلوبة'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VehicleScreen(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.blue.shade900,
                          ),
                          child: Center(
                            child: Text(
                              'اضافة مركبة',
                              style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
