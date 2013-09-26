package utils.debugs
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class DebugControl extends DebugWin
	{
		private var debug_listen:Array=[];
		private var debug_unListen:Array=[];
		private var msgList:Array=[];
		private var listen:Boolean=true;
		private var _contact:Function;
		public function DebugControl()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,stage_added);			
		}		
		private function stage_added(event:Event):void
		{
			initSize();
			input.addEventListener(KeyboardEvent.KEY_DOWN,keySend);
		}
		
		protected function keySend(e:KeyboardEvent):void
		{
			if(e.keyCode==13){
				sendMsg();
			}			
		}
		public function showMsg(str:String):void{
			checkText(str);
		}
		public function set contact(value:Function):void
		{
			_contact = value;
		}
		public function set msglist(val:Array):void{
			msgList=val;
			showAll();
		}
		private function showAll():void{
			resetOutput();
			for each(var i:String in msgList){
				addText(i);
			}			
		}
		private function sendMsg():void
		{
			if(inputText.length<1)return;
			parsingStr(inputText);
			resetInput();
		}
		private function checkText(str:String):void{
			for each(var i:String in debug_unListen){
				if(str.indexOf(i)!=-1)return;
			}
			for each(var j:String in debug_listen){
				if(str.indexOf(j)==-1)return;
			}
			if(listen)addText(str);
		}
		private function parsingStr(str:String):void{
			if(str.length>7&&str.substr(0,7)=="debug +"){
				debug_listen.push(str.substr(7));
			}else if(str.length>7&&str.substr(0,7)=="debug -"){
				debug_unListen.push(str.substr(7));
			}else if(str=="debug reset"){
				debug_listen=[];
				debug_unListen=[];
			}else if(str.length>7&&str.substr(0,7)=="search "){
				searchData(str.substr(7));
			}else if(str=="stop"){
				listen=false;
			}else if(str=="start"){
				listen=true;
			}else if(str=="showAll"){
				showAll();
			}
			contactText(str);			
		}
		/**其它命令解析可重写此方法**/
		public function contactText(str:String):void
		{
			if(_contact!=null)_contact(str);
		}
		private function searchData(str:String):void
		{
			resetOutput();
			for each(var i:String in msgList){
				if(i.indexOf(str)!=-1){
					addText(i);
				}
			}
		}
	}
}