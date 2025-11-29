selection = 0;
scroll = 0;
test = 1;
y = 12;
merits = ["One small step for man", "One giant leap for mankind", "So close...", "...how'd you manage that?", "Some like it hard", "Places to go, people to see", "Tailfeather Studios enjoyer", "Like and subscribe", "Chaos, chaos!", "I can do anything!", "Close call", "Humpty Dumpty", "Better safe than sorry"];
merit_descriptions = ["Beat the game.", "Beat the game perfectly (no deaths, all coins and big coins.)", "Die after reaching the last checkpoint with no deaths.", "Die in an obscure or hard to reach place.", "Using cheats, inhibit Lily's abilities, then beat the game.", "Beat the game in less than ten minutes.", "Read the entire About Us section without fast forwarding.", "Subscribe to any level from the Workshop.", "Survive Chaos Mode.", "Get a perfect run in Chaos Mode. Good luck!", "Get very close to spikes without dying to them.", "Fall from a great height.", "Have Lily use the toilet during the tutorial."];
merit_locked = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1];
if (test == 0)
{
	array_delete(merits, 7, 1);
	array_delete(merit_descriptions, 7, 1);
	array_delete(merit_locked, 7, 1);
}
