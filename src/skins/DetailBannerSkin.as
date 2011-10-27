package skins
{
	import components.DetailBanner;
	
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.SkinnableContainerSkin;

	public class DetailBannerSkin extends SkinnableContainerSkin
	{
		
		
		[Embed(source="/assets/skins/detailBanner240.png")]
		private var bgClass:Class;
		
		protected var host:DetailBanner ;
		
		
		private var bg:BitmapImage = new BitmapImage();
		
		public function DetailBannerSkin()
		{
			super();
			bg.width = 350;
			bg.height = 158;
			
		}
		
		override protected function childrenCreated():void{
			host = hostComponent as DetailBanner;
			bg.source = bgClass;
			host.addElementAt(bg,0);
			host.height = bg.height;
			this.width = host.width;
			bg.horizontalCenter = 0;
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			host.textDisplay.x = bg.width/2 ;
			host.textDisplay.y = bg.height/2;
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
		}
		
		
		
	}
}