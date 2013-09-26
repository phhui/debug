package utils.debugs
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	public class DebugWin extends Sprite
	{
		private var txt_output:TextField;
		private var txt_input:TextField;
		private var scr:scroll
		public function DebugWin()
		{
			var tf:TextFormat= new TextFormat("微软雅黑",12,0x000000);
			txt_output=new TextField();
			txt_input=new TextField();
			scr=new scroll();
			txt_output.multiline=true;
			txt_output.wordWrap=true;
			txt_output.border=true;
			txt_output.defaultTextFormat=tf;
			txt_input.defaultTextFormat=tf;
			txt_input.border=true;
			txt_input.type=TextFieldType.INPUT;
			this.addChild(txt_output);
			this.addChild(txt_input);
			this.addChild(scr);
			createScroll();
		}
		protected function addText(str:String):void{
			txt_output.htmlText+=str+"\r\n";
			scr.bindObj(txt_output,null,this.stage.stageHeight-30);
			scr.setPos(txt_output.maxScrollV);
		}
		protected function get inputText():String{
			return txt_input.text;
		}
		protected function get input():TextField{
			return txt_input;
		}
		protected function resetOutput():void{
			txt_output.text="";
		}
		protected function resetInput():void{
			txt_input.text="";
		}
		protected function format(tf:TextFormat):void{
			txt_output.defaultTextFormat=tf;
		}
		protected function initSize():void
		{
			txt_output.width=this.stage.stageWidth-10;
			txt_output.height=this.stage.stageHeight-30;
			txt_input.width=this.stage.stageWidth;
			txt_input.height=25;
			txt_input.y=this.stage.stageHeight-25;
			scr.x=this.stage.stageWidth-10;
		}
		private function createScroll():void{
			var up:Sprite=new Sprite();
			var down:Sprite=new Sprite();
			var bar:Sprite=new Sprite();
			var bg:Sprite=new Sprite();
			up.graphics.beginFill(0x999999,1);
			up.graphics.drawRect(0,0,10,10);
			down.graphics.beginFill(0x999999,1);
			down.graphics.drawRect(0,0,10,10);
			bar.graphics.beginFill(0x000000,1);
			bar.graphics.drawRect(0,0,10,50);
			bg.graphics.beginFill(0x999999,0.5);
			bg.graphics.drawRect(0,0,10,20);
			scr.setSkin(up,down,bar,bg);
		}
	}
}