package utils.debugs
{	
	import flash.display.Stage;

	public class Debug
	{
		static private var win:DebugControl=new DebugControl();
		static private var show:Boolean=false;
		static private var strList:Array=[];
		public function Debug()
		{
			
		}
		static public function debug(msg:String):void{
			strList.push(msg);
			if(show)win.showMsg(msg);
		}
		static public function showDebug(s:Stage,_contact:Function=null):void{
			if(show){
				hideDebug();
				return;
			}
			s.addChild(win);
			show=true;
			win.msglist=strList;
			if(_contact!=null)win.contact=_contact;
		}
		static public function hideDebug():void{
			show=false;
			if(win.parent)win.parent.removeChild(win);
		}
	}
}