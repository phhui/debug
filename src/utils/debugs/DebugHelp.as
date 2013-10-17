package utils.debugs
{
	public class DebugHelp
	{
		public function DebugHelp()
		{
		}
		static public function getHelp():String{
			var str:String="";
			str+="指令：debug +\n";
			str+="      过滤内容，只显示包含指定内容的字符串，如debug +abc 的结果是调试窗口只接收包含abc的调试信息。\n";
			str+="指令：debug -\n";
			str+="      过滤内容，只显示不包含指定内容的字符串，如debug -abc 的结果是调试窗口只接收不包含abc的调试信息。\n";
			str+="指令：debug reset\n";
			str+="      重置过滤条件，即清空debug +/-设置的过滤条件。\n";
			str+="指令：search \n";
			str+="      搜索内容，如search abc 的结果是查找当前调试列表所有数据，并把包含abc的调试数据输出到调试窗口。\n";
			str+="指令：stop \n";
			str+="      停止调试数据输出，即调试窗口不再接收调试数据。\n";
			str+="指令：start \n";
			str+="      启动调试数据输出，即调试窗口开始接收调试数据。\n";
			str+="指令：showAll \n";
			str+="      显示全部调试数据，当使用debug +/-后要返回查看所有调试信息时使用。\n";
			str+="指令：format \n";
			str+="      设置调试窗口文本显示格式，如format 20,0x000000 的结果是调试窗口文本大小变成20，颜色变成黑色。\n";
			str+="指令：setBg \n";
			str+="      设置调试窗口背景，如setBg 0x999999,0.5 结果背景颜色为0x999999，透明度为0.5。\n";
			str+="指令：clear\n";
			str+="      清空显示内容。\n";
			str+="指令：clearData\n";
			str+="      清空调试数据及显示内容。\n";
			str+="指令：for command-N\n";
			str+="      循环执行某个命令，如for abcdefg-10 结果是执行abcdefg命令10遍。\n";
			return str;
		}
	}
}