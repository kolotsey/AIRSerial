package{
	import ws.equator.proto.Serial;
	import flash.events.MouseEvent;
	import ws.equator.controls.Combobox;
	import flash.events.InvokeEvent;
	import flash.desktop.NativeApplication;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	import ws.equator.controls.BasicBox;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/* Main sprite class */
	public class Test extends Sprite {
		private var container:Sprite; 
		private var controls:Object=null;
		private var bg:Sprite;

		private function stageResize( event:Event):void{
			if( null !=controls){
				var box:BasicBox=controls["root_box"] as BasicBox;
				box.width=stage.stageWidth;
				box.height=stage.stageHeight;
			}
			bg.width=stage.stageWidth;
			bg.height=stage.stageHeight;
		}
		
		private function serial_list( success:Boolean, systemPorts:Array):void{
			if( success){
				trace("serial count="+systemPorts.length);
				var serial:Combobox=(controls["serial"] as Combobox);
				var speed:Combobox=(controls["speed"] as Combobox);
				var i:int;
				
				for( i=0; i<systemPorts.length; i++){
					serial.addItem( systemPorts[i], systemPorts[i]);
				}
				 
				if( 0==serial.length){
					serial.enabled=false;
					speed.enabled=false;
				}
			}else{
				trace("serial enum failed");
			}
			stageResize(null);
		}
		
		
		
		private function load_interface():void{
			container=new Sprite();
			addChild( container);
			
			//The most bottom layer in move is background
			var matrix:Matrix;
			bg=new Sprite();
			matrix = new Matrix();
			matrix.createGradientBox(400, 200, Math.PI/2, 0, 0);
			bg.graphics.beginGradientFill( GradientType.LINEAR, [ 0x93C1E5, 0x5E95BF], [1, 1], [0, 200], matrix, SpreadMethod.PAD);
			bg.graphics.drawRect( 0, 0, 400, 200);
			bg.graphics.endFill();
			container.addChild(bg);
			
			bg.addEventListener( MouseEvent.MOUSE_DOWN, function(ev:Event):void{
				if( stage && stage.nativeWindow) stage.nativeWindow.startMove();
			});
			
			//Configure stage listeners
			stage.nativeWindow.alwaysInFront=true;
			stage.addEventListener(Event.RESIZE, stageResize);
			NativeApplication.nativeApplication.addEventListener( InvokeEvent.INVOKE, function(e:InvokeEvent):void{
				if( stage && stage.nativeWindow) stage.nativeWindow.activate();
			});
			
			//Load interface 
			if( null ==(controls=FileGUI.loadFromFile( "appfiles/ui.xml", container))){
				trace("Could not load GUI");
			}
			
			if( !Serial.enum( serial_list)){ 
				trace("Enum failed");
			}
		}
		
		private function init( e:Event):void {
			removeEventListener( Event.ADDED_TO_STAGE, init);
			
			//Configure stage
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.stageFocusRect=false;
			
			load_interface();
		}
		
		public function Test(){
			if( stage==null){
				addEventListener( Event.ADDED_TO_STAGE, init);
				
			}else{
				init( null);
			}
		}
	}
}

