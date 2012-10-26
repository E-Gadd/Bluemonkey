package
{
	import net.flashpunk.World;
	public class FirstWorld extends World
	{
		public function FirstWorld()
		{
			
			developmentfunc();
			add(new Player);
			add(new terrainMaster);
			add(new playerHat);

		}
		
		private function developmentfunc():void
		{
		}
	}
}