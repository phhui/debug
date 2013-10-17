package utils.debugs
{
	import flash.display.Stage;
	import flash.utils.describeType;

	public class ObjView
	{
		static private var objPath:Array=[];
		static private var obj:Object;
		static private var _s:Stage;
		public function ObjView()
		{
		}
		static public function view(command:String):String{
			var res:String="";
			if(command=="dir"){
				res=describeType(obj).toString();
			}else if(command.length>3&&command.substr(0,2)=="cd"){
				res=command.substr(3);
				if(obj.getChildByName(res)==null){
					try{
						if(obj[res]!=null){
							obj=obj[res];
						}else{
							res=res+"对象不存在";
						}
					}catch(err:Error){
						res=res+"对象不存在";
					}
				}else{
					obj=obj.getChildByName(res);
				}
			}else if(command.length>6&&command.substr(0,5)=="trace"){
				res=obj[command.substr(6)];
				if(res==null)res="不存在属性"+command.substr(6);
			}
			return rt(res);
		}
		static private function rt(s:String):String{
			while(s.indexOf("<")!=-1){
				s=s.replace("<","&lt;");
			}
			while(s.indexOf(">")!=-1){
				s=s.replace(">","&gt;");
			}
			return s;
		}
		public static function get s():Stage
		{
			return _s;
		}

		public static function set s(value:Stage):void
		{
			if(_s!=null)return;
			_s = value;
			obj=_s;
		}

	}
}