"Adeline" by Jake Milner

Release along with cover art ("Adeline").

The story genre is "Fiction". The story creation year is 2018.

Include Secret Doors by Gavin Lambert.
Include Glulx Text Effects by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Room Description Control by Emily Short.
Include Tailored Room Description by Emily Short.

Volume - Rules

Chapter - Dwelling On

[A system to change the current year of perspective]
Dwelling on is an action applying to one number.

Understand "dwell on [a number]" as dwelling on.
Understand "the year is [a number]" as dwelling on.

The year is a number that varies.

To set the tense:
	if the year is less than 1994:
		now the story tense is past tense;
	if the year is greater than 1993:
		now the story tense is present tense;
		
Check dwelling on:
	let yearCheck be the number understood;
	if there is a class of yearCheck in the Table of Memories:
		instead say "[the memory corresponding to a class of yearCheck in the Table of Memories]";
	otherwise if yearCheck is less than 1900:
		instead say "I'm not so good at history.";
	otherwise if yearCheck is less than 1970:
		instead say "I wasn[']t even born then.";
	otherwise if yearCheck is less than 1988:
		instead say "I was just a kid then. We didn[']t meet until 1987.";
	otherwise if yearCheck is greater than 2054:
		instead say "I don[']t expect to live that long.";
	
Table of Memories
class	memory
1970	"The year I was born. [line break]"
1987	"[']87 was the year we first met. I was house-sitting for the Reed's and I[']d given the key to Eric--to invite a few guys over. It must have been gone dark before I got in--it was after practice, and--I could hear the music from two streets over. The place was trashed. I was fucked. It was totally trashed. There must have been forty--fifty people in there. She was alone in the kitchen, drinking coffee. The only one who could string three words together."
1988	"I took her to a beach out on the east coast. It was raining and the sky was overcast with wild black clouds. All the stores on the waterfront were closed and boarded up, and we sat in the car parked up at the water[']s edge watching waves crash up on the sand and wash back out again. We fucked in the car and then drove home again."
1989	"I didn[']t know anything about buying an apartment. I never even looked at my bank account to think about if I could afford something like that, but she filled in all the paperwork and the next thing I know we[']re loading up everything we own--which was not much--into boxes and a moving van."

Carry out dwelling on:
	now year is the number understood;
	set the tense;
	set the scope;
	if the year is 1992:
		now the past bed is unmade;
	otherwise if the year is not 1992:
		now the past bed is made;
	if windowIsFixed is true:
		if year is less than WindowFixedYear:
			now the window is closed;
	say line break;
	move the player to the Apartment;
	
Section - Rules for Scope

[Things need to only exist in play when they are required]
To decide whether (n - a number) is between (x - a number) and (y - a number):
	let lowest be x;
	let highest be y;
	if x is greater than y:
		let lowest be y;
		let highest be x;
	if n is less than lowest, decide no;
	if n is greater than highest, decide no;
	decide yes;
	
[If the current year is between the arrival and the parting, then the item will be present]
A thing has a number called arrival.
A thing has a number called parting.

Limbo is a container.

Definition: a thing is non-player if it is not the player and it is not Limbo.

To set the scope:
	now every non-player thing is in Limbo;
	repeat with item running through things in Limbo:
		if the year is between the arrival of the item and the parting of the item:
			let N be 0;
			repeat through Table of Movements in reverse point order:
				if interactor entry is item and point entry is year:
					now the item is in status entry;
					now N is 1;
				if interactor entry is item and point entry is less than year and N is 0:
					now the item is in status entry;
					now N is 1;
			
Chapter - Movements

[Things that are opened in one year, are also opened in previous years. Need to fix this]

[Need to keep track of the placement of every item in each year, so if an item is moved in one year, it is moved in FUTURE years, but not PAST years.]
After dropping, throwing, or eating a thing (called the interacted-object):
	add interacted-object to movements;
	continue the action;
	
After putting something (called the interacted-object) on something:
	add interacted-object to movements;
	continue the action;
	
After inserting something (called the interacted-object) into something:
	add interacted-object to movements;
	continue the action;
	
To add (item - a thing) to movements:
	let N be 0;
	let Y be the year;
	repeat through the Table of Movements:
		if interactor entry is item and point entry is Y:
			now the status entry is the holder of the item;
			now N is 1;
	if N is 0:
		choose a blank row in the Table of Movements;
		now interactor entry is item;
		now point entry is Y;
		now status entry is the holder of the item;

Table of Movements
interactor (a thing)	point (a number)	status (object)
toolbox	1	cupboard
screwdriver	1	toolbox
--	--	--
with 1200 blank rows.

Chapter - When Play Begins

When play begins:
	now left hand status line is "[location]";
	now right hand status line is "[year]";
	now the story tense is present tense;
	now the story viewpoint is first person singular;
	[record the initial location of every object so we can put it back later]
	repeat with item running through things enclosed by the apartment:
		choose a blank row in Table of Movements;
		now the interactor entry is the item;
		now the point entry is the arrival of the item;
		now the status entry is the holder of the item;
	now year is 1994;
	set the scope;
	move the player to the apartment, without printing a room description;
		
Before printing the banner text:
	say "[italic type]The year is 1994, but it doesn[']t have to be...[roman type][paragraph break][bold type]To change the year, give the command:[roman type][line break]  >THE YEAR IS 199X[paragraph break][italic type]If you are stuck, type 'HINT'[roman type][paragraph break]";
	
After printing the banner text:
	say line break;
		
[Debug --
Instead of jumping:
	showme the contents of Table of Movements;
--]
	
[Keep the player in a blank space while the game begins]
INTRO is a room. The printed name is "". The player is in INTRO.
	
Chapter - Extra Styles

Table of User Styles (continued)
style name	relative size	color	background color
special-style-1	0	"#F6F6F6"	"#1D1313"
special-style-2	-1	"#FF4E50"	"#E1F5C4"

[FF4E50, E1F5C4, 343838, 1D1313]

Chapter - Priority Ranking

[Set the priority for locale description]
A ranking rule for the aquarium: increase the description-rank of the aquarium by 100.
A ranking rule for the window: increase the description-rank of the window by 95.
A ranking rule for the present bed: increase the description-rank of the present bed by 90.
A ranking rule for the 92bed: increase the description-rank of the 92bed by 90.
A ranking rule for the past bed: increase the description-rank of the past bed by 90.
A ranking rule for the moving boxes: increase the description-rank of the moving boxes by 60.
A ranking rule for the fridge: increase the description-rank of the fridge by 55.
A ranking rule for the kitchen counter: increase the description-rank of the kitchen counter by 50.
A ranking rule for the cupboard: increase the description-rank of the cupboard by 40.
A ranking rule for the nightstand: increase the description-rank of the nightstand by 30.
A ranking rule for the doorDescriptor: increase the description-rank of the doorDescriptor by 10.
A ranking rule for the front door: increase the description-rank of the front door by 10.
A ranking rule for the real door: increase the description-rank of the real door by 10.
A ranking rule for the stain: increase the description-rank of the stain by 2.
A ranking rule for the hole: increase the description-rank of the hole by 2.
A ranking rule for Adeline: increase the description-rank of Adeline by 1.
A ranking rule for the deer: increase the description-rank of the deer by 1.

A ranking rule for the fish: increase the description-rank of the fish by 99.
A ranking rule for the filter: increase the description-rank of the filter by 99.

A ranking rule for a thing (called the moveable thing):
	if the moveable thing is on a bed:
		increase the description-rank of the moveable thing by 89;
	if the moveable thing is in the moving boxes:
		increase the description-rank of the moveable thing by 59;
	if the moveable thing is in the fridge:
		increase the description-rank of the moveable thing by 54;
	if the moveable thing is on the counter:
		increase the description-rank of the moveable thing by 49;
	if the moveable thing is in the cupboard:
		increase the description-rank of the moveable thing by 39;
	if the moveable thing is on the nightstand:
		increase the description-rank of the moveable thing by 29;

Volume - The Apartment

The Apartment is a room. "[if the year is greater than 1996]There[']s nothing here. It[']s like you are floating in water. In a black hole.[otherwise]The year is [year]. Our apartment off the high street on fourth and west.[end if]". The printed name is "Apartment on Fourth and West".

Chapter - The Aquarium

[The Aquarium is the highest described object because it sets the lighting for the room]
The Aquarium is a transparent container in the apartment. "[if it is the past]The room was lit by the ambient blue light of our aquarium. It was lively with ghost fish, and the filter gave off a constant low electrical hum.[otherwise if it is the present]The room is lit by the ambient glow of an aquarium.[otherwise if it is the future and filterIsFixed is false]The light on the aquarium is flickering a muted reflection through the filth in the water.[otherwise if it is the future and fishFed is false]The room is lit by the ambient glow of our aquarium.[otherwise]The room is lit by the ambient blue glow of our aquarium.[end if]". The description is "[if it is the past]I made a real big deal about buying the fish. She didn't really want them, but she ended up taking care of them anyway.[otherwise if it is the present]It[']s green with dirt. The fish are bloating about, unable to keep their balance. Tilting and hitting into the glass wall. Their mouths opening and closing like they are gasping for air. The filter is grinding a sound like broken teeth.[otherwise if it is the future and filterIsFixed is false]All the fish are dead.[otherwise if it is the future and fishFed is false]All the fish are dead.[otherwise]The fish are doing okay.[end if]". The arrival is 1991. The parting is 1996.

The filter is part of the Aquarium. The description is "[if it is the past]It[']s running smoothly.[otherwise if it is the present and filterIsFixed is false]It[']s screwed closed with a front plate. I[']ll need a tool if I want to take a look at it.[otherwise if it is the present and filterIsFixed is true]It[']s running smoothly.[otherwise if it is the future and filterIsFixed is false]It[']s totally broken down.[otherwise if it is the future and filterIsFixed is true]It[']s running smoothly.[end if]". The arrival is 1991. The parting is 1996.

[If there is time maybe flesh this out properly -- remove the fish into a bathtub, replace the filter etc.]
[You need to go back in time to create something that you can use to move the fish into the bathtub.]

[Only fix the filter once]
filterIsFixed is a truth state that varies. filterIsFixed is false.

Instead of fixing the filter with the screwdriver:
	if it is the past:
		instead say "She always kept the filter running smoothly.";
	otherwise if it is the future and filterIsFixed is false:
		say "No point. All the fish are dead.";
	otherwise if it is the future and filterIsFixed is true:
		say "It's already running smoothly. Better to leave it alone now.";
	otherwise if filterIsFixed is false:
		say "The filter is caked with dirt and grime, it hasn[']t been changed out in a long time. ";
		now filterIsFixed is true;
		now the size of the hole is size of the hole - 1;
	otherwise:
		say "I already fixed the filter.";

Some fish are in the Aquarium. The arrival is 1991. The parting is 1996. The description is "[if it is the past]We bought ghostfish because we thought they looked cool. The skin is lucid; they look like little skeleton fish bouncing back and forth around the tank.[otherwise]They[']ve been living off the scum in the water. I[']m surprised they[']ve made it this long, but that says something about their resilience; trapped in this tank of their own filth with nowhere to go but bounce off the walls.[end if]".

[The player can feed the fish]		
Feeding is an action applying to one visible thing.

Understand "feed [something]" as feeding.

Check feeding:
	if the noun is not the fish:
		say "It d[if it is the past]id[otherwise if it is the present]oes[end if]n[']t need feeding." instead;
	if the player is not carrying the can:
		say "I ha[if it is the past]d[otherwise if it is the present]ve[end if] to find the fish food first.";
		
fishFed is a truth state that varies. fishFed is false.

Carry out feeding:
	if it is the past:
		say "I sprinkled some food into the aquarium.";
	if it is the present and filterIsFixed is false:
		say "There[']s no point. The filter is already broken. Better to let them die." instead;
	if it is the present and filterIsFixed is true and fishFed is false:
		say "I sprinkle some food into the aquarium.";
		now the size of the hole is size of the hole - 1;
		now fishFed is true;
	otherwise if it is the present and filterIsFixed is true and fishFed is true:
		say "I sprinkle some food into the aquarium.";
	otherwise if it is the future and filterIsFixed is false:
		say "There[']s no point. The fish are all dead.";
	otherwise if it is the future and filterIsFixed is false and fishFed is false:
		say "There[']s no point. The fish are all dead.";
	otherwise if it is the future and filterIsFixed is true and fishFed is true:
		say "I sprinkle some food into the aquarium.";


Chapter - The Window

The window is a door. "Some perma-atmosphere leak[if it is the past]ed[otherwise]s[end if] in through the window in the west wall. The spillage of street lights and car headlights blowing past, and the screen billboard across the way flickering colours over the walls." It is west from the apartment and east from high street. The description is "[if the year is between 1990 and 1993]The window gave a view of Fourth and West. A row of street level storefronts; a restaurant, an arcade, an electronics place, and the entrance to the train station. There were always people; any time of day. Our apartment was opposite an advertisement display monitor the size of a cinema screen that was hooked to the outer wall of the apartment building across the street. It would loop adverts for coke, VHS players, and men[']s razors. I didn[']t think it would be a problem at first, but the constant light took it[']s toll on my sanity.[otherwise if the year is 1994]The window gives a view of Fourth and West. A row of street level storefronts; a restaurant, an arcade, an electronics place, and the entrance to the train station. A street performer is playing jazz music and the sound of it drifts up some. Anb advertisement display monitor the size of a cinema screen is rigged up to the outer wall of the apartment building across the street. I didn[']t think it would be a problem at first, but the constant light took it[']s toll on my sanity.[otherwise if the year is greater than 1994]It[']s fogged with dirt. I can barely see anything through it anymore. Just shapes and moving colours.[end if][if windowIsFixed is false] The latch is broken off at the hinge. We never could open it. I[']d meant to fix it, but I just never got around to it.[end if]". The arrival is 1. The parting is 1996.

Instead of searching the window:
	try examining the window instead;
	
[Suicide is not an option]
Instead of climbing the window:
	try entering the window.
	
Instead of going through the window:
	say "I can[']t say never thought about it. But it didn[']t happen that way."
	
Instead of going through the closed window:
	say "It[']s closed. [if windowIsFixed is false]The latch is broken at the hinge."
	
Before opening the window while windowIsFixed is true:
	if year is less than windowFixedYear:
		instead say "The window hasn[']t been opened in years. You try, one more futile attempt to push it open, but it doesn[']t move. It[']s jammed at the latch.";

Instead of opening the window while windowIsFixed is false:
	say "The window hasn[']t been opened in years. You try, one more futile attempt to push it open, but it doesn[']t move. It[']s jammed at the latch.";
	
Understand "climb through [something]" as climbing. Understand "jump through [something]" as climbing.

Chapter - Telephone

[If there is time, add a "Dial 0 for Voicemail" command] 

A telephone is a kind of thing. Understand "phone" or "telephone" as a telephone.

A phone number is a kind of value. 999-9999 specifies a phone number.

Understand "dial [phone number] on [telephone]" as dialing it on. Understand "dial [phone number] on [something]" as dialing it on. 

Understand the commands "phone" or "telephone" or "call" as "dial".

Understand "call [text]" or "phone [text]" or "dial [text]" or "telephone [text]" as a mistake ("That's not a number you know.").

Dialing it on is an action applying to one phone number and one thing.

Check dialing it on:
	if the phone is carried by a non-player person:
		say "Adeline was using the phone.";
		
[We only want the player to be able to order the tools once.]
toolsOrdered is a truth state that varies. toolsOrdered is false.
		
Carry out dialing 535-6510 on the phone:
	if toolsOrdered is false:
		say "We didn[']t really have the money for it, but I called up and ordered the tools we needed to fix up the apartment. If I didn[']t, we[']d probably waste the money on pizza and fast food.";
		now toolsOrdered is true;
		now the arrival of the toolbox is year + 1;
		now the parting of the toolbox is 1996;
		now the arrival of the screwdriver is year + 1;
		now the parting of the screwdriver is 1996;
	otherwise:
		say "I didn't need anything else from the catalogue.";

Understand "Texas Tools" as 535-6510 when the texas tools catalogue is examined.

The phone is a telephone. It is on the kitchen counter. The arrival is 1991. The parting is 1992.

Chapter - Moving Boxes

Some moving boxes are a closed openable opaque container in the apartment. "We[']d only just moved in, so there were moving boxes everywhere." The arrival is 1990. The parting is 1990.

The Texas Tools Catalogue is in the moving boxes. The description is "A mail order catalogue. The number is 535-6510. We took the catalogue because we had dreams of really making this apartment into a home. But the cost of the tools was prohibitive. When it came to putting food on the table or paint on the walls--". The arrival is 1990. The parting is 1990.

Chapter - The Cupboard and Things Within

The cupboard is a closed openable opaque container in the apartment. "Underneath the counter [if it is the past]was[otherwise]is[end if] a row of cupboards.[if the cupboard is open and the cupboard encloses something]The door is open and on a shelf inside sits [a list of things enclosed by the cupboard].[end if]". It is fixed in place. The arrival is 1. The parting is 1996.

The toolbox is a closed openable opaque container in Limbo. The description is "[if windowIsFixed is false]I bought the tools because she wanted me to fix the window. But I never did get around to it.[end if]I d[if it is the past]id[otherwise]o[end if]n[']t even know what half of these tools are for." The arrival is 1. The parting is 1.

The screwdriver is in the toolbox. The arrival is 1. The parting is 1.

The can is in the cupboard. The printed name is "can of fish food". The arrival is 1991. The parting is 1994.

Understand "fish food" as the can.

[PLACEHOLDER - Make the bed, clean up trash around the apartment, wash plates.]

A bed is a kind of supporter. A bed is enterable. A bed can be made or unmade.

The present bed is a bed in the apartment. It is fixed in place. It is unmade. "Our bed is pushed up against the back wall, [if the bed is unmade]the duvet cover twisted into a heap of creases.[otherwise]the duvet neatly folded.[end if] The mattress is sunken at the space where I sleep, still to one side.". The printed name is "bed". The arrival is 1993. The parting is 1995.

[The bed is always made in the past]
The past bed is a bed in the apartment. It is fixed in place. It is made. "Our bed is pushed up against the back wall, [if the bed is unmade]the duvet cover twisted into a heap of creases.[otherwise]the duvet neatly folded.[end if]". The printed name is "bed". It is made. The arrival is 1990. The parting is 1991.

The 92bed is a bed in the apartment. It is fixed in place. It is unmade. "Our bed is pushed up against the back wall, the duvet cover twisted into a heap of creases. It[']s got that heavy look of use in it.". The description is "The sweaty mess of sheets was a portrait of tells that changed everything.".

Making is an action applying to one thing.

Understand "make [something]" as making.

Instead of making the present bed:
	say "I pull the cover flat across the bed and fold it over at the end. It[']s not perfect. Askew at places, unbalanced. She would have criticised it, but it is what it is. She always said that making the bed was the first step to staving off the decay. If you don't make your bed, then it's easy to excuse the other things. First you don't make your bed, then you don't brush your teeth; then you don't take out the trash, and then all of a sudden making the bed just feels pointless in amongst the swamp you are living in."

[Garbage needs to be thrown in the trash]
A trash can is an open unopenable container in the apartment. The arrival is 1990. The parting is 1994.

The fridge is a closed openable container in the apartment. It is fixed in place. "Our kitchenette is a modest cubby hole secluded at the opposite end of the apartment behind a kitchen counter. A[if the fridge is closed] closed[otherwise]n open[end if] fridge up against the back wall.[if the fridge is open] The amber light spills out and illuminates that dark corner of the apartment. On the shelf is [a list of things in the fridge].". The description is "The sound of it just added to the static in the room." The arrival is 1990. The parting is 1995.

An old pizza box is a closed openable container in the fridge. The arrival is 1994. The parting is 1995. The description is "The congealed remnants of yesteryear's pizza."

The sink is scenery in the apartment. It is an open unopenable container. It is fixed in place. The arrival is 1990. The parting is 1996.

Some dirty dishes are in the kitchen sink. The arrival is 1994. The parting is 1996. The description is "All piled up dirty plates and cutlery."

The kitchen counter is scenery in the apartment. The arrival is 1. The parting is 1996.

The nightstand is scenery in the apartment. It is fixed in place. It is a supporter. The arrival is 1992. The parting is 1996.

The photograph is on the nightstand. The description is "A photo of us at Christmas, a year after we first moved in. We[']re smiling together on the sofa; she is leaning over to kiss me on the cheek. It has [']1991['] written in the bottom corner in white marker." The arrival is 1992. The parting is 1996.

A bottle of sioux whiskey is in the apartment. The arrival is 1991. The parting is 1993. The description is "It[']s the colour of warm amber."

An empty bottle of sioux whiskey is in the apartment. The arrival is 1. The parting is 1. The description is "Good things passed through my life at times, but it felt like these leftovers of regrets were the only things that stuck around."

Instead of drinking the bottle of sioux whiskey:
	say "Before I knew it, I was holding an empty bottle. [if the year is greater than 1991]Did I think it would make me feel better? Or that I would feel nothing? It just made me feel angry, when I had no right to be.[end if]";
	now the parting of the bottle of sioux whiskey is year - 1;
	now the arrival of the empty bottle of sioux whiskey is year;
	now the parting of the empty bottle of sioux whiskey is 1996;
	now the bottle of sioux whiskey is in Limbo;
	now the player carries the empty bottle of sioux whiskey;
	now the size of the hole is the size of the hole + 1;

A porcelain figure is on the nightstand. The printed name is "porcelain deer". The arrival is 1991. The parting is 1992. The description is "She always said the deer was her spirit animal.";

A can of beer is on the kitchen counter. The arrival is 1992. The parting is 1992. The description is "There[']s lipstick smeared on the rim. I didn[']t even notice."

Instead of drinking the can of beer:
	say "Only the dregs left swilling in the bottom of the can.";

The front door is a secret door. It is revealed. It is closed and locked.  It is outside from the apartment and inside from an endless nothingness. The description is "[if it is the past]Was the door always closed like this? Even in my memory I can[']t get out from this place.[otherwise if it is the present]It[']s not like I woke up one morning and the door was like this. I don[']t know how it happened. I don[']t even remember. It[']s like I can remember the time before it was like this, and also remember the feeling like it has always been this way. Everything concrete is just swallowed up in that stretch of time and I can[']t see how it all happened anymore.[otherwise if it is the future]Maybe it will always be this way. Maybe I[']ll be here forever.[end if]". The arrival is 1990. The parting is 1996.

[Can't give the door an initial description so need to put something else in the apartment with the door's description.]
[Write some kind of rule for making sure the player can't interact with this]
doorDescriptor is in the apartment. It is fixed in place. The printed name is "nothing". "The door is faded white wood patched with blisters of peeling paint. Veins of rot seep up from the base where dark water leaks in from underneath channeling rivets of blackness through the core of the wood. The door itself gives off a static pressure that percolates into your insides, a feeling like it is tearing your heart apart by the muscle strands. You can[']t go near it.". The arrival is 1990. The parting is 1996.

The stain is a thing in the apartment. It is fixed in place. "[if it is the past]The floor is stained with blood, in the middle of the room.[otherwise if it is the present]The floor is stained with a faded mark in the middle of the room. A discoloration of the floorboards like damp seeping through the wood." The arrival is 1993. The parting is 1994. The description is "I[']d heard about people with blood on their hands, who scrubbed until their own hands bled, and never felt clean. But I didn't understand the thought until the night I had to clean this up.".

The hole is a thing in the apartment. It is fixed in place. "There is a hole in the floor, in the middle of the room, [if the year is 1995]like a gnarl punched out of the wood floorboard. It's just small enough that you can push your finger inside.[otherwise if the size of the hole is less than 4]black and endless; large enough for you to fit inside. It looks like water spiraling down into nothingness. You feel like you could fall into it and it would swallow you completely.[otherwise if the size of the hole is 4]permeating out; blackness eating at the furniture. The apartment is ankle deep in dark water; a gravity well pulling around you, disappearing down.[otherwise if the size of the hole is greater than 4] a damp rot grown across the floorboards, encompassing the room, swallowing the whole apartment until there is nothing left but a ledge of footing at the walls for you to balance on. It is a sinkhole. The apartment is waist deep in water; a riptide spiraling down into that black nothing, drawing you in.[end if]". The arrival is 1995. The parting is 1996. The description of the hole is "It doesn't go anywhere. It[']s just blackness going down. It is pure fear.". The hole has a number called size. The size of the hole is 5.

Awake is a room. The printed name is "Apartment on Fourth and West". The description is "The year is 1994. Our apartment off the high street on fourth and west."

The real door is a door in Awake. It is open. The printed name is "door". It is outside from Awake and inside from the Hallway. "The door is [if the door is open]open[otherwise]closed[end if].". The description is "It[']s just a door.";

Before going through the door while the player is in Awake:
	end the story finally;
	stop the action;

Instead of waking up:
	now the year is 1994;
	now the player is in Awake;

Chapter - Scenes

Section - 1990, Adeline

Adeline is a woman in the apartment. The arrival is 1990. The parting is 1993. "[if the year is 1990]Adeline is unpacking one of the boxes.[otherwise if the year is 1991]Adeline is here.[otherwise if the year is 1992]Adeline is holding a can of beer.[otherwise if the year is 1993]Adeline is sitting by the window smoking a cigarette and drinking a cup of coffee.[end if]". The description is "She was wearing a white tank-top vest with her hair hanging down over her shoulders. That[']s just how I remember her, when I think about how she looked. Transient details about her that just kind of drift over her body like they are in the periphery.".

Section - 1991, Fixing the Window

Adeline1990 is a text that varies.

windowIsFixed is a truth state that varies. windowIsFixed is false.
windowFixedYear is a number that varies.

The Broken Window is a recurring scene. The Broken Window begins when the year is 1991 and windowIsFixed is not true. The Broken Window ends when the year is not 1991. The Broken Window ends finally when windowIsFixed is true.

Every turn while The Broken Window is happening:
	say "[one of]She walks over to the window and wrenches at the latch.[or]'I can[']t believe we didn[']t notice this.' Adeline says.[or]'Why didn[']t we check the window to see if it opened [italic type]before[roman type] putting down a deposit on this place.'[or]Adeline tries the window one more time. 'It[']s been a year like this. This place is stuffy, there[']s no air. It[']s stifling. Do you think you could finally get around to fixing this?'[or]Adeline walks back over to the kitchenette and opens the fridge. 'Oh, for fucks-- We[']re out of root beer.'[cycling]"; 
	
Fixing it with is an action applying to two things.

Understand "fix [something] with [something]" as fixing it with.

Rule for supplying a missing second noun while fixing something with:
	if the player carries the screwdriver:
		now the second noun is the screwdriver;
	otherwise:
		say "I d[if it is the past]id[otherwise]o[end if]n[']t have anything to fix it with."

Check fixing it with:
	say "Some things can[']t be fixed."
	
To decide if it is the present:
	if the year is 1994, yes;
	no.
	
To decide if it is the past:
	if the year is less than 1994, yes;
	no.
	
To decide if it is the future:
	if the year is greater than 1994, yes;
	no.
	
Instead of fixing the window with the screwdriver:
	if windowIsFixed is false:
		say "[if it is the past]It wasn[']t a difficult job to replace the latch. I don[']t know why I put it off for so long. A little bit of grease on the hinge and the window was sliding open without a hitch.";
		now windowIsFixed is true;
		now windowFixedYear is year;
		now the size of the hole is size of the hole - 1;
	otherwise if windowIsFixed is true and year is less than WindowFixedYear:
		say "Wasn[']t it [WindowFixedYear] that I fixed the window? No. I must be misremembering. It was [year].";
		now windowFixedYear is year;
	otherwise:
		say "The window [if it is the past]wa[otherwise]i[end if]s already fixed.";

Section - 1992, The Phone

Breaking the Phone is a scene. Breaking the Phone begins when the year is 1992.  Breaking the Phone ends when the year is not 1992. Breaking the Phone ends finally when the phone is in Limbo.

[Nothing actually moves during this scene... not sure if that is good or bad.]
Every turn while Breaking the Phone is happening:
	say "[one of]She got all jazzed up in a dress to go out and see some dance act, with glitter under her eyes and everything.[or]Now the glitter was streaking down her cheeks.[or]'You son of a bitch,' she said. 'Get out. Right now. Pick up your shit and get out, I can[']t fucking see you right now.'[or]'No.' I said.[or]She screamed, something primal and grabbed a half empty beer can from the kitchen counter, and hurled it at me.[or]'Get out!' she cried, and this time she grabbed something heavier. The telephone. It came a firework across the room and burst against the wall.[cycling]";

Section - 1993, Adeline

Adeline's End is a recurring scene. Adeline's End begins when the year is 1993. Adeline's End ends when the year is not 1993.

c1993 is a number that varies. c1993 is 0.

[There isn't actually a bathroom. Maybe there should be.]
Every turn while Adeline's End is happening:
	if windowIsFixed is true and year is greater than WindowFixedYear - 1 and the window is closed and c1993 is 0:
		try Adeline opening the window;
	otherwise:
		if c1993 is 0:
			say "She exhaled a wisp of smoke [if windowIsFixed is false]against the glass.[otherwise if windowIsFixed is true and year is less than WindowFixedYear + 1 and the window is open]out of the window. 'I[']m glad you fixed this,' she says. 'The air is much clearer in here these days.'[end if]";
			now c1993 is c1993 + 1;
		otherwise if c1993 is 1:
			say "She stared quietly out of the window for a while. 'We should go back to the beach one time,' she said. 'On a quiet night, when no-one[']s there. When it[']s grey and it[']s raining. Something like that.' She put out her cigarette in the coffee mug and walked into the bathroom.";
			now c1993 is c1993 + 1;
			now Adeline is in Limbo;
		otherwise if c1993 is 2:
			say "It was quiet for a while.";
			now c1993 is c1993 + 1;
		otherwise if c1993 is 3:
			say "Then the sound of sobbing from behind the locked door.";
			now c1993 is c1993 + 1;
		otherwise if c1993 is 4:
			say "'Fine,' I said. 'Let[']s do it. Let[']s get out of here. Go across the country or--'";
			now c1993 is c1993 + 1;
		otherwise if c1993 is 5:
			say "The bathroom door opened, and she was stood standing there pale white and naked. The blood was running from her wrists. It pooled off of the tips of her fingers. She didn[']t move or speak. She was static framed in the doorway. The razor fell from her hand and landed against the floor. She stumbled forward, and fell into my arms, and I moved to catch her, but she was gone; back over by the window, smoking her cigarette.";
			now c1993 is 0;
			now Adeline is in the apartment;

[Make sure this always starts from 0 if the player leaves the scene halfway through.]
When Adeline's End ends:
	now c1993 is 0;

Section - The Deer Dream

The deer is an animal in the apartment. "A deer is stood, drinking from the damp in the floor." The arrival is 1995. The parting is 1995. The description of the deer is "It[']s eyes are reflective black.".

The House is a recurring scene. The House begins when the year is 1995. The House ends when the year is not 1995.
	
Every turn while House is happening:
	say "[one of]I wake from a bad dream. I am walking through an endless forest, and I see from behind a deer, drinking at a stream.[or]I approach the deer from behind, slowly, so as not to disturb it, but it hears me and lifts its head.[or]It turns to look at me, only now it's not a deer; it's a woman-- it's her.[or]But something about her face-- pale and white, with deep black eyes. And she smiles, and she beckons for me to follow her.[or]She walks towards the door, and disappears through it.[cycling]";
	
House Part Two is a scene. House Part Two begins when the year is 1996. House Part Two ends when the year is not 1996. House Part Two ends witnessed when the time since House Part Two began is six minutes.

When House Part Two begins:
	say "In my dream there is a derelict house.";
	
Every turn during House Part Two:
	say "[one of]And this house, buried deep in the forest. I don[']t understand why it is there, or who lives there, but I[']m drawn to it.[or]And this house is overgrown by surrounding trees; the wood panelling of the walls is moss-coated and worn. It feels wrong. And I[']m really scared.[or]I am walking up this wilted embankment of autumn leaves past the stream towards the door of the house, even though--I[']m literally shaking with anxiety. I[']m so scared--[or]--scared of what might be behind the door.[or]But I can[']t stop myself, from reaching out to open it.[or]So I reach out to open it.[cycling]";
	
Before opening the door while the year is 1996 and the size of the hole is greater than 3:
	say "The door is cut off by the hole. There[']s no way I can reach it.";
	stop the action.
	
Before opening the door while the year is 1996:
	say "The fear I feel is so overwhelming, I am struck by paralysis. But I know that this is a dream. I[']m not in control of myself. It opens, and inside is only an all encompassing blackness. I am shaking as that feeling of dread shoots into my heart. What have I done? I feel like I[']m having a heart attack. But it[']s only a dream. I know it[']s only a dream. I will [second custom style]wake up[roman type] from this. I hope.";
	now the front door is unrevealed;
	stop the action;
	
Chapter - Other Actions

[Print the description of an item when taking it for the first time.]
A thing can be examined or unexamined.

Carry out examining something:
	now the noun is examined.

After taking something unexamined:
	say "I pick[if it is the past]ed[end if] up [the noun]. [run paragraph on]";
	try examining the noun.

Instead of sleeping:
	if the year is greater than 1993:
		say "I[']m tired, but I can[']t sleep. It[']s a tiredness of the bones and muscles in my body, but the mind can[']t switch off.";
	otherwise if the year is less than 1994:
		say "I lay in bed for a while, but sleep never came easy to me.";
		
Instead of going nowhere:
	say "There[']s nowhere to go.";
	
Instead of saying sorry in the presence of Adeline:
	if the year is less than 1992:
		say "'Sorry,' I said.[paragraph break]She shook her head. 'What for?'";
	if the year is 1992:
		say "'I[']m sorry.'[paragraph break]Even as I said it, the words sounded hollow.";
	if the year is 1993:
		say "'I[']m sorry,' I said. But what I really meant was 'Don[']t leave me.'";
		
Instead of saying sorry:
	say "It[']s too late for that now."
	
[This is at the bottom so I don't have to keep scrolling past it. It doesn't actually work properly as it allows key entries to go through at the same time, but I don't really care. It's a bit of a cheesy line anyway.]
Instead of entering the hole:
	clear the screen;
	say ">[run paragraph on]";
	wait for any key;
	say "[first custom style]l[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]i[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]k[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]e[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style] [roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]w[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]a[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]t[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]e[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]r[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style] [roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]s[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]p[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]i[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]r[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]a[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]l[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]i[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]n[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]g[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style] [roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]d[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]o[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]w[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]n[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style] [roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]i[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]n[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]t[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]o[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style] [roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]n[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]o[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]t[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]h[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]i[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]n[roman type][run paragraph on]";
	wait for any key;
	say "[first custom style]g[roman type][run paragraph on]";
	end the story;
	
Instead of climbing the hole:
	try entering the hole;
	
Understand "jump into [something]" as entering.

Volume - Hints

Asking for help is an action out of world.

Understand "help" or "hint" or "hints" as asking for help.

Carry out asking for help:
	say "[one of][italic type]The year is 1994, but it doesn[']t have to be...[roman type][paragraph break][bold type]To change the year, give the command:[roman type][line break]  >THE YEAR IS 199[bracket]X[close bracket] where X is a number.[or][italic type]If you don[']t know where to start, try looking at the photograph on the nightstand.[roman type][or][italic type]You might be dwelling on the past. It[']s also possible to think about the future.[roman type][or][italic type]Sometimes memory is fragmented. Things don[']t always match up in linear time.[roman type][or][italic type]Think about how your actions in the past might affect the future.[roman type][or][italic type]Did you make your bed?[roman type][or][italic type]Did you unpack the moving boxes when you first moved in?[roman type][or][italic type]Did you fix the window? Did you feed the fish?[roman type][or][italic type]If you really want to end it, you could always give up.[roman type][or][italic type]Jump in the hole[roman type][stopping]";
