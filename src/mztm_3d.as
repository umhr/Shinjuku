package 
{
    //import mztm_3d.*;

    public class mztm_3d extends Object
    {
        private var _vpnum:Number;

        public function mztm_3d(param1:Number) : void
        {
            _vpnum = param1;
            return;
        }// end function

        public function affine2(param1:Number, param2:Number, param3:Number, param4:Array) : Array
        {
            var _loc_5:Array = null;
            var n_cx:Number = param4[0];
            var n_sx:Number = param4[1];
            var n_cy:Number = param4[2];
            var n_sy:Number = param4[3];
            var n_cz:Number = param4[4];
            var n_sz:Number = param4[5];
            _loc_5 = new Array();
            _loc_5[0] = param1 * (n_cz * n_cy + n_sy * n_sx * n_sz) + param2 * ((-n_sz) * n_cy + n_sy * n_sx * n_cz) + param3 * (n_sy * n_cx) + param4[6];
            _loc_5[1] = param1 * (n_cx * n_sz) + param2 * n_cx * n_cz - param3 * n_sx + param4[7];
            _loc_5[2] = param1 * ((-n_sy) * n_cz + n_cy * n_sx * n_sz) + param2 * (n_sy * n_sz + n_cy * n_sx * n_cz) + param3 * (n_cy * n_cx) + param4[8];
            return _loc_5;
        }// end function

        public function affine(param1:Number, param2:Number, param3:Number, param4:Array) : Array
        {
            var _loc_5:Array = null;
            var n_cx:Number = param4[0];
            var n_sx:Number = param4[1];
            var n_cy:Number = param4[2];
            var n_sy:Number = param4[3];
            var n_cz:Number = param4[4];
            var n_sz:Number = param4[5];
            param1 = param1 + param4[6];
            param2 = param2 + param4[7];
            param3 = param3 + param4[8];
            _loc_5 = new Array();
            _loc_5[0] = param1 * (n_cz * n_cy + n_sy * n_sx * n_sz) + param2 * ((-n_sz) * n_cy + n_sy * n_sx * n_cz) + param3 * (n_sy * n_cx);
            _loc_5[1] = param1 * (n_cx * n_sz) + param2 * n_cx * n_cz - param3 * n_sx;
            _loc_5[2] = param1 * ((-n_sy) * n_cz + n_cy * n_sx * n_sz) + param2 * (n_sy * n_sz + n_cy * n_sx * n_cz) + param3 * (n_cy * n_cx);
            return _loc_5;
        }// end function

        public function pertrans(param1:Array) : Array
        {
            var _loc_2:Number = NaN;
            _loc_2 = _vpnum / (_vpnum + param1[2]);
            return [param1[0] * _loc_2, param1[1] * _loc_2, _loc_2];
        }// end function

    }
}
