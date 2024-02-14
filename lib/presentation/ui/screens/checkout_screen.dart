import 'package:cafty_bay/presentation/ui/screens/payment_webview_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/create_invoice_controller.dart';
import '../widgets/center_circular_progress_indicator.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: GetBuilder<CreateInvoiceController>(
          builder: (createInvoiceController) {
        if (createInvoiceController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        final invoiceWrapper =
            createInvoiceController.paymentMethodListModel.data!.first;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Payable: ${invoiceWrapper.payable}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  '+VAT: ${invoiceWrapper.vat}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Total: ${invoiceWrapper.total}',
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: invoiceWrapper.paymentMethod?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => PaymentWebView(
                            url: invoiceWrapper.paymentMethod![index]
                                .redirectGatewayURL!)
                          );
                      },
                      leading: Image.network(
                          invoiceWrapper.paymentMethod![index].logo ?? ''),
                      title:
                          Text(invoiceWrapper.paymentMethod![index].name ?? ''),
                      trailing: const Icon(Icons.arrow_forward_outlined),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
