class ProductModel {
  String? name;
  String? id;

  ProductModel({this.name, this.id});

  factory ProductModel.fromMap(Map<String, dynamic> data) =>
      ProductModel(name: data['name'], id: data['id']);

  Map<String, dynamic> toMap() => {'name': name, 'id': id};
}

class NewServiceModel {
  String? id;
  String? serviceCustomerName;
  String? serviceDate;
  String? serviceRemark;
  String? serviceContactNumber;
  String? serviceStatus;
  String? serviceUid;

  NewServiceModel({
    this.id,
    this.serviceCustomerName,
    this.serviceDate,
    this.serviceRemark,
    this.serviceContactNumber,
    this.serviceStatus,
    this.serviceUid,
  });

  factory NewServiceModel.fromMap(Map<String, dynamic> data) => NewServiceModel(
        id: data['id'],
        serviceCustomerName: data['serviceCustomerName'],
        serviceDate: data['serviceDate'],
        serviceRemark: data['serviceRemark'],
        serviceContactNumber: data['serviceContactNumber'],
        serviceStatus: data['serviceStatus'],
        serviceUid: data['serviceUid'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "serviceCustomerName": serviceCustomerName,
        "serviceDate": serviceDate,
        "serviceRemark": serviceRemark,
        "serviceContactNumber": serviceContactNumber,
        "serviceStatus": serviceStatus,
        "serviceUid": serviceUid,
      };
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
  String? serviceCustomerName;
  String? serviceDate;
  String? serviceRemark;
  String? serviceContactNumber;

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
        contactNumber: data['contactNumber'],
      );

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
        "uid": uid,
      };
}
