

import 'package:get/get.dart';
import 'package:untitled/feature/navthirdpage/view/navthird.dart';

import '../../navfirstpage/view/navfirst.dart';
import '../../navsecondpage/view/navsecond.dart';


class ProfileController extends GetxController{
 RxInt selectedIndex = 0.obs;


  var pages=[
    navfirst(),
    DetailsPage(),
    Navthird(),];

   onTapButton(index){
      selectedIndex.value=index;
    }
  }



