import 'package:get/get.dart';

class TabbarViewController extends GetxController {

  final RxInt selectedIndex = 0.obs;

  void changeTab(int index){
    selectedIndex.value = index;
  }
}
