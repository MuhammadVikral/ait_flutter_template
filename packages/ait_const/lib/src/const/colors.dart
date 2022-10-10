import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DesignColors extends Equatable {
  const DesignColors._();
  static final Color primaryLight2 = HexColor('#EFF6FF');
  static final Color primaryLight1 = HexColor('#BFDBFE');
  static final Color primaryBase = HexColor('#1D4ED8');
  static final Color primaryDark1 = HexColor('#173EAB');
  static final Color primaryDark2 = HexColor('#112D7E');

  @override
  List<Object?> get props =>
      [primaryLight1, primaryLight2, primaryBase, primaryDark2, primaryDark2];
}
