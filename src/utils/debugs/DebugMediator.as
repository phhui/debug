package utils.debugs
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.text.TextFormat;

	public class DebugMediator
	{
		private var win:DebugWin=new DebugWin();
		private var _listen:Boolean=true;
		private var tf:TextFormat=new TextFormat();
		public function DebugMediator(){
		}
		protected function showWin(s:Stage):void{
			s.addChild(win);
			win.initSize();
			win.input.addEventListener(KeyboardEvent.KEY_DOWN,keySend);
			s.addEventListener(KeyboardEvent.KEY_DOWN,setFocus);
			s.focus=win.input;
		}
		
		protected function setFocus(e:KeyboardEvent):void
		{
			if(e.keyCode==191){
				win.stage.focus=win.input;
				win.resetInput();
			}
		}
		protected function hideWin():void{		
			win.input.removeEventListener(KeyboardEvent.KEY_DOWN,keySend);
			win.stage.removeEventListener(KeyboardEvent.KEY_DOWN,setFocus);
			if(win.stage)win.stage.removeChild(win);	
		}
		protected function keySend(e:KeyboardEvent):void{
			if(e.keyCode==13)sendMsg(win.inputText);
		}
		private function sendMsg(str:String):void{
			if(str.length<1)return;
			parsing(str);
			win.resetInput();
		}
		protected function addStr(arr:Array):void{
			if(!_listen)return;
			addText(arr);
		}
		protected function showStr(arr:Array):void{
			win.resetOutput();
			addText(arr);
		}
		/**命令解析方法**/
		protected function parsing(str:String):void
		{
			
		}
		private function addText(arr:Array):void{
			for each(var i:String in arr){
				win.addText(i);
			}
		}
		protected function set listen(value:Boolean):void{
			_listen = value;
		}
		protected function setTextFormat(size:int,color:Object):void{
			tf.size=size;
			tf.color=color;
			win.format(tf);
		}
		protected function setBgFormat(p:Array):void{
			win.setBg(p[0],Number(p[1]));
		}
	}
}