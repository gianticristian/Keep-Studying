package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	[SWF(width = "900", height = "720")]
	
	public class Main extends Engine  
	{
		public function Main() 
		{
			super(900, 720, 50, false);
			FP.screen.color = 0xffffff;
			//FP.console.enable(); FP.console.toggleKey = 188; // Con esto habilito la consola. Se activa con la tecla ',' (coma).
		}
		
		override public function init():void 
		{	
  			//FP.world = new GameWorld();  
			FP.world = new MainMenu();
			//FP.world = new EndGame(false);
		}
		
	}
	
}