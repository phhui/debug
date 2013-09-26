package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import utils.debugs.Debug;
	
	public class Main extends Sprite
	{
		private var str:String="神王那黑袍下的雾气眼眸俯瞰着下方的纪宁，他在等待着纪宁的答复，他也很清楚，这恐怕是到如今最有希望让纪宁投靠的一刻。因为余薇堪称现如今对纪宁最重要的人，是纪宁心灵最重要的牵挂，而且余薇的死，在报答神王的同时，也是不愿在连累纪宁。神王那黑袍下的雾气眼眸俯瞰着下方的纪宁，他在等待着纪宁的答复，他也很清楚，这恐怕是到如今最有希望让纪宁投靠的一刻。因为余薇堪称现如今对纪宁最重要的人，是纪宁心灵最重要的牵挂，而且余薇的死，在报答神王的同时，也是不愿在连累纪宁。";
		public function Main()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,stage_add);
			test();
		}
		
		protected function stage_add(event:Event):void
		{
			Debug.showDebug(this.stage,cc);
		}
		private function cc(str:String):void{
			Debug.debug(str);
		}
		
		private function test():void
		{
			var t:Timer=new Timer(1000);
			t.addEventListener(TimerEvent.TIMER,setText);
			t.start();
		}
		
		protected function setText(event:TimerEvent):void
		{
			Debug.debug(str.substr(0,Math.random()*(str.length-20)+5));
		}
		
	}
}