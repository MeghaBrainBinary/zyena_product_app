class ProductModel {
  String? name;
  String? id;

  ProductModel({this.name, this.id});

  factory ProductModel.fromMap(Map<String, dynamic> data) =>
      ProductModel(name: data['name'], id: data['id']);

  Map<String, dynamic> toMap() => {'name': name, 'id': id};
}

class NewOrderModel {
  String? customerName;
  String? product;
  String? orderDate;
  String? expirationDate;
  String? contactNumber;
  String? uid;

  NewOrderModel({
    this.customerName,
    this.product,
    this.orderDate,
    this.expirationDate,
    this.contactNumber,
    this.uid,
  });

  factory NewOrderModel.fromMap(Map<String, dynamic> data) => NewOrderModel(
      customerName: data['customerName'],
      product: data['product'],
      orderDate: data['orderDate'],
      expirationDate: data['expirationDate'],
      uid: data["uid"],
      contactNumber: data['contactNumber']);

  Map<String, dynamic> toMap() => {
        "customerName": customerName,
        "product": product,
        "orderDate": orderDate,
        "expirationDate": expirationDate,
        "contactNumber": contactNumber,
      };
}

class OrderListModel {
  String? id;
  String? customerName;
  String? productName;
  String? orderDate;
  String? deliveryDate;
  String? contactNumber;

  OrderListModel({
    this.id,
    this.customerName,
    this.productName,
    this.orderDate,
    this.deliveryDate,
    this.contactNumber,
  });
  factory OrderListModel.fromMap(Map<String, dynamic> data) => OrderListModel(
      id: data['id'],
      customerName: data['customerName'],
      productName: data['productName'],
      orderDate: data['orderDate'],
      deliveryDate: data['deliveryDate'],
      contactNumber: data['contactNumber']);

  Map<String, dynamic> toMap() => {
        'id': id,
        "customerName": customerName,
        "productName": productName,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,
        "contactNumber": contactNumber
      };
}
