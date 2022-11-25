import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/providers/parent_details_provider/parent_detail_provider.dart';
import 'package:flutter_template/ui/parent_details/parent_details_secondary.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/app_colors.dart';

class ParentDetailPrimary extends StatefulWidget {
  const ParentDetailPrimary({Key? key}) : super(key: key);

  @override
  State<ParentDetailPrimary> createState() => _ParentDetailPrimaryState();
}

class _ParentDetailPrimaryState extends State<ParentDetailPrimary> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var dobController = TextEditingController();
  var emailController = TextEditingController();
  var relationshipController = TextEditingController();
  bool isAgree = false;

  Future<void> _parentData() async {
    String name = nameController.text.trim();
    String phone = dobController.text.trim();
    String dob = dobController.text.trim();

    String email = emailController.text.trim();
    String relationship = relationshipController.text.trim();
    ParentResponseModel parentResponseModel =
        ParentResponseModel(name: name, phone: phone, dob: dob, email: email, relationship: relationship);
    var provider = Provider.of<ParentDetailProvider>(context, listen: false);
     provider.postData(parentResponseModel);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ParentDetailsSecondary()),
      );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<ParentDetailProvider>(
        builder: (context, data, child) {
          return data.loading
          ? const Center(child: CircularProgressIndicator())
      :Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.40),
              // gradient: LinearGradient(
              //   colors: _colors,
              //   stops: _stops,
              //
              //
              // ),
            ),
            child:  SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: context.heightPx * 70,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: context.heightPx * 49),
                                  child: SvgPicture.asset(Assets.icons.iconBackarrow),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    addParentDetails,
                                    style: const FontData().montFont70020TextStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 46),
                                margin: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  primaryContact,
                                  style: const FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 16,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 56),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: TextFormField(
                                controller: nameController,
                                style: FontData().montFont500TextStyle,
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                                  ),

                                  hintText: name,

                                  //make hint text
                                  hintStyle: FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 16,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 56),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor,
                                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: TextFormField(
                                controller: phoneController,
                                style: FontData().montFont500TextStyle,
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                                  ),

                                  hintText: phoneno,

                                  //make hint text
                                  hintStyle: FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 56),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: TextFormField(
                                controller: dobController,
                                style: FontData().montFont500TextStyle,
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                                  ),

                                  hintText: dob,

                                  //make hint text
                                  hintStyle: FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 56),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor,
                                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: TextFormField(
                                controller: emailController,
                                style: FontData().montFont500TextStyle,
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                                  ),

                                  hintText: email,

                                  //make hint text
                                  hintStyle: FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 56),
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBgColor,
                                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: TextFormField(
                                controller: relationshipController,
                                style: FontData().montFont500TextStyle,
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),

                                  hintText: relationship,

                                  //make hint text
                                  hintStyle: FontData().montFont500TextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                // _parentData();
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ParentDetailsSecondary()));
                              },
                              child: Container(
                                height: context.heightPx * 42,
                                width: context.widthPx * 280,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.themeColor,
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      save,
                                      // _display ? "hide logo" : "display logo",
                                      style: const FontData().montFont70016TextStyle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),);},),);
  }
}
