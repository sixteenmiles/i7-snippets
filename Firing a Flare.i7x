Firing is an action applying to one carried thing.

Understand "fire [the flare gun]" as firing.

Check firing:
	if the flare gun is not carried:
		say "You aren't holding anything you can fire." instead;
	if a cartridge is not inside the chamber:
		say "You pull the trigger but nothing happens. It's not loaded." instead;
		
Carry out firing:
	say "You point the flare gun to the sky and pull the trigger. It whistles into the air leaving behind a thick cloud of red chemtrail.";
	now the cartridge is nowhere;

Firing it at is an action applying to two things.

Understand "fire [the flare gun] at/into [something]" as firing it at.

Check firing it at:
	if the flare gun is not carried:
		say "You aren't holding anything you can fire." instead;
	if a cartridge is not inside the chamber:
		say "You pull the trigger but nothing happens. It's not loaded." instead;

Section - Loading and Reloading

Instead of opening the flare gun:
	try opening the chamber.
	
Instead of closing the flare gun:
	try closing the chamber.

Instead of inserting a cartridge into the flare gun:
	try inserting a cartridge into the chamber.

Instead of inserting something which is not a cartridge into the chamber:
	say "It only takes flare cartridges."
	
Understand "load [something] in/into [something]" as inserting it into.

Section - Firing in Specific Locations

Instead of firing the flare gun when the player is in the Cave:
	say "You point the flare gun into the darkness and pull the trigger.";
	now the cartridge is nowhere;
	now the burning flare is in the cave;
	the burning flare dies in 5 turns from now;
	
The burning flare is a thing. The burning flare is lit.

At the time when the burning flare dies:
	say "The burning flare fades to nothing.";
	now the burning flare is nowhere;
	
Section - Firing at Objects

Instead of firing the flare at the tree:
	say "The flare ricochets off the trunk and disappears between the trees."

The player carries a flare gun. The chamber is a closed openable container which is a part of the flare gun. Inside the chamber is a cartridge.

The Forest is a Room. "You are in a small clearing beneath a canopy of leaves." It is east of the Cave.

The Cave is a dark room. "You are in a cave."

The tree is in the Forest.
