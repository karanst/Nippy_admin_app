import 'package:eshopmultivendor/Helper/String.dart';

class OrderItem {
  String? id,
      name,
      qty,
      price,
      subTotal,
      status,
      image,
      varientId,
      isCancle,
      activeStatus,
      isReturn,
      isAlrCancelled,
  packagingCharge,
      isAlrReturned,
      rtnReqSubmitted,
      varient_values,
      attr_name,
      sellerMobile,
      productId,
      storeName,
      curSelected,
      deliveryBoyId,
      deliveryBoyName,
      deliverBy;
  String? seller_latitude,seller_longitude;
  List<String?>? listStatus = [];
  List<String?>? listDate = [];

  OrderItem(
      {this.qty,
      this.id,
      this.name,
      this.price,
        this.seller_latitude,this.seller_longitude,
        this.deliveryBoyName,
      this.subTotal,
        this.sellerMobile,
      this.status,
        this.storeName,
      this.image,
      this.varientId,
      this.activeStatus,
      this.listDate,
      this.listStatus,
      this.isCancle,
      this.isReturn,
      this.isAlrReturned,
      this.isAlrCancelled,
        this.packagingCharge,
      this.rtnReqSubmitted,
      this.attr_name,
      this.productId,
      this.varient_values,
      this.curSelected,
      this.deliveryBoyId,
      this.deliverBy});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    List<String?> lStatus = [];
    List<String?> lDate = [];

    var allSttus = json[STATUS];
    for (var curStatus in allSttus) {
      lStatus.add(curStatus[0]);
      lDate.add(curStatus[1]);
    }
    return new OrderItem(
        id: json[Id],
        qty: json[Quantity],
        name: json[Name],
        seller_latitude:  json['seller_latitude'],
        seller_longitude:  json['seller_longitude'],
        activeStatus: json[ActiveStatus],
        image: json[IMage],
        price: json[Price],
        subTotal: json[SubTotal],
        varientId: json[ProductVariantId],
        listStatus: lStatus,
        status: json[ActiveStatus],
        curSelected: json[ActiveStatus],
        listDate: lDate,
        isCancle: json[IsCancelable],
        isReturn: json[IsReturnable],
        isAlrCancelled: json[IsAlreadyCancelled],
        packagingCharge: json['container_price'],
        isAlrReturned: json[IsAlreadyReturned],
        rtnReqSubmitted: json[ReturnRequestSubmitted],
        attr_name: json[AttrName],
        productId: json[ProductId],
        varient_values: json[VariantValues],
        storeName: json["store_name"],
        sellerMobile: json["seller_mobile"],
        deliveryBoyName: json["delivery_boy_name"],
        deliveryBoyId: json[Delivery_Boy_Id],
        deliverBy: json[DeliverBy]);
  }
}
