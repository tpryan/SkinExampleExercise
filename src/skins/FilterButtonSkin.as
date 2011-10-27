package skins
{
	import spark.components.Button;
	import spark.skins.mobile.ButtonSkin;
	
	public class FilterButtonSkin extends ButtonSkin
	{
		
		[Embed(source="/assets/skins/filterbuttonUp240.png")]
		private var borderClassUp:Class;
		
		
		[Embed(source="/assets/skins/filterbuttonDown240.png")]
		private var borderClassDown:Class;
		
		
		
		
		public function FilterButtonSkin()
		{
			super();
			width= 182;
			height = 77;
			upBorderSkin = borderClassUp;
			downBorderSkin = borderClassDown;
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			var host:Button = hostComponent as Button;	
			
			host.y = 150;
			
		}
		
		override protected function getBorderClassForCurrentState():Class
		{
			if (currentState == "down"){
				labelDisplay.setStyle("color",0xFFFFFF);
				return downBorderSkin;
			}
			else{
				labelDisplay.setStyle("color",0x48250A);
				return upBorderSkin;
			}
			
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
	}
}