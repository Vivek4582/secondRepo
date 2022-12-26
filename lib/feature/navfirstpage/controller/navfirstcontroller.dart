


import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Navfirstcontroller extends GetxController {


  // List<FetchDataResponse>internDataList = <FetchDataResponse>[].obs;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  var change = true.obs;


  var loader = true.obs;

  RxString email = "".obs;
  RxString password = "".obs;
  RxString phone = "".obs;
  RxString name = "".obs;
  RxString id = "".obs;
  RxBool issuccess = false.obs;


  var currentAddress = "".obs;
  var currentDate = "".obs;
  var currentTime = "".obs;
  var isprofilevalid = false.obs;
  var setimagepath = "".obs;


  @override
  void onInit() async {
    getCurrentLatLong();

    printdata();
    todayDate();
    super.onInit();
  }

  Future<void> getCurrentLatLong() async {
    final myPosition = await _geolocatorPlatform.getCurrentPosition();
    getAddress(myPosition).then((value) {
      print(value);
      currentAddress.value = value;
    });
  }

  Future<String> getAddress(Position position) async {
    if (position.latitude != null && position.longitude != null) {
      try {
        var currentPlace = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (currentPlace != null && currentPlace.isNotEmpty) {
          final place = currentPlace.first;
          return "${place.name},${place.thoroughfare},${place
              .subLocality},${place.administrativeArea},${place
              .postalCode},${place.country}";
        }
      }
      catch (e) {
        return "${position.latitude},${position.longitude}";
      }
    }
    else {
      return "nothing else";
    }
    return "no address found";
  }


  printdata() async {
    print("Good Work");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name.value = prefs.getString("name")!;
    email.value = prefs.getString("emailId")!;
    id.value = prefs.getString("Id")!;
    password.value = prefs.getString("password")!;


    print(name);
    print(email);
    print(id);
  }

  todayDate() {
    var now = new DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    print(formattedTime);
    currentDate.value = formattedDate;
    currentTime.value = formattedTime;
    print(formattedDate);
  }

  //function for camerq
  File? pickedfile;
  ImagePicker imagePicker = ImagePicker();
  var isImageSet = false.obs;
  var profilepicpath = ''.obs;

  takephoto(ImageSource source) async {
    final pickedimage =
    await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedfile = File(pickedimage!.path);
    // setprofileimage(pickedfile!.path);
    print('image clicked');


    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("currentDate", currentDate.value);
    prefs.setString("currentTime", currentTime.value);
    prefs.setString("currentAddress", currentAddress.value);
  }

  setprofileimage(path) {
    profilepicpath.value = path;
    isImageSet.value = true;
  }
}







