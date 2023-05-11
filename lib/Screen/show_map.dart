import 'package:eshopmultivendor/Helper/Color.dart';
import 'package:eshopmultivendor/Helper/Session.dart';
import 'package:eshopmultivendor/Helper/String.dart';
import 'package:eshopmultivendor/Helper/map.dart';
import 'package:eshopmultivendor/Model/OrdersModel/OrderModel.dart';
import 'package:eshopmultivendor/Screen/Media.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  Order_Model model;
  final String? distance;
  ShowMap(this.model, this.distance);

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  bool live = false;
  double sLat = 0, sLng = 0, dLat = 0, dLng = 0;
  String? status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.model.itemList != null && widget.model.itemList!.length > 0) {
      if (widget.model.latitude != null) {
        sLat = double.parse(widget.model.latitude!);
      }
      if (widget.model.longitude != null) {
        sLng = double.parse(widget.model.longitude!);
      }
      if (widget.model.itemList![0].seller_latitude != null &&
          widget.model.itemList![0].seller_latitude != "") {
        dLat = double.parse(widget.model.itemList![0].seller_latitude!);
      }
      if (widget.model.itemList![0].seller_longitude != null) {
        dLng = double.parse(widget.model.itemList![0].seller_longitude!);
      }
      if (widget.model.itemList![0].activeStatus != null &&
          widget.model.itemList![0].activeStatus!.toLowerCase() !=
              SHIPED.toLowerCase()) {
        status = "1";
      } else {
        status = "";
      }
    }
    print(LatLng(sLat, sLng));
    print(LatLng(dLat, dLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Map", context),
      body: status != null && sLat != 0
          ? MapPage(
              true,
              id: widget.model.itemList![0].deliveryBoyId != null &&
                      widget.model.itemList![0].deliveryBoyId != ""
                  ? widget.model.itemList![0].deliveryBoyId
                  : "",
              live: widget.model.itemList![0].deliveryBoyId != null &&
                      widget.model.itemList![0].deliveryBoyId != ""
                  ? true
                  : false,
              SOURCE_LOCATION: LatLng(dLat, dLng),
              DEST_LOCATION: LatLng(sLat, sLng),
              status1: status,
              zoom: 14,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width/2,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primary
        ),
        child:   Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Distance - ",
                // getTranslated(context,
                //     "PAYMENT_MTHD")! +
                //     " - ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: black, fontSize: 14),
              ),
              Text(
                widget.distance != null || widget.distance != ''?
                widget.distance.toString()
                    : '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: black, fontWeight: FontWeight.w600, fontSize: 16),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
