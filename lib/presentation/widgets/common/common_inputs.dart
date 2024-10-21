import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/promoion_model.dart';
// import 'package:momoOrder/dashboard/model/promo_model.dart';
// import 'package:sizer/sizer.dart';

class NumberInput extends StatefulWidget {
  const NumberInput({super.key, required this.prf});
  final ProdListModel prf;

  @override
  // ignore: library_private_types_in_public_api
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  TextEditingController ctl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctl.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      child: Center(
        child: Container(
          width: Get.width * 0.5,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  controller: ctl,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  // inputFormatters: <TextInputFormatter>[
                  //   // WhitelistingTextInputFormatter.digitsOnly
                  // ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: InkWell(
                        child: const Icon(
                          Icons.arrow_drop_up,
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(ctl.text);
                          setState(() {
                            currentValue++;
                            ctl.text =
                                (currentValue).toString(); // incrementing value
                            widget.prf.addQty =
                                double.parse(ctl.text.toString());
                          });
                        },
                      ),
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.arrow_drop_down,
                        size: 18.0,
                      ),
                      onTap: () {
                        int currentValue = int.parse(ctl.text);
                        setState(() {
                          // print("Setting state");
                          currentValue--;
                          ctl.text = (currentValue > 0 ? currentValue : 0)
                              .toString(); // decrementing value
                          widget.prf.addQty = double.parse(ctl.text.toString());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
