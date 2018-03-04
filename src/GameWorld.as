package 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Text;
	
	public class GameWorld extends World 
	{
		private var player:Player;
		private var study:Study;
		// HUD
		private var looseText:Text;
		private var winText:Text;
		private var progress:Progress;
		private var timeSpawn:Number = 3;
		private var timeSpawnColdown:Number = 0;
		// Music
		[Embed(source = "../assets/sfx/study music.mp3")]
		private const MUSIC_SFX:Class; 
		private var music:Sfx; 
		
		public function GameWorld() 
		{
			player = new Player();
			study = new Study(FP.rand(FP.screen.width), FP.rand(FP.screen.height));
			progress = new Progress(FP.screen.width / 2, 50);
			looseText = new Text("");
			winText = new Text("");
			music = new Sfx(MUSIC_SFX);
			super();
		}
		
		override public function begin():void 
		{
			SetTextUI();
			add(progress);
			add(study);
			add(player); 
			music.loop();
		}
		
		override public function update():void 
		{
			PlaceEnemies();
			CheckGame();
			super.update();
		}
		
		private function SetTextUI():void 
		{
			// Loose
			looseText.text = "LOOSE";
			looseText.color = 0x000000;
			looseText.size = 48;
			looseText.y += looseText.height / 6;
			addGraphic(looseText);
			// Win
			winText.text = "WIN";
			winText.color = 0x000000;
			winText.size = 48;
			winText.x = FP.screen.width - winText.width;
			winText.y += winText.height / 6; 
			addGraphic(winText);
		}
	
		private function PlaceEnemies():void 
		{
			// Cada cierto tiempo spawnea enemigos en una posicion random
			timeSpawnColdown += FP.elapsed;
			if (timeSpawnColdown >= timeSpawn)
			{
				AddEnemy();
				timeSpawnColdown = 0;
			}
		}
		
		private function AddEnemy():void 
		{
			// Crea un numero random para decidir que enemigo spawnear
			var typeEnemy:int = FP.rand(4);
			// Los enemigos se crean en una posicion XY random
			var posX:Number = FP.rand(FP.screen.width);
			var posY:Number = FP.rand(FP.screen.height);
			switch (typeEnemy) 
			{
				case 0:
					var facebook:Facebook = new Facebook(posX, posY);
					add(facebook);
					break;
				case 1:
					var twitter:Twitter = new Twitter(posX, posY);
					add(twitter);
					break;
				case 2:
					var steam:Steam = new Steam(posX, posY);
					add(steam);
					break;
				case 3:
					var skype:Skype = new Skype(posX, posY);
					add(skype);
					break;
				default:
			}
		}
		
		// Controla si termino el juego
		private function CheckGame():void 
		{
			if (progress.width <= 0)
				FP.world = new EndGame(false);
			if (progress.width >= progress.GetCareer())
				FP.world = new EndGame(true);
		}
	}

}