import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class LocationPicker extends StatefulWidget {
  TextEditingController destinationController;
  LocationPicker({super.key, required this.destinationController});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: FlutterLocationPicker(
              initPosition:
              const LatLong(31.2006115, 29.9140125),
              showSelectLocationButton: false,
              initZoom: 11,
              minZoomLevel: 5,
              maxZoomLevel: 16,
              trackMyPosition: true,
              onError: (e) => print(e),
              onPicked: (pickedData) {
                widget.destinationController.text = "";
                for (var n
                in pickedData.addressData.entries) {
                  if (n.key == 'city' || n.key == 'country') {
                    if (widget.destinationController.text == '') {
                      widget.destinationController.text =
                      "${n.value}";
                    } else {
                      widget.destinationController.text =
                      "${widget.destinationController.text}, ${n.value}";
                    }
                  }
                }
              },
              onChanged: (pickedData) {
                widget.destinationController.text = "";
                for (var n
                in pickedData.addressData.entries) {
                  if (n.key == 'city' || n.key == 'country') {
                    if (widget.destinationController.text == '') {
                      widget.destinationController.text =
                      "${n.value}";
                    } else {
                      widget.destinationController.text =
                      "${widget.destinationController.text}, ${n.value}";
                    }
                  }
                }
              }),
        ),
      ],
    );
  }
}
