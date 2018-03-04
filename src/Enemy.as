package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Enemy extends Entity 
	{
		// Sprite
		//protected var enemyImage:Image; 
		protected var enemyImage:Spritemap;
		// Referencia al jugador
		protected var player:Player;
		// Movimiento
		protected var speed:Number = 200;
		protected var distanceX:Number;
		protected var distanceY:Number;
		// Tiempo de vida
		protected var timeDestroy:Number = 5;
		protected var timeCount:Number = 0;
		// Sound
		protected var notification:Sfx; 
		protected var volume:Number = 1;
		
		public function Enemy(x:Number = 0, y:Number = 0) 
		{
			player = new Player();
			super(x, y);
		}
		
		override public function added(): void
		{
			enemyImage.add("Fade", [0, 1, 2], 5, false);
			graphic = enemyImage;
			enemyImage.scale = 0.08;
			width = enemyImage.scaledWidth;
			height = enemyImage.scaledHeight;
			enemyImage.smooth = true;
			type = "Enemy";			
			player = world.getInstance("Player") as Player;
		}
		
		override public function update():void 
		{
			CalculateDistances();
			Movement();
			Hit();
			CheckTime();
			super.update();
		}
		
		private function CalculateDistances():void
		{
			if (player)
			{
				distanceX = player.x - x;
				distanceY = player.y - y;
			}
		}
		
		protected function Movement():void 
		{
			x += Math.cos(Math.atan2(distanceY, distanceX)) * speed * FP.elapsed;
			y += Math.sin(Math.atan2(distanceY, distanceX)) * speed * FP.elapsed;
		}
		
		protected function CheckTime():void 
		{
			timeCount += FP.elapsed;
			if (timeCount >= timeDestroy)
			{
				collidable = false;
				enemyImage.play("Fade", false);
			}
		}
		
		protected function Destroy():void 
		{
			world.remove(this);
		}
		
		protected function Hit():void
		{	
			if (this.collideWith(player, x, y))
			{
				notification.play(volume);
				player.TakeDamage();
				world.remove(this);
			}
		}
		
		
	}

}