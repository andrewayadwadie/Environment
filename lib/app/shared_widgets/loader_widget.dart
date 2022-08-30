import 'package:enivronment/presentation/resources/color_manager.dart';
import 'package:enivronment/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.primary
            ],

            /// Optional, The color collections
            strokeWidth: 1,

            /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.white.withOpacity(0.1),

            /// Optional, Background of the widget
            pathBackgroundColor: Colors.white.withOpacity(0.1)

            /// Optional, the stroke backgroundColor
            ),
      ),
    );
  }
}
