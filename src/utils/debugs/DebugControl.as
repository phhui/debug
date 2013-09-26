package utils.debugs
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	public class DebugControl extends DebugWin
	{
		private var debug_listen:Array=[];
		private var debug_unListen:Array=[];
		private var msgList:Array=[];
		private var listen:Boolean=true;
		private var _contact:Function;
		private var tf:TextFormat=new TextFormat();
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
			}else if(str.length>6&&str.substr(0,7)=="format "){
				var arr:Array=str.substr(7).split(',');
				if(arr[0]!=null)tf.size=int(arr[0]);
				if(arr[1]!=null)tf.color=arr[1];
				format(tf);
			}else if(str=="help"){
				showHelp();
			}
			contactText(str);			
		}
		
		protected function showHelp():void
		{
			var str:String="";
			str+="指令：debug +\n";
			str+="      过滤内容，只显示包含指定内容的字符串，如debug +abc 的结果是调试窗口只接收包含abc的调试信息。\r\n";
			str+="指令：debug -\n";
			str+="      过滤内容，只显示不包含指定内容的字符串，如debug -abc 的结果是调试窗口只接收不包含abc的调试信息。\r\n";
			str+="指令：debug reset\n";
			str+="      重置过滤条件，即清空debug +/-设置的过滤条件。\r\n";
			str+="指令：search \n";
			str+="      搜索内容，如search abc 的结果是查找当前调试列表所有数据，并把包含abc的调试数据输出到调试窗口。\r\n";
			str+="指令：stop \n";
			str+="      停止调试数据输出，即调试窗口不再接收调试数据。\r\n";
			str+="指令：start \n";
			str+="      启动调试数据输出，即调试窗口开始接收调试数据。\r\n";
			str+="指令：showAll \n";
			str+="      显示全部调试数据，当使用debug +/-后要返回查看所有调试信息时使用。\r\n";
			str+="指令：format \n";
			str+="      设置调试窗口文本显示格式，如format 20,0x000000 的结果是调试窗口文本大小变成20，颜色变成黑色。\r\n";
			addText(str);
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