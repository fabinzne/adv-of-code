module part1;

int measure(immutable int acc, immutable int previous, int[] n) {
		import std.algorithm;
	
		if (n.length == 0) {
			return acc;
		}

		if(n[0] <= previous) {
			return measure(acc, n[0], remove(n, 0));
		}

		return measure(acc + 1, n[0], remove(n, 0));
}


// void main() {
// 	import std.file;
// 	import std.conv;
// 	import std.stdio;

// 	int[] n;

// 	foreach (line; File("input.txt").byLine()) {
// 		n ~= (to!int(line));
// 	}

// 	int x = measure(0, n[0], n);

// 	writeln(x);
// }
