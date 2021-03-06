package org.assetloader.events 
{
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class SWFAssetEvent extends AbstractAssetEvent 
	{
		public static const LOADED : String = "SWF_LOADED";

		protected var _sprite : Sprite;

		public function SWFAssetEvent(type : String, id : String, parentId : String, assetType : String, data : Sprite)
		{
			super(type, id, parentId, assetType);
			_sprite = data;
		}

		public function get sprite() : Sprite
		{
			return _sprite;
		}

		override public function clone() : Event 
		{
			return new SWFAssetEvent(type, id, parentId, assetType, sprite);
		}
	}
}
