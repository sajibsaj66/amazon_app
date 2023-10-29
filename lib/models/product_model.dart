import 'dart:html';

class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uId;
  final String selerName;
  final String selerUId;
  final int rating;
  final int numOfRating;

  ProductModel(
      {required this.url,
      required this.productName,
      required this.cost,
      required this.discount,
      required this.uId,
      required this.selerName,
      required this.selerUId,
      required this.rating,
      required this.numOfRating});
  Map<String, dynamic> getJson() {
    return {
      'name': url,
      'productName': productName,
      'cost': cost,
      'discount': discount,
      'uId': uId,
      'selerName': selerName,
      'selerUId': selerUId,
      'rating': rating,
      'numOfRating': numOfRating,
    };
  }
}
