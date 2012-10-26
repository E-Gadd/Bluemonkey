package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Aaron O'Rourke
	 */
	public class playerHat extends Entity 
	{
		private var hat1:Image = new Image(fileDefs.hat1);
		private var hat2:Image = new Image(fileDefs.hat2);
		
		//Bools
		private var wearhat:Boolean = false;
		
		public function playerHat() 
		{
			x = Player.playerX;
			y = Player.playerY;
			
			graphic = hat1;
			layer = 99;
			
			hat1.scale = 2;
			hat2.scale = 2;
		}
		
		override public function update():void 
		{
			x = Player.playerX;
			y = Player.playerY;
			
			pickhat();
			
			super.update();
		}
		
		private function pickhat():void
		{
			if (Input.pressed(Key.E)) { wearhat = false }
			if (Input.pressed(Key.Q)) { wearhat = true }
			
			if (wearhat == false) { graphic.visible = false }
			if (wearhat == true) { graphic.visible = true }
			
			if (Input.check(Key.H))
			{
				if (Input.pressed(Key.DIGIT_2)) { graphic = hat2 };
				if (Input.pressed(Key.DIGIT_1)) { graphic = hat1 };
			}
		}
		
	}

}