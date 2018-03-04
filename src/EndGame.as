package 
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;

	public class EndGame extends World 
	{
		private var win:Boolean;
		private var resultText:Text;
		
		public function EndGame(_win:Boolean) 
		{
			resultText = new Text("");
			win = _win;
			super();
		}
		
		override public function begin():void 
		{
			SetTextUI();
		}
		
		private function SetTextUI():void 
		{
			// Si gano muestra un texto
			if (win)
				resultText.text = "Has logrado recibirte, felicitaciones!";
			else
				resultText.text = "No has logrado recibirte, vas a pasar tu vida haciendo\nun trabajo que no te agrade (probablemente)";
			// Result
			resultText.align = "center";
			resultText.color = 0x000000;
			resultText.size = 24;
			resultText.x = FP.screen.width / 2 - resultText.width / 2;
			resultText.y = FP.screen.height / 2 - resultText.height / 2; 
			addGraphic(resultText);			
		}
		
	}
}