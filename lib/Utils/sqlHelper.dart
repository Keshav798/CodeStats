import 'package:sqflite/sqflite.dart'as sql;

class SqlHelper{
	static Future<void> create_table(sql.Database databse) async{
		//paraemeter of tables
		await databse.execute("""CREATE TABLE users (
			user_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
			user_name TEXT NOT NULL,
			leetcode TEXT,
			codeforces TEXT,
			codechef TEXT

			) """);
	}

	static Future<sql.Database> openDB() async{
		return sql.openDatabase(
			"codestats.db",
			version: 1,
			onCreate: (sql.Database databse,int version) async{
				create_table(databse);
				print("created databse and table");
			}
			);
	}

	static Future<int> create_user(String name,String leetcode,String codeforces,String codechef)async{
		final db=await SqlHelper.openDB();
		final data={"user_name" : name, "leetcode" : leetcode,"codeforces" : codeforces,"codechef" : codechef};

		final id=await db.insert("users", data,
			conflictAlgorithm: sql.ConflictAlgorithm.replace);
		print("created");
		return id;
	}

	static Future<List<Map<String,dynamic>>> get_users() async{
		final db=await SqlHelper.openDB();
		return db.query("users",
			orderBy: "user_id");

	}

	static Future<List<Map<String,dynamic>>> get_user(int id) async{
		final db=await SqlHelper.openDB();
		return db.query("users",
				where: "user_id = ?",
				whereArgs: [id]
			);
	}

	static Future<int> update_user(int id,String name,String leetcode,String codeforces,String codechef) async{
		final db=await SqlHelper.openDB();

		final data={
			"user_name" : name,
			"leetcode" : leetcode,
			"codeforces" : codeforces,
			"codechef" : codechef
		};

		final result=await db.update("users", 
			data,
			where: "user_id = ?",
			whereArgs: [id]
			);

		return result;
	}

	static Future<void> delete_user(int id) async{
		final db=await SqlHelper.openDB();

		await db.delete("users",
			where: "user_id = ?",
			whereArgs: [id]
			);
	}
}