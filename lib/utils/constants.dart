import 'package:flutter/material.dart';

class Constants {
  static const appName = 'Opulizer';
  static const port = ':8080';
  static const verticalSpacerBox = SizedBox(height: 5);
  static const horizontalSpacerBox = SizedBox(width: 5);
  static const bottomAxisLabel = 'Time';
  static const leftAxisLabel = 'Probabilty';
  static const startTooltipMessage =
      'Tap this button to start\ngenerating data for the chart';
  static const stopTooltipMessage =
      'Tap this button to stop\ngenerating data for the chart';
  static const invalidStopTapMessage =
      'Data not generating yet!\nTap play button and follow on-screen instructions';
  static const ipInputDialogTitle =
      'ENTER THE IP OF THE MACHINE\nON WHICH JAR IS DEPLOYED';
  static const ipInputTextFieldLabel = 'IP Address';
  static const submitButtonLabel = 'Submit';
  static const yesOpinionGuideLabel = 'yes';
  static const noOpinionGuideLabel = 'no';
  static const noDataToShowMessage =
      'No data for the chart to show.\nTap me to know more';
  static const unknownErrorMessage =
      'Some unknown error occured, please try again';
  static const checkInternetMessage =
      'Check your internet connection\nand IP address, then retry\nStill not resolved?\nPlease wait while we look into it\nThank you for your patience';
  static const enterValidIpMessage = 'Please enter a valid IP address';
}
