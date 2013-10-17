package utils.debugs
{
	public class DebugParsing
	{
		static private var v:ParsingVo=new ParsingVo();
		static private const START:String="start";
		static private const STOP:String="stop";
		static private const RESET:String="reset";
		static private const SHOW_ALL:String="showAll";
		static private const HELP:String="showHelp";
		static private const CLEAR:String="clear";
		static private const CLEAR_DATA:String="clearData";
		static private const OBJ_VIEW:String="objview";
		static private const FORMAT:String="format";
		static private const SEARCH:String="search";
		static private const DEBUG_ADD:String="debugAdd";
		static private const DEBUG_DEL:String="debugDel";
		static private const SET_BG:String="setBg";
		static private const FOR:String="forFunc";
		
		public function DebugParsing()
		{
		}
		static public function parsing(str:String):ParsingVo{
			v.command="";
			v.param=null;
			v.out=false;
			if(str=="debug reset"){
				v.command=RESET;
			}else if(str==STOP){
				v.command=STOP;
			}else if(str==START){
				v.command=START;
			}else if(str==SHOW_ALL){
				v.command=SHOW_ALL;
			}else if(str=="help"){
				v.command=HELP;
			}else if(str==CLEAR){
				v.command=CLEAR;
			}else if(str==CLEAR_DATA){
				v.command=CLEAR_DATA;
			}else if(str=="cmd"){
				v.command=OBJ_VIEW;
			}else if(str.length>6&&str.substr(0,6)==FORMAT){
				v.command=FORMAT;
				v.param=str.substr(7).split(',');
			}else if(str.length>7&&str.substr(0,6)==SEARCH){
				v.command=SEARCH;
				v.param=str.substr(7);
			}else if(str.length>7&&str.substr(0,7)=="debug +"){
				v.command=DEBUG_ADD;
				v.param=str.substr(7);
			}else if(str.length>7&&str.substr(0,7)=="debug -"){
				v.command=DEBUG_DEL;
				v.param=str.substr(7);
			}else if(str.length>13&&str.substr(0,5)==SET_BG){
				v.command=SET_BG;
				v.param=str.substr(6).split(',');								
			}else if(str.length>4&&str.substr(0,4)=="for "){
				var index:int=str.lastIndexOf("-");
				var n:int=int(str.substr(index+1));
				v.command=FOR;
				v.param=[n,str.substr(4,index-4)];
			}else{
				v.command=str;
				v.out=true;
			}
			return v;
		}
	}
}