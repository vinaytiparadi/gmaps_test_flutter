
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLatLangToAddress> createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GMap Stuff'), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 60,
              width: 250,
              child: FilledButton(onPressed: ()async{
                print('here');
                // List<Placemark> placemarks = await placemarkFromCoordinates(18.47653, 73.82057);
                // print(placemarks[2]);

                List<Location> locations = await locationFromAddress("Bhagirathi Shevaya Kurdaya, Pune");
                print(locations.toString());

              }, child: Icon(Icons.change_circle)),
            ),
          )
        ],
      ),
    );
  }
}
