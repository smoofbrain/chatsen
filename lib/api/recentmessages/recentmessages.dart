import 'dart:convert';

import 'package:http/http.dart' as http;

class RecentMessages {
  static Future<List<String>> channel(String channelName) async {
    try {
      final response = await http.get(
        Uri.parse('https://recent-messages.robotty.de/api/v2/recent-messages/$channelName'),
        headers: {
          'User-Agent': 'Chatsen/2.0 (Mobile; Twitch Client; https://github.com/chatsen/chatsen)',
        },
      );
      if (response.statusCode == 200) {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        return List<String>.from(responseJson['messages'] ?? []);
      }
    } catch (e) {
      print('Error fetching recent messages: $e');
    }
    return [];
  }
}