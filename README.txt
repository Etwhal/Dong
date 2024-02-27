Author : nora_
Last Update : 23/02/2024

This is just a simple Pong created using Godot, to help me getting back into gamedev.
The game is open-source and under no license, meaning you can do whatever you want with it even monetized it idc.
If you just want to play the game, head to "Release" to download the exe file, otherwise you can download the entire
project and just re-build it if you have Godot on your computer.

------------------------------------------
	HOW TO PLAY THE GAME
------------------------------------------

The game is a 1v1 game ONLY (i mean you can play against yourself but ...) using a single controller !
The player on the left will use the left stick, and the player on the right the right stick !
I tested it using a xbox one controller, but since I was using Godot default input map, it should work with other controllers !

Aside from that, as you will see, the game first start slowly; that is because each time the ball bounce on something
(other bar or a wall), it will accelerate a little, to the point you'll not be able to keep up with it ! Once the ball scored,
its speed is reset.

You can choose between 3 duration:
- Short game (First to 3 points)
- Medium game (First to 5 points)
- Long game (First to 10 points)

In average, the game should took you no more than 10 minutes even on a long game !

------------------------------------------
	KNOWN BUGS
------------------------------------------

Its not a perfect game and Im aware of some bugs that i'll resolve in the future !

- If you hit the ball with the tip of the bar, it might trigger a lot of colission and accelerate the ball super fast !
From what i've seen, it happen nearly 100% of the time if the ball hit the bar from behind (it shouldn't be possible but
with a specific angle it can happen) !
- The way I've handle sound is BAD, like, really BAD. And im sorry, please use the mixer from your OS to directly reduce the sound
of the game. This is my main priority for the next update !

If you find others please do not hesitate to let me know !