import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemModel {
  static Future<List<dynamic>> fetchItems() async {
    try {
      // Make a GET request to the API endpoint
      final response = await http.get(Uri.parse('http://10.0.2.2:8080/items'));

      // Check if the response status code is successful (200)
      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final List<dynamic> jsonData = json.decode(response.body);

        // Return the parsed JSON data (list of items)
        return jsonData;
      } else {
        // If the response status code is not successful, throw an exception
        throw Exception('Failed to fetch items');
      }
    } catch (error) {
      // If an error occurs during the HTTP request, catch it and print the error message
      print('Error fetching items: $error');

      // Return an empty list as a fallback
      return [];
    }
  }
}
