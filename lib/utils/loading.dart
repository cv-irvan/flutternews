part of 'importutils.dart';

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Container(
            color: Colors.white.withOpacity(0.5),
            child: Center(
              child: Image.asset(
                'assets/bumi.gif',
                width: 70,
                height: 70,
              ),
            ),
          ),
        );
      });
}
