package utils.debugs
{
	public class DebugData
	{
		static private var _msgList:Array=[];
		static private var debug_listen:Array=[];
		static private var debug_unListen:Array=[];
		public function DebugData(){
		}
		static public function checkText(str:String):Boolean{
			for each(var i:String in debug_unListen){
				if(str.indexOf(i)!=-1)return false;
			}
			for each(var j:String in debug_listen){
				if(str.indexOf(j)==-1)return false;
			}
			return true;
		}
		static public function addListen(str:String):void{
			debug_listen.push(str);
		}
		static public function addUnListen(str:String):void{
			debug_unListen.push(str);
		}
		static public function resetListen(str:String):void{
			debug_listen=[];
		}
		static public function resetUnListen(str:String):void{
			debug_unListen=[];
		}
		static public function reset():void{
			debug_listen=[];
			debug_unListen=[];
		}
		public static function get msgList():Array{
			return _msgList;
		}
		public static function set msgList(value:Array):void{
			_msgList = value;
		}

	}
}