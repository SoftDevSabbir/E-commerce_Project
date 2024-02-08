import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/add_product_review_controller.dart';
import '../utility/app_colors.dart';

class AddProductReviewScreen extends StatefulWidget {
  const AddProductReviewScreen({super.key, required this.productId});
  final int productId;
  @override
  State<AddProductReviewScreen> createState() => _AddProductReviewScreenState();
}

class _AddProductReviewScreenState extends State<AddProductReviewScreen> {
  final TextEditingController ratingTEController = TextEditingController();
  final TextEditingController describtionTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //actions: [Icon(Icons.arrow_back_ios)],
        title: const Text("Create Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 150),
                TextFormField(
                  controller: ratingTEController,
                  decoration: const InputDecoration(hintText: 'Rating'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (String? text) {
                    if (text!.isEmpty == true) {
                      return 'Give a star';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: describtionTEController,
                  decoration: const InputDecoration(hintText: 'Description'),
                  textInputAction: TextInputAction.next,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  validator: (String? text) {
                    if (text!.isEmpty == true) {
                      return 'Write Describtion';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                GetBuilder<AddProdutReviewController>(
                    builder: (addProdutReviewController) {
                      if(addProdutReviewController.showReviewListInProgress){
                        return const CenterCircularProgressIndicator();
                      }
                  return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final response =
                                 await addProdutReviewController.CreateReview(
                                      describtionTEController.text.trim(),
                                      widget.productId,
                                      int.parse(ratingTEController.text));

                              if (response) {
                                Get.showSnackbar(
                                  const GetSnackBar(
                                    title: 'Thank you',
                                    message:
                                    'Your cart added',
                                    backgroundColor: AppColors
                                        .primaryColor,
                                    duration:
                                    Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                Get.showSnackbar(
                                  const GetSnackBar(
                                    title: 'cart failed!',
                                    message: 'Something went wrong',
                                    backgroundColor:
                                    Colors.redAccent,
                                    duration:
                                    Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text("Submit")));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    ratingTEController.dispose();
    describtionTEController.dispose();
  }
}
