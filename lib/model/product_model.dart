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
  String? status;
  String? dueDate;
  String? deliverCancel;
  String? deliveredDate;
  String? product;
  String? orderDate;
  String? expirationDate;
  String? contactNumber;
  String? uid;
  String? id;

  NewOrderModel({
    this.status,
    this.dueDate,
    this.deliverCancel,
    this.deliveredDate,
    this.customerName,
    this.product,
    this.orderDate,
    this.expirationDate,
    this.contactNumber,
    this.uid,
    this.id,
  });

  factory NewOrderModel.fromMap(Map<String, dynamic> data) => NewOrderModel(
      status: data['status'],
      deliverCancel: data['deliverCancel'],
      deliveredDate: data['deliveredDate'],
      dueDate: data['dueDate'],
      customerName: data['customerName'],
      product: data['product'],
      orderDate: data['orderDate'],
      expirationDate: data['expirationDate'],
      uid: data["uid"],
      id: data['id'],
      contactNumber: data['contactNumber']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "customerName": customerName,
        "product": product,
        "orderDate": orderDate,
        "expirationDate": expirationDate,
        "contactNumber": contactNumber,
        "status": status,
        "dueDate": dueDate,
        "deliverCancel": deliverCancel,
        "deliveredDate": deliveredDate,
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
