import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/register_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PRegister extends StatefulWidget {
  const PRegister({super.key});

  @override
  State<PRegister> createState() => _PRegisterState();
}

class _PRegisterState extends State<PRegister> {
  Country? _selectedCountry;
  List workTypeList = [];
  String? selectType;
  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    final controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(false, AppStrings.jeveuxTitle),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Stack(
          children: [
            Column(
              children: [
                CustomTextField(
                    hintText: 'Full Name',
                    controller: controller.nameController),
                const SizedBox(
                  height: 16,
                ),
                numberTextField(),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: 'Email address',
                    controller: controller.emailController),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: 'City', controller: controller.cityController),
                const SizedBox(
                  height: 16,
                ),
                workTypeDropDown(),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 23),
                  child: customBtn('Next', Colors.black, Colors.white, () {
                    Get.toNamed(MyRouter.pBankDetails);
                  }),
                )),
          ],
        ),
      ),
    );
  }

  workTypeDropDown() {
    return Container(
      height: 47,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff79747E))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: const GetText(
                text: 'Work type',
                size: 16,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: Color(0xff79747E)),
            items: workTypeList.map((e) {
              return DropdownMenuItem(
                  value: e,
                  child: GetText(
                      text: e.toString(),
                      size: 16,
                      fontFamily: popionsMedium,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff79747E)));
            }).toList(),
            onChanged: (val) {}),
      ),
    );
  }

  numberTextField() {
    return Container(
      height: 47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff79747E))),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _onPressedShowBottomSheet();
            },
            child: Container(
              width: 100,
              height: 47,
              padding: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Color(0xff79747E)))),
              child: Row(
                children: [
                  _selectedCountry == null
                      ? Container()
                      : Image.asset(
                          _selectedCountry!.flag,
                          package: countryCodePackageName,
                          height: 20,
                          width: 20,
                        ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    _selectedCountry == null
                        ? ""
                        : _selectedCountry!.callingCode.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff79747E),
                        fontFamily: popionsMedium),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 17,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
              child: TextFormField(
            cursorColor: const Color(0xff79747E),
            decoration: const InputDecoration(
                hintText: 'Mobile Number',
                hintStyle: TextStyle(
                    color: Color(0xff79747E),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: popionsMedium),
                border: InputBorder.none),
          ))
        ],
      ),
    );
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}
