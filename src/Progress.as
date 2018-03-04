package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Progress extends Entity 
	{
		// Sprite
		[Embed(source="../assets/progress.png")]
		private const PROGRESS_IMAGE:Class;
		private var progressImage:Image;
		// Vida de la barra de estudio
		private var career:Number = 0;
		private var decrease:Number = 0.1;
		private var increase:Number = 0.0001;
		
		public function Progress(x:Number=0, y:Number=0) 
		{
			progressImage = new Image(PROGRESS_IMAGE);
			super(x, y);
		}
		
		override public function added(): void
		{
			graphic = progressImage;
			career = progressImage.width;
			progressImage.scaleX = 0.5;
			progressImage.scaleY = 0.025;
			width = progressImage.scaledWidth;
			height = progressImage.scaledHeight;
			progressImage.smooth = true;
			type = "Progress";
			name = "Progress";
			y = height * 2;
			x = FP.screen.width / 2 - width;
		}
		
		override public function update():void 
		{
			UpdateBar();
		}
		
		// Actualiza el tamaño de barra 
		private function UpdateBar():void 
		{
			width = progressImage.scaledWidth;
		}
		
		// Mientras se mantenga estudiando incrementa la barra
		public function Increase():void 
		{
			progressImage.scaleX += increase;
		}
		
		// Cada vez que subre distracciones, resta la barra de estudio
		public function Decrease():void 
		{
			progressImage.scaleX -= decrease;
		}
		
		// Devuelve el tamaño total que deberia tener la barra para ganar
		public function GetCareer():Number 
		{
			return career;
		}
	}
}