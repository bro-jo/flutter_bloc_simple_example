import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/const/color.dart';

const BM_DOYHEON = 'BM_Dohyeon';
const NANUM_BARUNPEN_R = 'NanumBarunpenR';
const NANUM_BARUN_GOTHIC = 'NanumBarunGothic';

class MTextStyle {
  static final whiteTitle = (double size) => TextStyle(fontSize: size, fontFamily: BM_DOYHEON, color: MColor.white);
  static final white = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.white, fontWeight: FontWeight.w300);
  static final whiteBold = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.white, fontWeight: FontWeight.w800);

  static final gray = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.gray2, fontWeight: FontWeight.w300);

  static final primaryBold = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.primary, fontWeight: FontWeight.w800);

  static final whiteGothic = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUN_GOTHIC, color: MColor.white);
  static final whiteGothicBold = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUN_GOTHIC, color: MColor.white, fontWeight: FontWeight.w800);

  static final chatBoxOfBot = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.white, height: 1.3);
  static final chatBoxOfUser = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.blackText, height: 1.3);
  static final chatInput = (double size) => TextStyle(fontSize: size, fontFamily: NANUM_BARUNPEN_R, color: MColor.primaryDark1, fontWeight: FontWeight.w600, height: 1.3);
}