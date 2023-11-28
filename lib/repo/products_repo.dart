
import 'package:http/http.dart' as http;

import '../Models/datamodel.dart'; // Add this import

class ProductRepo {
  Future<List<DataModel>> getProducts() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
            print("Data Get");
      List<DataModel> dataModels = dataModelFromJson(response.body);
      return dataModels; 
    } else {
      throw Exception("Failed to load Product");
    }
  }
}
