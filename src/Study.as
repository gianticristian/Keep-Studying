package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Study extends Entity 
	{
		// Sprite
		[Embed(source="../assets/study.png")]
		private const STUDY_IMAGE:Class;
		private var studyImage:Image;
		
		public function Study(x:Number = 0, y:Number = 0) 
		{
			studyImage = new Image(STUDY_IMAGE);
			super(x, y);
		}

		override public function added(): void
		{
			graphic = studyImage;
			studyImage.scale = 1;
			width = studyImage.scaledWidth;
			height = studyImage.scaledHeight;	
			x = FP.screen.width /  2;
			y = FP.screen.height / 2;
			// Achica la caja de colision y la centra
			studyImage.centerOO();
			setHitbox(width / 2, height / 2, width / 4, height / 4);
			studyImage.smooth = true;
			type = "Study";
			name = "Study";
		}
		
	}

}