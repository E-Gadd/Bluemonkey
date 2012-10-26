package
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	
	public class Player extends Entity
	{
		//Public references
		public static var playerX:int;
		public static var playerY:int;
		
		//Direction
		public static var direction:int;
		//1 = up, 2 = right, 3 = down, 4 = left
		
		public static var age:int;
		
		//Saving
		public static var playerinfo:SharedObject;
		
		//Graphics
		public var boy:Spritemap = new Spritemap(fileDefs.BOYgfx, 16, 16);
		public var man:Spritemap = new Spritemap(fileDefs.MANgfx, 16, 16);
		public var old:Spritemap = new Spritemap(fileDefs.OLDgfx, 16, 16);
		
		//Movement vars
		private var movespeedx:int = 0;
		private var movespeedy:int = 0;
		
		//For collisions
		private var canmoveleft:Boolean = true;
		private var canmoveright:Boolean = true;
		private var canmoveup:Boolean = true;
		private var canmovedown:Boolean = true;
		private var canmove:Boolean = true;
		
		public function Player()
		{
			loadstate();
			graphicfunc();
			setHitbox(32, 32);
			type = "player";
			layer = 100;
			
		}
		
		override public function update():void
		{
			trace(age);
			agefunc();
			saveState();
			collisions();
			super.update();
			playerX = x;
			playerY = y;
			
		}
		private function loadstate():void
		{
			playerinfo = SharedObject.getLocal("playerinfo");
			if(playerinfo.data.firstrun!=false){
			playerinfo.data.x = 400;
			playerinfo.data.y = 320;
			playerinfo.data.direction = 3;
			playerinfo.data.age = 0;
			}
			x = playerinfo.data.x;
			y = playerinfo.data.y;
			direction = playerinfo.data.direction;
			age = playerinfo.data.age;
		}
		
		private function saveState():void
		{			
			playerinfo.data.direction = direction;
			playerinfo.data.x = x;
			playerinfo.data.y = y;
			playerinfo.data.age = age;
		}
		
		private function agefunc():void
		{
			age += 1;
			if (Player.age >= 0 && Player.age <= 1000) 
			{ 
				graphic = boy;
				movementboy(); 
			}
			
			if (Player.age >= 1000 && Player.age <= 2000 ) 
			{ 
				graphic = man;
				movementman();
			}
			
			if (Player.age >= 2000) 
			{ 
				graphic = old;
				movementold();
			}
			
			//Development Keys
			if (Input.pressed( Key.I)) { age = 0; }
			if (Input.pressed( Key.O)) { age = 1000; }
			if (Input.pressed( Key.P)) { age = 2000; }
		}
		
		private function graphicfunc():void
		{
			//Basic graphic functions
			boy.scale = 2;
			man.scale = 2;
			old.scale = 2;
			
			//Boy Graphics
			//Standing Directions
			boy.add("standdown", [0], 1, true);
			boy.add("standup", [3], 1, true);
			
			boy.add("standright", [6], 1, true);
			boy.add("standleft", [9], 1, true);
			
			//Moving Directions
			boy.add("down", [0, 1, 0, 2 ], 4, true);
			boy.add("up", [3, 4, 3, 5 ], 4, true);
			
			boy.add("right", [6, 7, 6, 8 ], 4, true);
			boy.add("left", [9, 10, 9, 11 ], 4, true);
			
			//Man Graphics
			//Standing Directions
			man.add("standdown", [0], 1, true);
			man.add("standup", [3], 1, true);
			
			man.add("standright", [6], 1, true);
			man.add("standleft", [9], 1, true);
			
			//Moving Directions
			man.add("down", [0, 1, 0, 2 ], 4, true);
			man.add("up", [3, 4, 3, 5 ], 4, true);
			
			man.add("right", [6, 7, 6, 8 ], 4, true);
			man.add("left", [9, 10, 9, 11 ], 4, true);
			
			//Old Man Graphics
			//Standing Directions
			old.add("standdown", [0], 1, true);
			old.add("standup", [3], 1, true);
			
			old.add("standright", [6], 1, true);
			old.add("standleft", [9], 1, true);
			
			//Moving Directions
			old.add("down", [0, 1, 0, 2 ], 4, true);
			old.add("up", [3, 4, 3, 5 ], 4, true);
			
			old.add("right", [6, 7, 6, 8 ], 4, true);
			old.add("left", [9,10,9,11 ], 4, true);
		}
		
		private function collisions():void
		{
			if(Input.pressed(Key.ANY)){playerinfo.data.firstrun = false;}
			if (x >= 800-32) {
				x = 800-32;
				}
			if (x <= 0) {
				x = 0;
				}
			if (y >= 600-32) {
				y = 600-32;
				}
			if (y <= 0) {
				y = 0;
				}
		}
		
		private function movementoverall():void
		{
			if(canmove==true){
			//Move left
			if (Input.check(Key.LEFT) && canmoveleft == true && movespeedy == 0 ) 
			{  
				
			}
			
			//Move Right
			if (Input.check(Key.RIGHT) && canmoveright == true && movespeedy == 0  ) 
			{
				
			}
			
			//Move up
			if (Input.check(Key.UP) && canmoveup == true && movespeedx == 0  ) 
			{ 
				
			}
			
			//Move down
			if (Input.check(Key.DOWN) && canmovedown == true && movespeedx == 0  ) 
			{ 
				
			}

			
			if (Input.released(Key.LEFT)) { direction = 4; }
			if (Input.released(Key.RIGHT)) { direction = 2; }
			if (Input.released(Key.UP)) { direction = 1; }
			if (Input.released(Key.DOWN)) { direction = 3; }
			}
		}
		
		private function movementboy():void
		{
			if(canmove==true){
			//Move left
			if (Input.check(Key.LEFT) && canmoveleft == true && movespeedy == 0 ) 
			{ 
				movespeedx = 2; 
				x -= movespeedx; 
				boy.play("left"); 
			}
			
			//Move Right
			if (Input.check(Key.RIGHT) && canmoveright == true && movespeedy == 0  ) 
			{ 
				movespeedx = 2; 
				x += movespeedx;  
				boy.play("right");
			}
			
			//Move up
			if (Input.check(Key.UP) && canmoveup == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y -= movespeedy;  
				boy.play("up"); 
			}
			
			//Move down
			if (Input.check(Key.DOWN) && canmovedown == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y += movespeedy;  
				boy.play("down"); 
			}

			
			if (Input.released(Key.LEFT)) { movespeedx = 0; boy.play("standleft"); }
			if (Input.released(Key.RIGHT)) { movespeedx = 0; boy.play("standright"); }
			if (Input.released(Key.UP)) { movespeedy = 0; boy.play("standup"); }
			if (Input.released(Key.DOWN)) { movespeedy = 0; boy.play("standdown"); }
			}
		}
		
		private function movementman():void
		{
			if(canmove==true){
			//Move left
			if (Input.check(Key.LEFT) && canmoveleft == true && movespeedy == 0 ) 
			{ 
				movespeedx = 2; 
				x -= movespeedx; 
				man.play("left"); 
			}
			
			//Move Right
			if (Input.check(Key.RIGHT) && canmoveright == true && movespeedy == 0  ) 
			{ 
				movespeedx = 2; 
				x += movespeedx;  
				man.play("right"); 
			}
			
			//Move up
			if (Input.check(Key.UP) && canmoveup == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y -= movespeedy;  
				man.play("up"); 
			}
			
			//Move down
			if (Input.check(Key.DOWN) && canmovedown == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y += movespeedy;  
				man.play("down"); 
			}

			
			if (Input.released(Key.LEFT)) { movespeedx = 0; man.play("standleft"); }
			if (Input.released(Key.RIGHT)) { movespeedx = 0; man.play("standright"); }
			if (Input.released(Key.UP)) { movespeedy = 0; man.play("standup"); }
			if (Input.released(Key.DOWN)) { movespeedy = 0; man.play("standdown"); }
			}
		}
		
		private function movementold():void
		{
			if(canmove==true){
			//Move left
			if (Input.check(Key.LEFT) && canmoveleft == true && movespeedy == 0 ) 
			{ 
				movespeedx = 2; 
				x -= movespeedx; 
				old.play("left"); 
			}
			
			//Move Right
			if (Input.check(Key.RIGHT) && canmoveright == true && movespeedy == 0  ) 
			{ 
				movespeedx = 2; 
				x += movespeedx;  
				old.play("right"); 
			}
			
			//Move up
			if (Input.check(Key.UP) && canmoveup == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y -= movespeedy;  
				old.play("up"); 
			}
			
			//Move down
			if (Input.check(Key.DOWN) && canmovedown == true && movespeedx == 0  ) 
			{ 
				movespeedy = 2; 
				y += movespeedy;  
				old.play("down"); 
			}

			
			if (Input.released(Key.LEFT)) { movespeedx = 0; old.play("standleft"); }
			if (Input.released(Key.RIGHT)) { movespeedx = 0; old.play("standright"); }
			if (Input.released(Key.UP)) { movespeedy = 0; old.play("standup"); }
			if (Input.released(Key.DOWN)) { movespeedy = 0; old.play("standdown"); }
			}
		}

	}
}
