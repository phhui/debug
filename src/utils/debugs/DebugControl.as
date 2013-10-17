package utils.debugs
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	public class DebugControl extends DebugMediator
	{
		private var view:Boolean=false;
		private var objPath:Array=[];
		private var _contact:Function;
		private var tf:TextFormat=new TextFormat();
		private var v:ParsingVo=new ParsingVo();
		public function DebugControl()
		{
		}
		public function show(s:Stage):void{
			showWin(s);
			ObjView.s=s;
		}
		public function hide():void{
			hideWin();
		}
		public function showMsg(str:String):void{
			if(!DebugData.checkText(str))return;
			addStr([str]);
		}
		public function set contact(value:Function):void{
			_contact = value;
		}
		public function set msglist(val:Array):void{
			DebugData.msgList=val;
			showAll();
		}
		private function clearMsgList():void{
			DebugData.msgList=[];
		}
		override protected function parsing(str:String):void{
			v=DebugParsing.parsing(str);
			if(view){
				addStr([ObjView.view(str)]);
				if(str=="objview")objview();
			}else if(v.out){
				contactText(str);
			}else{
				command(v.command,v.param);
			}
		}
		private function command(str:String,param:Object):void{
			if(param)this[str](param);
			else this[str]();
		}
		/**其它命令解析可重写此方法**/
		protected function contactText(str:String):void{
			if(_contact!=null)_contact(str);
		}
		private function reset():void{
			DebugData.reset();
		}
		private function debugAdd(s:String):void{
			DebugData.addListen(s);
		}
		private function debugDel(s:String):void{
			DebugData.addUnListen(s);
		}
		private function showAll():void{
			showStr(DebugData.msgList);
		}
		private function clear():void{
			showStr(null);
		}
		private function clearData():void{
			DebugData.msgList=[];
		}
		private function objview():void{
			view=!view;
		}
		private function format(p:Array):void{
			setTextFormat(p[0],p[1])
		}
		private function setBg(p:Array):void{
			setBgFormat(p)
		}
		private function forFunc(p:Array):void{
			for(var i:int=0;i<p[0];i++){
				parsing(p[1]);
			}
		}
		protected function showHelp():void{
			addStr([DebugHelp.getHelp()]);
		}
		private function search(str:String):void{
			var arr:Array=[];
			for each(var i:String in DebugData.msgList){
				if(i.indexOf(str)!=-1){
					arr.push(i);
				}
			}
			showStr(arr);
		}
	}
}