import 'package:http/http.dart' as http;
import 'package:leetcodestats/Modal/Contests/codechef_contest_modal.dart';
import 'package:leetcodestats/Modal/Contests/codeforces_contest_modal.dart';
import 'package:leetcodestats/Modal/Contests/leetcode_contest_modal.dart';
import 'package:leetcodestats/Modal/Profiles/codechef_modal.dart';
import 'package:leetcodestats/Modal/Profiles/codeforces_modal.dart';
import 'dart:convert';

import 'package:leetcodestats/Modal/Profiles/leetcode_stats_modal.dart';


//https://codestats.onrender.com/api/codeforces/keahavgogia8 api endpoint for others https://codestats.onrender.com/api/{platform}/{username}
class ApiHelper{

	static Future<LeetcodeStats> getLeetcodeData(String username) async {
		LeetcodeStats stats = LeetcodeStats();
		http.Response response;

		response = await http
		.get(Uri.parse("https://codestats.onrender.com/api/leetcode/" + username));

		var data = jsonDecode(response.body.toString());
		stats.fromJson(data);
		return stats;
	}

	static Future<Codeforces> getCodeforcesData(String username) async {
		Codeforces stats = Codeforces();
		http.Response response;

		response = await http
		.get(Uri.parse("https://codestats.onrender.com/api/codeforces/" + username));

		var data = jsonDecode(response.body.toString());
		stats.fromJson(data);
		return stats;
	}

	static Future<CodeChef> getCodechefData(String username) async {
		CodeChef stats = CodeChef();
		http.Response response;

		response = await http
		.get(Uri.parse("https://codechef-api.vercel.app/" + username));

		var data = jsonDecode(response.body.toString());
		stats.fromJson(data);
		return stats;
	}

	static Future<LeetcodeContest> getLeetcodeContests() async{
		LeetcodeContest leetcodeContest=LeetcodeContest();
		http.Response response;

		response=await http
		.get(Uri.parse("https://contest-hive.vercel.app/api/leetcode"));

		var data=jsonDecode(response.body.toString());
		leetcodeContest.fromJson(data);
		return leetcodeContest;
	}

	static Future<CodeforcesContest> getCodeforcesContests() async{
		CodeforcesContest contest=CodeforcesContest();
		http.Response response;

		response=await http
		.get(Uri.parse("https://contest-hive.vercel.app/api/codeforces"));

		var data=jsonDecode(response.body.toString());
		contest.fromJson(data);
		return contest;
	}

	static Future<CodeChefContest> getCodechefContests() async{
		CodeChefContest contest=CodeChefContest();
		http.Response response;

		response=await http
		.get(Uri.parse("https://contest-hive.vercel.app/api/codechef"));

		var data=jsonDecode(response.body.toString());
		contest.fromJson(data);
		return contest;
	}
}