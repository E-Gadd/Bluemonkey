package  
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Aaron O'Rourke
	 */
	public class terrainMaster extends Entity 
	{
		public static var tileArray:Array;
		public static var tileXArray:Array;
		public static var tileYArray:Array;
		private var tileplace:int = 0;
		
		public function terrainMaster() 
		{
			tileArray = new Array([500]);
			tileXArray = new Array([500]);
			tileYArray = new Array([500]);
		}
		
	}

}