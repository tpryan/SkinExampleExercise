package skins
{
	import components.LocationLabel;
	
	import spark.components.supportClasses.StyleableTextField;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.SkinnableContainerSkin;
	
	public class LocationLabelSkin extends SkinnableContainerSkin
	{
		
		[Embed(source="/assets/skins/locationbg240.png")]
		private var bgClass:Class;
		
		[Embed(source="/assets/skins/locationsmudge240.png")]
		private var bgSmudgeClass:Class;
		
		protected var bg:BitmapImage = new BitmapImage();
		protected var bgSmudge:BitmapImage = new BitmapImage();
		protected var host:LocationLabel;
		
		public function LocationLabelSkin()
		{
			super();
			
			
			
		}
		
		override protected function childrenCreated():void{
			super.childrenCreated();
			host = hostComponent as LocationLabel;
			
			bg.source = bgClass;
			bgSmudge.source = bgSmudgeClass;
			setElementSize(bg, 480, 250);
			setElementSize(bgSmudge, 143, 169);
			setElementPosition(bg, 0, 0);
			setElementPosition(bgSmudge,bg.width-bgSmudge.width,60);
			
			host.addElementAt(bg,0);
			host.addElementAt(bgSmudge,0);
			
			
			
			host.height = bg.height;
			
			host.textDisplay.rotation = -12.5;
			host.textDisplay.antiAliasType = "normal";
			host.textDisplay.y = 75;
			
			var shadowText:StyleableTextField = new StyleableTextField();
			shadowText.text = host.textDisplay.text;
			shadowText.x = host.textDisplay.x + 2;
			shadowText.y = host.textDisplay.y + 2;
			shadowText.setStyle("fontSize", host.textDisplay.getStyle("fontSize"));
			shadowText.setStyle("color", 0x000000);
			shadowText.rotation = host.textDisplay.rotation;
			
			host.addElementAt(shadowText,host.getElementIndex(host.textDisplay));
			
			
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
	}
}