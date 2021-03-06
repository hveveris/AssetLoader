package runner.controller 
{
	import runner.model.AssetId;
	import runner.view.Canvas;

	import org.assetloader.base.AssetType;
	import org.assetloader.base.Param;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.IGroupLoader;
	import org.assetloader.core.ILoadGroup;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class AddGroupSampleCommand extends Command 
	{

		[Inject]
		public var loader : IAssetLoader;

		override public function execute() : void 
		{
			//With only 1 connection the loader should finish the group first and then continue with the other.
			//A group is seen as just another asset to load.
			loader.numConnections = 3;
			
			var host : String = "http://www.matan.co.za/AssetLoader/testAssets/";			
			var groupLoader : IGroupLoader = loader.addGroup(AssetId.SAMPLE_GROUP);
			//The group will open 2 connections
			groupLoader.numConnections = 0;
			
			var group : ILoadGroup = groupLoader.group;
			group.setParam(Param.PREVENT_CACHE, true);
			
			groupLoader.addLazy(AssetId.SAMPLE_TXT, host + "sampleTXT.txt");
			groupLoader.addLazy(AssetId.SAMPLE_JSON, host + "sampleJSON.json");
			groupLoader.addLazy(AssetId.SAMPLE_XML, host + "sampleXML.xml");
			groupLoader.addLazy(AssetId.SAMPLE_CSS, host + "sampleCSS.css");
			groupLoader.addLazy(AssetId.SAMPLE_BINARY, host + "sampleZIP.zip", AssetType.AUTO, new Param(Param.WEIGHT, 3493));
			groupLoader.addLazy(AssetId.SAMPLE_SOUND, host + "sampleSOUND.mp3", AssetType.AUTO, new Param(Param.WEIGHT, 213007));
			
			var preventCache : Param = new Param(Param.PREVENT_CACHE, true);			var onDemand : Param = new Param(Param.ON_DEMAND, true);
			
			loader.addLazy(AssetId.SAMPLE_IMAGE, host + "sampleIMAGE.jpg", AssetType.AUTO, preventCache, new Param(Param.WEIGHT, 328563));
			loader.addLazy(AssetId.SAMPLE_VIDEO, host + "sampleVIDEO.mp4", AssetType.AUTO, preventCache, onDemand, new Param(Param.WEIGHT, 10034673));
			loader.addLazy(AssetId.SAMPLE_SWF, host + "sampleSWF.swf", AssetType.AUTO, preventCache, new Param(Param.WEIGHT, 941410));
						loader.addLazy(AssetId.SAMPLE_ERROR, host + "fileThatDoesNotExist.php");
			
			contextView.addChild(new Canvas());
		}
	}
}
