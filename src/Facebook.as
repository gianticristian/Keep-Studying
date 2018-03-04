package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;

	public class Facebook extends Enemy 
	{
		// Sprite
		//[Embed(source="../assets/facebook.png")]
		[Embed(source="../assets/facebookSpriteSheet.png")]
		private const ENEMY_IMAGE:Class;
		// Sound
		[Embed(source="../assets/sfx/facebook.mp3")]
		private const NOTIFICATION_SFX:Class; 
		
		public function Facebook(x:Number = 0, y:Number = 0) 
		{
			//enemyImage = new Image(ENEMY_IMAGE); 
			enemyImage = new Spritemap(ENEMY_IMAGE, 640, 640, Destroy);
			notification = new Sfx(NOTIFICATION_SFX);
			super(x, y);	
		}
	}

}