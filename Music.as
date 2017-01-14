package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;

	public class Music extends MovieClip 
	{
		private var mcList:Array=[];
		private var index:int;
		private var btnList:Array=[];
		private var keyValue:int;
		private var url:String;
		private var sd:Sound;

		public function Music() 
		{
			init();
		}
		private function init():void
		{
			this.gotoAndStop(1);
			btnGo.addEventListener(MouseEvent.CLICK,onStart);
		}
		
		private function onStart(e:MouseEvent):void
		{
			this.gotoAndStop(2);
			game1.addEventListener(MouseEvent.CLICK,onGame1);
			game2.addEventListener(MouseEvent.CLICK,onGame2);
		}
		
		private function onGame1(e:MouseEvent):void
		{
			this.gotoAndStop(3);
			mcList = [mc1,mc2,mc3,mc4,mc5,mc6,mc7,mc8,mc9,mc10,mc11];
			for(var i:int=0; i<mcList.length; i++)
			{
				mcList[i].addEventListener(MouseEvent.CLICK,onClickGame1);
			}
			btnBack.addEventListener(MouseEvent.CLICK,onBack);
		}
		
		private function onClickGame1(e:MouseEvent):void
		{
			index = mcList.indexOf(e.currentTarget);
			mcList[index].play();
			url = "music/1/"+ index + ".mp3";
			playMp3(url);
		}
		
		private function onGame2(e:MouseEvent):void
		{
			this.gotoAndStop(4);
			btnList = [btnKey1, btnKey2, btnKey3, btnKey4, btnKey5,btnKey6,btnKey7,btnKey8,btnKey9,btnKey10,btnKey11];
			for(var j:int=0; j<btnList.length; j++)
			{
				btnList[j].addEventListener(MouseEvent.CLICK,onClickGame2);
			}
			btnBack.addEventListener(MouseEvent.CLICK,onBack);
		}
		
		private function onClickGame2(e:MouseEvent):void
		{
			keyValue = btnList.indexOf(e.currentTarget) + 1;
			url = "music/2/"+ keyValue + ".mp3";
			playMp3(url);
		}
		
		private function playMp3(url:String):void
		{
			sd = new Sound();
			sd.load(new URLRequest(url));
			sd.play();
		}
		
		private function onBack(e:MouseEvent):void
		{
			init();
		}
	}
}