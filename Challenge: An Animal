The player is in the Garden.

extStorage is a container.

Fruit is a kind of thing. An apple is a kind of fruit. Status is a kind of value. The statuses are whole and chopped. An apple has a status. The description of an apple is "Juicy!"

An apple core is a kind of thing. There are six apple cores in extStorage. The description of an apple core is "Seeds and rind. Useless for pie."

Does the player mean doing something to the apple core:
	it is very unlikely.

When play begins:
	say "It[']s the golden hour of morning. You are Jimmy Buckets, practicing your baseball swing in the garden when your mother calls out from the kitchen window to you... 'Jimmy! I[']m baking an apple pie, but I forgot to buy apples! Run over to the Orchard for me and see if you can find any on the old apple tree.'[paragraph break]You[']re a good kid. Why don[']t you get on that...";

Greed is a scene. Greed begins when play begins. Greed ends when six apples are in extStorage.

When Greed ends:
	say "Now the only apple tree in the orchard is bare, and no apples remain. Looks like your mother will never get to make that apple pie.";
	end the story.

The black-dog response rule is listed after the report stage rule in the specific action-processing rules.

This is the black-dog response rule:
	follow the observation rules.
	
The observation rules is a rulebook.

An observation rule for dropping something in the presence of the black dog:
	if the noun is the beef jerky:
		say "The dog barks. 'Oh man, beef jerky. Sweet!'";
	otherwise:
		say "The dog shakes its head. 'Littering ain't cool.'";

An observation rule for putting a whole apple on the counter in the presence of mother for the first time:
	say "'Do you think you could chop it for me? There should be a knife in the drawer there.'";

Attacking it with is an action applying to two things.

Understand "attack [something] with [something]" or "hit [something] with [something]" or "beat [something] with [something]" or "bash [something] with [something]" or "smash [something] with [something]" as attacking it with.
Understand "swing [bat] at [something]" as Attacking it with (with nouns reversed).

A weapon is a kind of thing. The baseball bat and the knife are weapons.

Instead of attacking the black dog with a weapon:
	say "The dog looks up as if people to preempt your thoughts (yes, dogs can look up) 'Holy heck, what's wrong with you?' it says."
	
Instead of attacking the tree with a weapon (called the weapon of choice):
	if the tree is upright:
		if the weapon of choice is the baseball bat:
			if the tree holds something:
				let X be a random thing held by the tree;
				move X to the orchard;
				say "CRACK![paragraph break]You swing the bat hard into the trunk of the tree. An [X] falls to the ground.";
			otherwise:
				say "CRACK![paragraph break]You swing the bat hard into the trunk of the tree.";
		otherwise if the weapon of choice is the knife:
			say "It takes a long old time, but eventually you manage to cut down the tree with the kitchen knife.";
			now the tree is fallen;
	otherwise:
		say "It's already felled. Doing any more would just be beating a dead tree.";
		
Instead of cutting the tree with the knife:
	try attacking the tree with the knife instead.
	
Cutting it with is an action applying to two things.

Understand "cut [something] with [something]" as cutting it with.
Understand "chop [something] with [something]" as cutting it with.

Check cutting it with:
	if the player does not carry the knife:
		say "How do you intend on cutting it?" instead;
	otherwise if the second noun is chopped:
		say "It[']s already chopped.";

Instead of cutting something:
	if the player carries the knife:
		try cutting the noun with the knife instead;
	continue the action;

Carry out cutting an apple (called the current apple) with:
	say "You chop the apple.";
	now the current apple is chopped.
	
Every turn:
	if a chopped apple is on the counter:
		if the Orchard gate is open:
			say "[paragraph break]Hours pass and the sweet aroma of cooking apples fills the house. Your mother takes the pie from the oven and places it on the windowsill to cool. Your stomach rumbles, impatiently awaiting a slice. [if the Orchard gate is open]Then you hear your mother scream. You run into the garden to find the black dog, licking clean the empty pie tray...[paragraph break]'Mm-mm,' he says. 'That was delicious'.[paragraph break]A sitcom laugh track plays out.[otherwise]And then the time comes... Your mother calls. You bolt down the stairs to the kitchen and there it is, sitting out on a plate, still steaming hot; a slice of apple pie. You smile, grab a fork, and...[paragraph break]Roll curtain. Credits.";
		end the story;

The Orchard is a room. "A fenced off lot where the old orchard used to grow. It's uncared for now, and most of the trees have died away."

The Orchard Gate is a door. It is west of the Orchard and east of the Garden. "A gate to the [if the player is in the orchard]west[otherwise if the player is in the garden]east[end if] leads to [if the player is in the orchard]your garden[otherwise if the player is in the garden]the Orchard[end if].";

The tree is a thing in the orchard. It is a supporter. The tree can be upright or fallen. The tree is upright. There are six apples on it.

Instead of taking something that is on the tree:
	if the tree is upright:
		say "It's too high. You[']ll have to find a way to get them down." instead;
	continue the action;
	
Instead of putting something on the tree:
	say "You toss [the noun] into the tree. It rattles through the branches and lands back on the ground.";
	now the noun is in the orchard.

The black dog is an animal in the orchard. "A black dog is basking in the sun[if Dog Distracted is happening], chowing down on some beef jerky[end if]. It is scrawny, with matted fur." The description of the dog is "A mangy black mutt. He[']s hanging out by the ol['] apple tree. [if Dog Distracted is not happening]You[']ll have to find some way to distract him if you want to get at those juicy apples[otherwise]He[']s distracted by the beef jerky. You might be able to grab an apple or two if you[']re quick[end if].";

Dog Distracted is a scene. Dog Distracted begins when the beef jerky is in the Orchard.

Instead of giving something to the black dog:
	try dropping the noun instead.
	
Instead of taking the beef jerky in the presence of the black dog:
	say "The dog growls. 'Nuh-uh,' it says. 'I[']m eating that.'"
		
Instead of doing something to the tree in the presence of the black dog while Dog Distracted is not happening:
	say "The dog barks. 'Woof woof, motherbrother. Keep away from my dang tree.'";
	
Instead of doing something to an apple in the presence of the black dog while Dog Distracted is not happening:
	say "The dog barks. 'Woof woof, motherbrother. Keep away from my dang tree.'";
		
The Garden is a room. "The garden of your house. It smells like freshly cut grass."

The Kitchen is a room.

The kitchen door is a door. It is inside from the garden and outside from the kitchen. "The kitchen door leads [if the player is in the garden]inside[otherwise if the player is in the kitchen]outside[end if]."

The baseball bat is in the garden. The description of the bat is "A wooden bat. It has the word 'Slugger' engraved."

Mother is a woman in the kitchen. "Your mother is preparing an apple pie, only she doesn't have any apples."

Instead of giving or showing an apple to mother:
	say "Hey, thanks. Just put it on the counter for me, will you?";

The counter is a supporter in the kitchen. The beef jerky is on the counter. The drawer is a part of the counter. It is a closed openable container. In the drawer is the knife.

Instead of eating an apple (called current apple):
	say "You bite into the apple; crunchy and sweet.";
	now the current apple is in extStorage;
	let x be a random apple core in extStorage;
	move x to the player;

Instead of attacking an apple (called current apple) with the baseball bat:
	say "You toss the apple into the air and swing the bat. A thud. The apple explodes into wet fragments.";
	now the current apple is in extStorage;
