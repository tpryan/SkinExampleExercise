package skins
{
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.TextArea;
	import spark.effects.Fade;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.TextAreaSkin;
	
	public class NoteSkin extends TextAreaSkin
	{
		
		[Embed(source="/assets/skins/noteTop240.png")]
		private var topClass:Class;
		
		[Embed(source="/assets/skins/noteBottom240.png")]
		private var bottomClass:Class;
		
		protected var topImage:BitmapImage = new BitmapImage();
		protected var bottomImage:BitmapImage = new BitmapImage();
		protected var holder:Group = new Group();
		protected var host:TextArea;
		protected var fadeIn:Fade = new Fade();
		
		public function NoteSkin()
		{
			super();
			addChild(holder);
			
			
			
			
		}
		
		override protected function childrenCreated():void{
			border.visible = false;	
			
			this.y = this.y + 10;
			this.alpha = 0;
			
			host = hostComponent as TextArea;
			host.setStyle("focusThickness", 0);
			
			
			bottomImage.source = bottomClass;
			topImage.source = topClass;
			setElementSize(topImage, this.width, 110);
			setElementSize(bottomImage, this.width, 112);
			
			setElementPosition(topImage, 0, -10);
			setElementPosition(bottomImage, 0, textDisplay.y + textDisplay.height);
			
			topImage.blendMode = "multiply";
			bottomImage.blendMode = "multiply";
			
			
			holder.addElement(bottomImage);
			holder.addElement(topImage);
			
			fadeIn.alphaFrom = 0;
			fadeIn.alphaTo = 1;
			fadeIn.duration = 1200;
			fadeIn.target = this;
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, playFadeIn);
			
			
		}
		
		protected function playFadeIn(event:FlexEvent):void
		{
			fadeIn.play();
			
		}
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			
			setElementPosition(textDisplay, 50, textDisplay.y + 20);
			setElementPosition(bottomImage, 0, textDisplay.y + textDisplay.height);
			host.y = host.y + 20;
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		
	}
}