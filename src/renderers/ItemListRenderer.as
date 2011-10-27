package renderers
{
	
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	import spark.components.Group;
	import spark.components.IconItemRenderer;
	import spark.primitives.BitmapImage;
	
	public class ItemListRenderer extends IconItemRenderer
	{
		
		[Embed(source='/assets/skins/rule.png')]
		private static var rule1:Class;
		
		[Embed(source='/assets/skins/rule2.png')]
		private static var rule2:Class;
		
		[Embed(source='/assets/skins/rule3.png')]
		private static var rule3:Class;
		
		[Embed(source='/assets/skins/itemListDown240.png')]
		private static var itemListDown:Class;
		
		[Embed(source='/assets/skins/itemListUp240.png')]
		private static var itemListUp:Class;
		
		[Embed(source='/assets/skins/itemListHL240.png')]
		private static var itemListHL:Class;
		
		
		protected var decoratorClass:Class;
		protected var decoratorCoverClass:Class;
		protected var decoratorWidth:int;
		protected var decoratorHeight:int;
		
		protected var highlightClass:Class;
		protected var highlightWidth:int;
		protected var highlightHeight:int;
		
		protected var xOffset:int = 0;
		protected var rendererHeight:int = 0;
		
		protected var rule:BitmapImage = new BitmapImage();
		protected var holder:Group = new Group();
		protected var hl:BitmapImage = new BitmapImage();
		protected var decoratorCover:BitmapImage = new BitmapImage();
		
		
		public function ItemListRenderer()
		{
			super();
			xOffset = 60;
			rendererHeight = 135;
			rendererHeight = 135;
			decoratorHeight = 92;
			decoratorWidth = 94;
			highlightWidth = 493;
			highlightHeight = 113;
			decoratorClass = itemListUp;
			decoratorCoverClass = itemListDown;
			highlightClass = itemListHL;
			
			
			addChild(holder);
			
			
			setElementSize(hl, highlightWidth, highlightHeight);
			hl.source = highlightClass;
			hl.visible = false;
			holder.addElement(hl);
			
			decoratorCover.source = decoratorCoverClass;
			setElementSize(decoratorCover, decoratorWidth, decoratorHeight);
			decoratorCover.visible = false;
			holder.addElement(decoratorCover);
			
			
			
			this.addEventListener(MouseEvent.CLICK, toggleHighlight);
			
			
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			setElementPosition(labelDisplay, xOffset, labelDisplay.y);
			setElementPosition(messageDisplay, xOffset, messageDisplay.y);
			this.height = rendererHeight;
			
			var ruleNumber:Number = labelDisplay.text.length % 3;
			
			switch(ruleNumber)
			{
				case 1:
				{
					rule.source = rule2;
					break;
				}
				case 2:
				{
					rule.source = rule3;
					break;
				}
					
				default:
				{
					rule.source = rule1;
					break;
				}
			}
			holder.addElement(rule);
			
			decoratorDisplay.source = decoratorClass;
			
			setElementPosition(decoratorCover, decoratorDisplay.x, decoratorDisplay.y);
			
			
		}
		
		protected function toggleHighlight(event:MouseEvent):void
		{
				hl.visible = true;
				decoratorCover.visible = true;
			
		}		
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		
		
	}
}