package 
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	
	public class MainMenu extends World 
	{
		private var tutorialText:Text;
		private var pressKeyText:Text;

		public function MainMenu() 
		{
			tutorialText = new Text("");
			pressKeyText = new Text("");
			super();	
		}
		
		override public function begin():void 
		{
			SetTextUI();
		}
		
		override public function update():void 
		{
			CheckKey();
		}
		
		private function CheckKey():void 
		{
			if (Input.check(Key.SPACE)) FP.world = new GameWorld();
		}
		
		private function SetTextUI():void 
		{
			// Tutorial
			tutorialText.text = "El objetivo es estar en el area de estudio evitando\nser alcanzado por todo lo que te distrae";
			tutorialText.align = "center";
			tutorialText.color = 0x000000;
			tutorialText.size = 24;
			tutorialText.x = FP.screen.width / 2 - tutorialText.width / 2;
			tutorialText.y = FP.screen.height / 2 - tutorialText.height / 2; 
			addGraphic(tutorialText);
			// Press key
			pressKeyText.text = "Usa [ASDW] para moverte\nPresione [ESPACIO] para empezar";
			pressKeyText.align = "center";
			pressKeyText.color = 0x000000;
			pressKeyText.size = 16;
			pressKeyText.x = FP.screen.width / 2 - pressKeyText.width / 2;
			pressKeyText.y = FP.screen.height - pressKeyText.height; 
			addGraphic(pressKeyText);
			
		}
		
	}

}