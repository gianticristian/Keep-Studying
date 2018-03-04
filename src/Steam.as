package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	
	public class Steam extends Enemy 
	{
		// Sprite
		//[Embed(source="../assets/steam.png")]
		[Embed(source="../assets/steamSpriteSheet.png")]
		private const ENEMY_IMAGE:Class;
		// Sound
		[Embed(source="../assets/sfx/steam.mp3")]
		private const NOTIFICATION_SFX:Class; 
		
		public function Steam(x:Number = 0, y:Number = 0) 
		{
			//enemyImage = new Image(ENEMY_IMAGE); 
			enemyImage = new Spritemap(ENEMY_IMAGE, 640, 640, Destroy);
			notification = new Sfx(NOTIFICATION_SFX);
			super(x, y);
		}
	}
}