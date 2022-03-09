# Midterm Project: Wolf Pack Ecosystem

## Concept #

### Description ##

Wolf Pack Ecosystem revolves around the survival of its three actors (alpha, his pack, and rabbits).

### Ecosystem actors ##

My ecosystem consists of three actors: alpha (wolf), his pack, and rabbits (prey).

1. <b>Alpha</b> - alpha is the leader of the pack. There can be only one alpha in the pack. It is the biggest and fastest of all the actors in the ecosystem. Alpha has an age value (which is essentially a “years in service” value) that increments by one every 5 seconds. Age value has a maximum limit at 50, after reaching which the alpha dies. It moves at maximum speed up until it reaches the age value of 35. From this point on, as it gets older, it’s speed decreases. It also has nutritional needs. The alpha is in a constant pursuit of food. It has a food points value, which has a maximum value of 100. When it reaches the maximum in food points value, the alpha gives birth to the new pack member.
2. <b>Wolf pack</b> - the wolf pack follows the alpha. Wolf pack members are generated of random size, which is later used to determine the new alpha (the biggest one gets elected).
3. <b>Rabbits</b> - rabbits freely run around the ecosystem. When two rabbits cross paths, they have a chance of producing another rabbit. It is determined at random whether they will have 1, 2 or 0 offsprings from this short interaction. When their total amount in the ecosystem is less than 7, they start seeking each to reproduce. If it is higher than 7, they are not eager to interact with another rabbit. When a wolf is in close proximity, a rabbit runs away in an opposite direction at a higher speed. When it feels safe, the rabbit moves at a constant speed in a random direction. 

### Scenarios / Ecosystem logic ##

**Alpha / Pack relationship**

Alpha leads its pack and dictates the direction in which the pack is moving (pack is attracted to alpha).

**Alpha / Rabbits relationship**

Alpha is in constant search of rabbits to consume (alpha is attracted to rabbits). Rabbits are running away from the alpha in the fear of being killed.

**Pack / Rabbits relationship**

The pack does not interact with the rabbits, because the alpha is the only one with nutritional needs. In case of overlap or collision nothing happens.

**Death of Alpha**

Alpha can die of two causes: malnutrition (reaching bottomline food score value) and old age (reaching maximum age limit). Every 5 seconds 2 points are deducted from alpha's food point value. Every 5 seconds alpha gets older by 1 point. 

**Sustaining and increasing the pack size**

Each time an alpha dies, a new alpha is chosen from the pack (consequently, pack size decreases by one). In order to balance it out, an alpha has an ability to “give birth”. When the alpha fulfills the food requirement to the max, a new pack member is added to the pack. So essentially it searches for the best conditions to reproduce in (best condition in this case is having enough food stock). After “giving birth”, alpha’s food score is decreased to its default value.

**Alpha fights**

Alphas do not show signs of aggression towards one another or neighboring packs, because they are too preoccupied with reaching their nutritional goal.

## Process #

Collision function was a base for a number of functionalities in my ecosystem. It took quite some time to figure it out, but eventually I have got it sorted by creating a distance function, which calculates the distance between two points. Using this function have made it easier for me to build a function that wold check for collisions. 

The distance function was also helpful in finding rabbits within the reach of alpha, so that the alpha could choose a pray to follow and direct its head at it (rotation). 

From this point, I have run into the problem when creating more rabbits. When two rabbits would interact with each other they multiplied the total number of rabbits in the ecosystem by itself, instead of increasing it by one. This issue was resolved by randomizing the possibility of getting an offspring. Decreasing the chance of it from 100 to 66 percent cleared out the issue.

As I was wrapping up on implementing the functionality for the ecosystem, I have came to a conclusion that it would make more sense for me to store information about the pack inside of the Alpha class as alpha's actions directly impacted the pack and the pack did not do anything on their one. Before that I had both of them separate, as I was considering expanding pack's functionality. 

## Interesting observations / things I have learnt #



## References #

In the making of this ecosystem I have been extensively refering to the lecture notes, The Nature of Code, and the processing reference page.


