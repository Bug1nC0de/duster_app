import 'dart:async';
import 'dart:convert';

import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AddressSearch extends ConsumerStatefulWidget {
  final Function setAddress;
  final String country;
  final String lng;
  const AddressSearch({
    super.key,
    required this.setAddress,
    required this.country,
    required this.lng,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressSearchState();
}

class _AddressSearchState extends ConsumerState<AddressSearch> {
  final String apiKey = dotenv.env['GOOGLE_API_KEY'].toString();
  late final TextEditingController code;
  final _address = TextEditingController();
  bool showAdS = true;
  dynamic _addressData;
  String? newAddress;
  double _latitude = 0;
  double _longitude = 0;
  bool submitting = false;
  Timer? _dbounce;

  toggleADS() {
    if (widget.country != "enZa") {
      setState(() {
        showAdS = false;
      });
    }
  }

  @override
  void initState() {
    code = TextEditingController();
    toggleADS();
    super.initState();
  }

  void getSuggestion(String value) async {
    String region =
        widget.country == "enZa"
            ? "za"
            : widget.country == "enGb"
            ? "uk"
            : widget.country;

    String sessionToken = const Uuid().v4();
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final request = Uri.parse(
      '$baseURL?input=$value&key=$apiKey&components=country:$region&sessiontoken=$sessionToken',
    );

    var response = await http.get(request);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['predictions'];
      if (mounted) {
        setState(() {
          _addressData = jsonResponse;
        });
      }
    } else {
      throw Exception('Your code sux');
    }
  }

  handleOnAddressTap({required String placeId, required String address}) async {
    final places = GoogleMapsPlaces(apiKey: apiKey);
    PlacesDetailsResponse response = await places.getDetailsByPlaceId(placeId);
    if (response.status == "OK") {
      final lat = response.result.geometry!.location.lat;
      final lng = response.result.geometry!.location.lng;
      setState(() {
        _address.text = address;
        newAddress = address;
        _latitude = lat;
        _longitude = lng;
        _addressData = null;
      });
    }
  }

  getPostCode() async {
    final country = widget.country;
    if (country == "enGb") {
      final jam = await ref
          .read(authControllerProvider.notifier)
          .findUkPostCode(code: code.text, lng: widget.lng, context: context);

      if (jam != null) {
        final jamCode = jam['postcode'];
        final longitude = jam['longitude'];
        final latitude = jam['latitude'];
        setState(() {
          code.text = jamCode;
          _latitude = latitude;
          _longitude = longitude;
          showAdS = true;
        });
      }
    } else {
      final jam = await ref
          .read(authControllerProvider.notifier)
          .findEuPostCode(
            code: code.text,
            country: country,
            lng: widget.lng,
            context: context,
          );
      if (jam != null) {
        final jamCode = jam['postcode'];
        final longitude = jam['longitude'];
        final latitude = jam['latitude'];
        setState(() {
          code.text = jamCode;
          _latitude = latitude;
          _longitude = longitude;
          showAdS = true;
        });
      }
    }
  }

  addNewAddress() {
    final lat = _latitude;
    final lng = _longitude;
    widget.setAddress(newAddress, lat, lng);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const BackButton(color: Colors.black),
        title: Text(AppLocalizations.of(context)!.aboutAddress),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.country != "enZa"
                  ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: code,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.enterPostCode,
                            labelText:
                                AppLocalizations.of(context)!.enterPostCode,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: getPostCode,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.findPostCode,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                  : SizedBox(),
              const SizedBox(height: 15),
              if (showAdS)
                TextField(
                  controller: _address,
                  autofocus: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (_dbounce?.isActive ?? false) _dbounce!.cancel();
                      _dbounce = Timer(const Duration(milliseconds: 500), () {
                        getSuggestion(value);
                      });
                    } else {
                      setState(() {
                        _addressData = [];
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.typeAddress,
                    labelText: AppLocalizations.of(context)!.typeAddress,
                  ),
                ),
              _addressData != null
                  ? _addressData!.isEmpty
                      ? Text(AppLocalizations.of(context)!.typeAddress)
                      : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _addressData!.length,
                        itemBuilder: (context, index) {
                          final result = _addressData![index];
                          final placeId = result['place_id'];
                          final address = result['description'];

                          return ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.pin_drop),
                            ),
                            title: Text(result['description']),
                            onTap: () async {
                              handleOnAddressTap(
                                placeId: placeId,
                                address: address,
                              );
                            },
                          );
                        },
                      )
                  : const Text(''),
              if (newAddress != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "Confirm address",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.green),
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: addNewAddress,
                        child: Text(newAddress!),
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
