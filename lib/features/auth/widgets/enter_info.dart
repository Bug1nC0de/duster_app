import 'package:dusterapp/features/profile/widgets/address_search.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterInfo extends ConsumerStatefulWidget {
  final String country;
  final String lng;
  final Function setStage;
  final String homeCountry;
  final String id;
  const EnterInfo({
    super.key,
    required this.country,
    required this.lng,
    required this.setStage,
    required this.homeCountry,
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EnterInfoState();
}

class _EnterInfoState extends ConsumerState<EnterInfo> {
  late final TextEditingController _name;
  late final TextEditingController _surname;
  late final TextEditingController _address;
  late final TextEditingController _cellphone;
  late final TextEditingController _idNum;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _cpassword;
  String? address;
  double _latitude = 0;
  double _longitude = 0;
  bool go = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _address = TextEditingController();
    _email = TextEditingController();
    _surname = TextEditingController();
    _cellphone = TextEditingController();
    _idNum = TextEditingController();
    _password = TextEditingController();
    _cpassword = TextEditingController();
  }

  @override
  void dispose() {
    _name.dispose();
    _surname.dispose();
    _cellphone.dispose();
    _address.dispose();
    _idNum.dispose();
    _email.dispose();
    _password.dispose();
    _cpassword.dispose();
    super.dispose();
  }

  bool? local;
  bool? female;

  createDuster() async {
    if (_address.text.isEmpty) {
      showErrorSnackBar(AppLocalizations.of(context)!.addressError, context);
    } else if (_name.text.isEmpty) {
      showErrorSnackBar(AppLocalizations.of(context)!.nameError, context);
    } else if (_surname.text.isEmpty) {
      showErrorSnackBar(AppLocalizations.of(context)!.surnameError, context);
    } else if (_email.text.isEmpty) {
      showErrorSnackBar(AppLocalizations.of(context)!.emailError, context);
    } else if (_cellphone.text.isEmpty) {
      showErrorSnackBar(AppLocalizations.of(context)!.cellPhoneError, context);
    } else if (local == null) {
      showErrorSnackBar(AppLocalizations.of(context)!.foreignOrLocal, context);
    } else if (female == null) {
      showErrorSnackBar(AppLocalizations.of(context)!.maleOrFemale, context);
    } else if (_password.text != _cpassword.text) {
      showErrorSnackBar(AppLocalizations.of(context)!.passwordError, context);
    } else {
      Coordinates coordinates = Coordinates(lat: _latitude, lng: _longitude);
      DusterModel duster = DusterModel(
        id: "1234",
        name: _name.text,
        surname: _surname.text,
        cellphone: _cellphone.text,
        email: _email.text,
        postCode: '',
        address: _address.text,
        coordinates: coordinates,
        country: widget.country,
        verified: false,
        readyToWork: false,
        local: local!,
        female: female!,
        idNum: _idNum.text,
      );
      widget.setStage(3, duster, _password.text);
    }
  }

  setLocal({required bool x}) {
    setState(() {
      local = x;
    });
  }

  setFemale({required bool x}) {
    setState(() {
      female = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _name,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterName,
              labelText: AppLocalizations.of(context)!.enterName,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          TextField(
            controller: _surname,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterSurname,
              labelText: AppLocalizations.of(context)!.enterSurname,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          TextField(
            controller: _cellphone,
            autocorrect: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterCell,
              labelText: AppLocalizations.of(context)!.enterCell,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          TextField(
            controller: _idNum,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterIdNum(widget.id),
              labelText: AppLocalizations.of(context)!.enterIdNum(widget.id),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          SizedBox(
            width: 400,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue, width: 3),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => AddressSearch(
                          setAddress: (newAddress, lat, lng) {
                            setState(() {
                              _address.text = newAddress;
                              _longitude = lng;
                              _latitude = lat;
                            });
                          },
                          country: widget.country,
                          lng: widget.lng,
                        ),
                    fullscreenDialog: true,
                  ),
                );
              },
              child:
                  _address.text.isEmpty
                      ? Text(
                        AppLocalizations.of(context)!.enterAddressDetails,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                      : Text(
                        _address.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
            ),
          ),
          const SizedBox(height: 18.0),
          TextField(
            controller: _email,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterEmail,
              labelText: AppLocalizations.of(context)!.enterEmail,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.password,
              labelText: AppLocalizations.of(context)!.password,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _cpassword,
            onChanged: (value) {
              if (value.length > 7) {
                setState(() {
                  go = true;
                });
              } else {
                setState(() {
                  go = false;
                });
              }
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.confirmPassword,
              labelText: AppLocalizations.of(context)!.confirmPassword,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style:
                      female == false
                          ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          )
                          : ElevatedButton.styleFrom(),
                  onPressed: () {
                    setFemale(x: false);
                  },
                  child: Text(AppLocalizations.of(context)!.male),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style:
                      female == true
                          ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          )
                          : ElevatedButton.styleFrom(),
                  onPressed: () {
                    setFemale(x: true);
                  },
                  child: Text(AppLocalizations.of(context)!.female),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style:
                      local == true
                          ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          )
                          : ElevatedButton.styleFrom(),
                  onPressed: () {
                    setLocal(x: true);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.local(widget.homeCountry),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style:
                      local == false
                          ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          )
                          : ElevatedButton.styleFrom(),
                  onPressed: () {
                    setLocal(x: false);
                  },
                  child: Text(AppLocalizations.of(context)!.foreign),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          go
              ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: createDuster,
                child: Text(
                  AppLocalizations.of(context)!.upload,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              )
              : Text(
                "Please make sure your password is longer than 7 characters",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ],
      ),
    );
  }
}
