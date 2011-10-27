package skins
{
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.ViewNavigatorSkin;
	
	public class ViewSkin extends ViewNavigatorSkin
	{
		
		[Embed(source="/assets/skins/detailbg240.jpg")]
		private var bgClass:Class;
		
		protected var bg:BitmapImage = new BitmapImage();
		protected var holder:Group = new Group();
		
		
		public function ViewSkin()
		{
			super();
			
			bg.source = bgClass;
			setElementSize(bg,480, 1206);
			addChild(holder);
			holder.addElement(bg);
			
		}
		
		override protected function childrenCreated():void{
			super.childrenCreated();
			this.actionBar.height = 0;
		}
		
	}
}