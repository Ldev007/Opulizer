extension ResponseHandler on int {
  String parseStatusCode() {
    if (this >= 400 && this <= 499) {
      return 'Oops! Something went wrong on your end, please check your network and try again';
    } else if (this <= 500 && this <= 599) {
      return 'Ah! Something went wrong on our end, please try again in a bit.\nSorry for the inconvenience!';
    } else {
      return 'Some unknown error occured, please try again after sometime';
    }
  }
}
