import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reputation_dashboard/models/bounty.dart';
import 'package:reputation_dashboard/models/person.dart';

class ReputationAPI {
  static Future<List<SuperteamPersonModel>?> getPersonDetails() async {
    print('Fetching Everyone Details from API');
    final res = await http.get(
        Uri.parse('https://reputation-backend-production.up.railway.app/xp'));
    if (res.statusCode == 200) {
      final resbody = jsonDecode(res.body);

      final ppl = resbody['personData']
          .map<SuperteamPersonModel>(
              (p) => SuperteamPersonModel.fromJson(p as Map))
          .toList();
      // print("ppl => ${ppl.length}");
      return ppl;
    } else {
      print(
          'getEveryoneDetails :: ERROR OCCURED DURING NETWORK REQUEST => ${res.statusCode}');
      return null;
    }
  }
}
