import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class DesignDialog extends StatelessWidget {
  const DesignDialog({
    super.key,
    this.onPositive,
    this.onNegative,
    this.title = '',
    this.body = '',
    this.image,
  });
  final String title;
  final String body;
  final DesignImage? image;
  final Function()? onPositive;
  final Function()? onNegative;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: image != null,
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: image ?? SizedBox(),
                ),
              ),
              Visibility(
                visible: title.isNotEmpty,
                child: DesignText.h6(title).bold,
              ),
              Visibility(
                visible: body.isNotEmpty,
                child: DesignText.body2(body),
              ),
              Visibility(
                visible: onPositive != null || onNegative != null,
                child: Row(
                  children: [
                    Visibility(
                      visible: onNegative != null,
                      child: Expanded(
                        child: DesignButton(
                          backgroundColor: DesignColors.primaryLight2,
                          child: DesignText.body1('Button 1')
                              .bold
                              .overideColor(DesignColors.primaryBase),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Visibility(
                      visible: onPositive != null,
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: onNegative == null ? 0 : 12,
                          ),
                          child: DesignButton(
                            child: DesignText.body1('Button 1')
                                .bold
                                .overideColor(DesignColors.white),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
