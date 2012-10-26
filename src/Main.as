package 
{
	import net.flashpunk.Engine;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Volatile Pixel
	 */
	public class Main extends Engine
	{
		private var timer:int = 0;
		private var mystring:String = new String("");
		private var mySO:SharedObject;
		public function Main():void 
		{
			super(800, 640);
			mySO = SharedObject.getLocal("age");
			FP.world = new FirstWorld;
			
			//FP.console.enable();
		}
		
		override public function update():void 
		{			
			super.update();
		}
		
		private function sharedobjecttesting():void
		{
			mystring = mySO.data.name;
			
			if (Input.pressed(Key.G)) { mySO.data.name = "YOU PRESSED G" }
			if (Input.pressed(Key.F)) { mySO.data.name = "YOU PRESSED F" }
			if (Input.pressed(Key.H)) { mySO.data.name = "YOU PRESSED H" }
			
			if (Input.pressed(Key.S)) {mySO.flush()}
			if(Input.check(Key.L)){mystring = mySO.data.name}
		}
		
	}
	
}