import std.stdio;
import std.string;
import std.conv;
import std.array;
import std.algorithm;
import std.uni : lineSep, paraSep, nelSep;
import std.utf : decode;
import std.math;

class Report
{
	int[] levels;
	bool ascending;

	// These are essentially assertions that are run
	// every time an instantiation of this class is
	// created or destroyed
	invariant
	{
		assert(levels.length > 1);
	}

	// Constructor
	this(string line)
	{
		line = line.chomp();
		auto nbr_strs = line.split(" ");
		auto mapped = nbr_strs.map!(a => a.to!int).array();
		this.levels = mapped;

		write(mapped, "\n");
		write(mapped[0], "\n");

		this.ascending = (mapped[0] - mapped[1]) < 0;
		if (this.ascending) {
			write("ascending");
		}

		write("\n\n");
	}

	bool is_safe()
	{
		writeln("testing");
		foreach (i, int lvl; this.levels) {
			if (i == 0) {
				continue;
			}

			auto prev = this.levels[i-1];
			int diff = prev - lvl;
			writeln("got diff: ", diff);
			
			if (abs(diff) < 1 || abs(diff) > 3) {
				writeln("too big diff");
				return false;
			}

			if (this.ascending) {
				if (diff > 0) {
					return false;
				}
			} else {
				if (diff < 0) {
					return false;
				}
			}
		}

		writeln("Safe!");

		return true;
	}
}

void main()
{
	auto f = File("../inputs/d2.txt", "r");
	string line;
	int sum = 0;

	while ((line = f.readln()) !is null) {
		Report rep = new Report(line);
		sum += rep.is_safe();
	}
	writeln("got sum:", sum);
}
