package 
{
    //import PolygonDrawer.*;
    import flash.display.*;
    import flash.events.*;

    public class PolygonDrawer extends Sprite
    {
        private var target:Object;
        public var num:uint;

        public function PolygonDrawer(param1:Object) : void
        {
            setTarget(param1);
            this.addEventListener(MouseEvent.CLICK, clickFunc);
            return;
        }// end function

        public function clickFunc(event:Event) : void
        {
            var _loc_2:Object = null;
            _loc_2 = event["target"];
            if (_loc_2 is PolygonDrawer)
            {
                this.target.fc_pozset(_loc_2.num);
            }
            else
            {
                trace(_loc_2);
            }
            return;
        }// end function

        private function setTarget(param1:Object):void
        {
            this.target = param1;
            return;
        }// end function

    }
}
