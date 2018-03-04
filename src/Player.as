package 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Player extends Entity 
	{
		// Sprite
		//[Embed(source = "../assets/player.png")]
		[Embed(source="../assets/playerSpriteSheet.png")]
		private const PLAYER_IMAGE:Class;
		//private var playerImage:Image; 
		private var playerImage:Spritemap = new Spritemap(PLAYER_IMAGE, 512, 560);
		// Referencia al objeto Study
		private var study:Study;
		// Referencia al objeto Progress
		private var progress:Progress;
		// Sound

		// Movement
		private var speed:Number = 40;
		private var friction:Number = 0.8;
		private var vx:Number = 0;
		private var vy:Number = 0;
	
		
		public function Player(x:Number = 0, y:Number = 0) 
		{
			//playerImage = new Image(PLAYER_IMAGE);
			study = new Study();
			progress = new Progress();
			super(x, y);
		}
		
		override public function added(): void
		{
			playerImage.add("Hurt", [0, 1, 2, 0], 10, false);
			graphic = playerImage;
			playerImage.scale = 0.1;
			width = playerImage.scaledWidth;
			height = playerImage.scaledHeight;
			playerImage.smooth = true;
			type = "Player";
			name = "Player";
			study = world.getInstance("Study") as Study;
			progress = world.getInstance("Progress") as Progress;
			x = FP.screen.width / 2 - width / 2;
			y = FP.screen.height - height * 2;
		}
		
		override public function update():void 
		{
			CheckKeys();
			Movement();
			CheckBoundry();
			Studing();
		}
		
		private function CheckKeys():void 
		{
			// Movement
			if (Input.check(Key.A)) vx -= speed;
			else if (Input.check(Key.D)) vx += speed;
			else vx *= friction;	
			
			if (Input.check(Key.S)) vy += speed;
			else if (Input.check(Key.W)) vy -= speed;
			else vy *= friction;	
		}
		
		private function Movement():void 
		{
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
		}
		
		private function CheckBoundry():void 
		{
			// Controla que se mantenga en pantalla en el eje X
			if (x < 0)
			{
				x = 0;
				vx = 0;
			}
			if (x > FP.screen.width - width)
			{
				x = FP.screen.width - width;
				vx = 0;
			}
			// Controla que se mantenga en pantalla en el eje Y
			if (y < 0)
			{
				y = 0;
				vy = 0;
			}
			if (y > FP.screen.height - height)
			{
				y = FP.screen.height - height;
				vy = 0;
			}
		}
		
		public function TakeDamage():void 
		{
			playerImage.play("Hurt", true);
			progress.Decrease();	
		}
		
		private function Studing():void 
		{
			if (this.collideWith(study, x, y))
			{
				progress.Increase();
			}
		}
		
		
		
	}

}