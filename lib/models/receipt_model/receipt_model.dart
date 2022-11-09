class ReceiptModel {
  List<Data>? data;

  ReceiptModel({this.data});

  ReceiptModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? receiptId;
  String? employeeName;
  String? orderDate;
  List<ProductDetail>? productDetail;
  int? totalPrice;
  double? vat;
  double? sumTotal;
  int? cash;

  Data(
      {this.receiptId,
      this.employeeName,
      this.orderDate,
      this.productDetail,
      this.totalPrice,
      this.vat,
      this.sumTotal,
      this.cash});

  Data.fromJson(Map<String, dynamic> json) {
    receiptId = json['receiptId'];
    employeeName = json['employeeName'];
    orderDate = json['orderDate'];
    if (json['productDetail'] != null) {
      productDetail = <ProductDetail>[];
      json['productDetail'].forEach((v) {
        productDetail!.add(new ProductDetail.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    vat = json['vat'];
    sumTotal = json['sumTotal'];
    cash = json['cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiptId'] = this.receiptId;
    data['employeeName'] = this.employeeName;
    data['orderDate'] = this.orderDate;
    if (this.productDetail != null) {
      data['productDetail'] =
          this.productDetail!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['vat'] = this.vat;
    data['sumTotal'] = this.sumTotal;
    data['cash'] = this.cash;
    return data;
  }
}

class ProductDetail {
  int? productId;
  String? productName;
  int? amount;
  int? productPrice;

  ProductDetail(
      {this.productId, this.productName, this.amount, this.productPrice});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    amount = json['amount'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['amount'] = this.amount;
    data['productPrice'] = this.productPrice;
    return data;
  }
}
