import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../Core/Costum Widgets/Common SizedBox/costum_widgets.dart';
import '../../../Core/Costum Widgets/Common TextButton/costum_textbutton.dart';
import '../../../Core/Costum_Color/App Colors/app_colors.dart';
import 'Costum_ListTile.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? pickedImage;
  bool showLocalImage = false;
  pickImageFromDevive() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    pickedImage = File(file.path);
    showLocalImage = true;
    setState(() {});
  }

  Appcolors appcolors = Appcolors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 20, 41),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 51),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.white.withOpacity(0.3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  fixheight,
                  Row(
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1.w,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ),
                      SizedBox(width: 65.w),
                      Text(
                        'Edit Profile',
                        style: GoogleFonts.alike(
                          color: appcolors.blue,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  fixheight3,
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: showLocalImage == false
                        ? AssetImage("images/my.png")
                        : FileImage(pickedImage!) as ImageProvider,
                  ),
                  fixheight3,
                  costum_textbutton(
                    name: 'Change Profile Picture',
                    fontsize: 23,
                    txtColor: appcolors.blue,
                    onpressed: () {
                      showModalBottomSheet(
                          backgroundColor: Color.fromARGB(255, 19, 20, 41),
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.camera_alt_outlined,
                                    color: appcolors.white,
                                  ),
                                  title: Text(
                                    "With Camera",
                                    style: GoogleFonts.alike(
                                      color: appcolors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: appcolors.white,
                                  ),
                                  onTap: () {},
                                ),
                                Divider(
                                  color: Colors.grey.shade700,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.storage_rounded,
                                    color: appcolors.white,
                                  ),
                                  title: Text(
                                    "With Gallery",
                                    style: GoogleFonts.alike(
                                      color: appcolors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: appcolors.white,
                                  ),
                                  onTap: () {
                                    pickImageFromDevive();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CostumListTile(
                          text: "First Name", hintText: "Enter First Name"),
                    ),
                    Expanded(
                      child: CostumListTile(
                          text: "Last Name", hintText: "Enter Last Name"),
                    ),
                  ],
                ),
                fixheight2,
                CostumListTile(
                    text: "Username", hintText: "Enter Your Username"),
                fixheight2,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    'Phone Number',
                    style: GoogleFonts.alike(
                      color: appcolors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: IntlPhoneField(
                    keyboardType: TextInputType.phone,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: Color.fromARGB(255, 19, 20, 41),
                      countryCodeStyle: TextStyle(
                        color: Colors.white,
                      ),
                      countryNameStyle: TextStyle(
                        color: Colors.white,
                      ),
                      searchFieldCursorColor: Colors.white,
                      listTileDivider: Divider(
                        color: Colors.white,
                      ),
                      searchFieldInputDecoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'Search Country Code',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                    ),
                    dropdownTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                fixheight2,
                Row(
                  children: [
                    Expanded(
                      child: CostumListTile(
                          text: "Date of Birth", hintText: "E.g: 17-8-2000"),
                    ),
                    Expanded(
                        child: CostumListTile(
                            text: "Gender", hintText: "E.g: Male"))
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: InkWell(
                    onTap: () {
                      // go to the profile screen after give user details
                      Get.back();
                    },
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 32, 57),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 7.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Save Profile',
                              style: GoogleFonts.alike(
                                color: appcolors.white,
                                fontSize: 26.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: appcolors.white,
                                border: Border.all(
                                  width: 1.w,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 27,
                              ),
                            ),
                          ],
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
    );
  }
}
