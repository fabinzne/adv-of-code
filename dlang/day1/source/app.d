import std.algorithm;

int measure(immutable int acc, immutable int previous, int[] n) {
	if (n.length == 0) {
		return acc;
	}

	if(n[0] <= previous) {
		return measure(acc, n[0], remove(n, 0));
	}

	return measure(acc + 1, n[0], remove(n, 0));
}

int[] group(int[] n, int[] res) {
	int[] result = res;

	if(n.length > 2) {
		result ~= n[0] + n[1] + n[2];

		return group(remove(n, 0), result);
	}

	return result;
}


void main() {
	import std.file;
	import std.conv;
	import std.stdio;

	int[] n;

	foreach (line; File("input.txt").byLine()) {
		n ~= (to!int(line));
	}

	auto s = group(n, []);

	int x = measure(0, s[0], s);

	writeln(x);
}
