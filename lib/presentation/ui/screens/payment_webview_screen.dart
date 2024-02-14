import 'dart:developer';
import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../state_holder/main_bottom_nav_controller.dart';
import 'main_bottom_nav_screen.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({super.key, required this.url});

  final String url;

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            const CenterCircularProgressIndicator();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            log('url:$url');
            if (url.contains('PaymentSuccess')) {
              log('status:$url');
              // Get.offAll(() => const MainBottomNavScreen());
              // Get.find<MainBottomNavController>().backToHome();
              paymentSuccess();
            } else if (url.contains('PaymentFail')) {
              log('status:$url');
              // Get.offAll(() => const MainBottomNavScreen());
              // Get.find<MainBottomNavController>().backToHome();
              //
              paymentFaield();
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: WebViewWidget(
          controller: _webViewController,
        ));
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Payment'),
    );
  }

  void paymentSuccess() {
    Navigator.pop(context);
    Get.snackbar('Payment successful', 'Your order has been confirmed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.greenAccent.shade200,
        colorText: Colors.white
        );
    Get.offAll(() => const MainBottomNavScreen());
    Get.find<MainBottomNavController>().backToHome();
    // Get.find<CartListController>().getCartList();
  }

  void paymentFaield() {
    Navigator.pop(context);
    Get.snackbar('Payment Failed', 'Product Order Cancel',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade300,
      colorText: Colors.white
      );
    Get.offAll(() => const MainBottomNavScreen());
    Get.find<MainBottomNavController>().backToHome();
    //  Get.find<CartListController>().getCartList();
  }
}
