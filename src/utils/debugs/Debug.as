package utils.debugs
{	
	import flash.display.Stage;

	public class Debug
	{
		static private var db:DebugControl=new DebugControl();
		static private var show:Boolean=false;
		static private var strList:Array=[];
		public function Debug()
		{
			
		}
		static public function debug(msg:String):void{
			strList.push(msg);
			if(show)db.showMsg(msg);
		}
		static public function showDebug(s:Stage,_contact:Function=null):void{
			if(show){
				hideDebug();
				return;
			}
			show=true;
			db.show(s);
			db.msglist=strList;
			if(_contact!=null)db.contact=_contact;
		}
		static public function hideDebug():void{
			show=false;
			db.hide();
		}
	}
}