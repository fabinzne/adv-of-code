import std.conv;

//1989014

enum MoveType : string {
	UP = "up",
	DOWN = "down",
	FORWARD = "forward"
}

int[string] mapMoves(string[] moves) {
	import std.string;

	int[string] result;

	result["x"] = 0;
	result["y"] = 0;

	foreach (move; moves) {
		const currMove = move.split(" ");

		if(currMove[0] == MoveType.UP) {
			result["y"] -= to!int(currMove[1]);
		} else if (currMove[0] == MoveType.DOWN) {
			result["y"] += to!int(currMove[1]);
		} else if (currMove[0] == MoveType.FORWARD) {
			result["x"] += to!int(currMove[1]);
		}
	}

	return result;
}

void part1() {
	import std.file;
	import std.stdio;

	string[] file = [];
	
	foreach (line; File("input.txt").byLine()) {
		file ~= to!(string)(line);
	}

	int[string] result = mapMoves(file);

	writeln("Result is ", result["x"] * result["y"]);
}
