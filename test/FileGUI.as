package{
	import flash.display.Sprite;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filesystem.File;
	import ws.equator.controls.GUI;

	public class FileGUI extends GUI{
		
		public static function loadFromFile( s:String, container:Sprite):Object{
			var file:File;
			var fileStream:FileStream=new FileStream();
			var content:String;
			var ret:Object;
			
			file=File.applicationDirectory.resolvePath( "appfiles/"+s);
			if( !file.exists){
				file=File.applicationDirectory.resolvePath( s);
				if( !file.exists){
					return null;
				}
			}
			try{
				fileStream.open( file, FileMode.READ);
				content=fileStream.readUTFBytes( fileStream.bytesAvailable);
				fileStream.close();
			}catch( e:Error){
				return null;
			}
			ret=parseXML( container, new XML( content));
			if( null==ret){
				return null;
			}
			return ret;
		}
	}
}
