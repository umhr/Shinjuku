/*
 * ■新宿副都心
 * ビルをクリックするとズームする。
 * キーボードでも操作できる。
 * 大きな画面で見たほうが楽しいです。たぶん。
 * 
 * コードはぐちゃぐちゃで、追う気にもなれない。
 * なぜなら、
 * 4年前に作った＋逆コンパイル＋wonderfl向けに修正だからw
 * 
 * ・ビルの座標データは↓こちらのkmzファイルから取り出し、加工。 
 * Google Earth Wiki@Noblesse-Oblige 
 * http://googleearth-wiki.noblesse-oblige.jp/index.php?%BF%B7%BD%C9%C9%FB%C5%D4%BF%B4
 * 
 * */
package 
{
    import flash.display.*;
    import flash.events.*;
	import flash.geom.Matrix;
    import flash.text.*;
	import flash.utils.*;
	import flash.system.LoaderContext;
	
	[SWF(backgroundColor = 0x99CC66)]
    dynamic public class Forwonderfl extends Sprite
    {
        public var origin_array:Array;
        public var txtcount_uint:uint;
        public var my_timedProcess:uint;
        public var animestep_num:uint;
        public var markcount_uint:uint;
        public var msg_array:Array;
        public var vpcutpoint_num:uint;
        public var chktime0:uint;
        public var sq_array:Array;
        public var txtsprits:Array;
        public var lightpoz_array:Array;
        public var tmc:TextField;
		private var _flip:Flip;
        public var i:uint;
        public var mapbuilding_array:Array;
        public var animecount_num:uint;
        public var poz_array:Array;
        public var g:uint;
        public var h:uint;
        public var vp_num:uint;
        public var chktime1:uint;
        public var mc:PolygonDrawer;
        public var color_num:uint;
        public var sansho_array:Array;
        public var map_array:Array;
        public var sprits:Array;
        public var anime_array:Array;
        public var marksprits:Array;
        public var mztm:mztm_3d;
		/////
		private var _mulitiLoader:MultiLoader;
		private var _markBitmaps:Array;
		
        public function Forwonderfl()
        {
			_mulitiLoader = new MultiLoader("main");
			//_mulitiLoader.add("mark.png");
			_mulitiLoader.add("http://assets.wonderfl.net/images/related_images/2/2e/2e1d/2e1d48a5b5b82cf586183e9689e9592de541fee6",{type:"image",id:"mark",context:new LoaderContext(true)});
			//_mulitiLoader.add("mark.png",{type:"image",id:"mark"});
			_mulitiLoader.addEventListener("complete", atComp);
			_mulitiLoader.start();
			//atComp(null);
        }// end function
		
		private function atComp(event:Event):void {
			
            //addFrameScript(0, frame1);
			frame1();
		}

        public function fc_animator(param1:*) : void
        {
            var _loc_2:uint = 0;
            _loc_2 = 0;
            while (_loc_2 < poz_array.length)
            {
                
                anime_array[_loc_2] = anime_array[_loc_2] * (animestep_num - animecount_num) / animestep_num + poz_array[_loc_2] * animecount_num / animestep_num;
                _loc_2 = _loc_2 + 1;
            }
            if (animecount_num < animestep_num)
            {
                var _loc_4:* = animecount_num + 1;
                animecount_num = _loc_4;
            }
            else
            {
                animecount_num = 1;
                //trace("comp", param1);
				if (param1 == 551) {
                    _flip.gotoAndStop(54);
                    _flip.visible = true;
				}else if (param1 >= 500)
                {
                    _flip.gotoAndStop(param1 % 50 + 1);
                    _flip.visible = true;
                }
                else if (param1 == 0)
                {
                    _flip.gotoAndStop(51);
                    _flip.visible = true;
                }
				
                clearInterval(my_timedProcess);
            }
            fc_create(anime_array);
            return;
        }// end function

        private function frame1():void
        {
            msg_array = new Array("東京都庁", "住友ビル", "新宿中央公園", "新宿モノリス", "パークタワー", "アイランドタワー", "野村ビル");
            origin_array = new Array();
            map_array = new Array();
            map_array[0] = [[0, 11, 16777215, 0], [[ -1000 + 702.819, 423.802, 0], [ -1000 + 680.475, 242.614, 0], [ -1000 + 712.041, 101.491, 0], [ -1000 + 768.836, 6.03237, 0], [ -1000 + 858.124, -1000 + 898.445, 0], [ -1000 + 922.888, -1000 + 611.849, 0], [ -1000 + 987.012, -1000 + 493.189, 0], [82.5106, -1000 + 390.408, 0], [465.853, -1000 + 657.455, 0], [678.553, -1000 + 754.114, 0], [652.764, 112.084, 0], [729.102, 329.448, 0], [503.692, 390.332, 0], [50.095, 545.008, 0], [ -1000 + 833.455, 605.222, 0]]];
			//新宿中央公園[0, 10, 52224, 0,51]
            map_array[1] = [[0, 10, 52224, 0,51], [[-1000 + 752.078, 101.367, 0], [-1000 + 795.02, 22.1271, 0], [-1000 + 885.759, -1000 + 902.981, 0], [-1000 + 952.423, -1000 + 630.227, 0], [38.1394, -1000 + 678.495, 0], [131.14, -1000 + 697.384, 0], [14.7739, 182.69, 0], [-1000 + 877.216, 159.555, 0]]];
            map_array[2] = [[0, 9, 6736896, 0], [[-1000 + 846.785, 573.982, 0], [-1000 + 730.168, 413.932, 0], [-1000 + 707.911, 239.947, 0], [-1000 + 738.077, 121.068, 0], [-1000 + 859.559, 180.444, 0], [42.6008, 212.883, 0], [170.199, -1000 + 679.351, 0], [57.1356, -1000 + 658.42, 0], [-1000 + 962.684, -1000 + 606.637, 0], [14.9897, -1000 + 505.251, 0], [86.3441, -1000 + 427.551, 0], [466.402, -1000 + 691.922, 0], [648.881, -1000 + 775.759, 0], [635.377, -1000 + 927.359, 0], [622.765, 113.712, 0], [695.351, 316.597, 0], [494.975, 368.286, 0], [349.213, 412.663, 0], [51.5322, 518.59, 0]]];
            map_array[3] = [[0, 8, 16777215, 0], [[158.066, 207.139, 0], [280.962, -1000 + 724.172, 0], [158.875, -1000 + 705.522, 0], [133.117, -1000 + 672.843, 0], [181.941, -1000 + 471.868, 0], [220.017, -1000 + 511.228, 0], [178.589, -1000 + 680.654, 0], [316.646, -1000 + 705.931, 0], [188.12, 212.363, 0], [430.658, 254.018, 0], [510.657, -1000 + 931.7, 0], [402.824, -1000 + 914.908, 0], [361.781, 75.8293, 0], [333.944, 64.0906, 0], [417.28, -1000 + 744, 0], [425.544, -1000 + 722.226, 0], [460.537, -1000 + 672.571, 0], [482.871, -1000 + 687.25, 0], [443.956, -1000 + 747.476, 0], [407.673, -1000 + 888.43, 0], [514.111, -1000 + 906.535, 0], [567.447, -1000 + 719.606, 0], [594.457, -1000 + 733.521, 0], [545.806, -1000 + 909.503, 0], [649.207, -1000 + 914.296, 0], [645.476, -1000 + 939.424, 0], [540.638, -1000 + 934.698, 0], [504.459, 82.4805, 0], [633.828, 93.8727, 0], [637.316, 123.358, 0], [496.336, 111.874, 0], [464.281, 250.515, 0], [658.833, 189.848, 0], [671.392, 212.642, 0], [465.296, 275.525, 0], [517.42, 373.501, 0], [493.895, 389.071, 0], [433.741, 278.942, 0], [42.6008, 212.883, 0], [4.85794, 384.47, 0], [10.1159, 424.193, 0], [65.3362, 525.851, 0], [36.4884, 534.447, 0], [-1000 + 981.19, 431.453, 0], [-1000 + 974.354, 378.489, 0], [14.0376, 206.922, 0], [32.1005, 186.409, 0]]];
            map_array[4] = [[0, 7, 16777215, 0], [[72.3245, 37.9221, 0], [80.4897, 12.5468, 0], [215.058, 33.1298, 0], [252.696, -1000 + 887.574, 0], [-1000 + 897.351, -1000 + 833.038, 0], [-1000 + 899.459, -1000 + 808.221, 0], [257.685, -1000 + 863.852, 0], [301.447, -1000 + 703.466, 0], [432.912, -1000 + 722.703, 0], [428.003, -1000 + 746.685, 0], [304.941, -1000 + 726.779, 0], [267.15, -1000 + 864.965, 0], [390.166, -1000 + 885.039, 0], [385.61, -1000 + 912.509, 0], [261.666, -1000 + 891.012, 0], [222.173, 33.7193, 0], [340.758, 53.875, 0], [364.146, 57.9205, 0], [481.03, 77.6103, 0], [486.139, 105.602, 0], [363.007, 84.7732, 0], [323.922, 245.175, 0], [295.358, 239.215, 0], [329.912, 78.5792, 0]]];
            map_array[5] = [[10, 0, 0, 0], [[-1000 + 882.048, 559.369, 15]]];
            map_array[6] = [[10, 0, 0, 1], [[161.114, -1000 + 793.791, 15]]];
            map_array[7] = [[10, 0, 0, 2], [[-1000 + 917.8, 507.847, 15]]];
            map_array[8] = [[10, 0, 0, 3], [[425.11, -1000 + 858.516, 15]]];
            map_array[9] = [[10, 0, 0, 4], [[563.996, 285.579, 15]]];
            map_array[10] = [[10, 0, 0, 5], [[-1000 + 873.345, 508.082, 15]]];
            map_array[11] = [[10, 0, 0, 6], [[526.54, -1000 + 864.19, 15]]];
            map_array[12] = [[10, 0, 0, 7], [[403.264, -1000 + 819.027, 15]]];
            map_array[13] = [[10, 0, 0, 8], [[126.778, -1000 + 474.897, 15]]];
            map_array[14] = [[20, 0, 0, 0], [[141, -60, 270]]];
            map_array[15] = [[20, 0, 0, 1], [[260, 120, 240]]];
            map_array[16] = [[20, 0, 0, 2], [[0, -60, 30]]];
            map_array[17] = [[20, 0, 0, 3], [[465, -1000 + 840, 155]]];
            map_array[18] = [[20, 0, 0, 4], [[61.2598, -1000 + 548.957, 260]]];
            map_array[19] = [[20, 0, 0, 5], [[290, 340, 220]]];
            map_array[20] = [[20, 0, 0, 6], [[546.142, 302.224, 240]]];
            mapbuilding_array = new Array();
            mapbuilding_array.push([[0, 0, 52224, 0], [[20 + 202.51, 148.17, 210], [20 + 194.8, 131.16, 210], [20 + 231.99, 98.21, 210], [20 + 255.37, 101.91, 210], [20 + 271.8, 143.38, 210], [20 + 256.92, 157.16, 210]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[600.11, 303.26, 200], [576.02, 250.57, 200], [613.7, 238.61, 200], [637.07, 292.4, 200]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[526.42, 331.43, 210], [507.98, 290.83, 210], [545.42, 280.02, 210], [564.42, 319.89, 210]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[497, 187.82, 223], [507.25, 146.52, 223], [581.59, 158.67, 223], [571.89, 199.81, 223]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[83.06, 515.05 - 100, 220], [87.5, 496.94 - 100, 220], [96.61, 498 - 100, 220], [98.21, 491.53 - 100, 220], [122.76, 495.46 - 100, 220], [121.46, 501.69 - 100, 220], [130.2, 503.05 - 100, 220], [126.29, 521.52 - 100, 220]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[85.023, 520.893 - 1000, 235], [91.417, 492.72 - 1000, 235], [128.294, 498.381 - 1000, 235], [122.493, 526.486 - 1000, 235]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[56.018, 554.523 - 1000, 215], [63.4057, 523.522 - 1000, 215], [101.562, 529.144 - 1000, 215], [95.5792, 560.153 - 1000, 215]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[54.242, 548.237 - 1000, 200], [58.8796, 528.678 - 1000, 200], [103.389, 534.989 - 1000, 200], [99.6342, 554.77 - 1000, 200]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[72.922, 525.153 - 1000, 195], [74.344, 519.033 - 1000, 195], [106.947, 523.951 - 1000, 195], [105.644, 529.973 - 1000, 195]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[26.757, 590.972 - 1000, 195], [35.159, 557.631 - 1000, 195], [75.3128, 563.284 - 1000, 195], [68.0257, 596.936 - 1000, 195]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[42.994, 559.16 - 1000, 175], [44.573, 552.488 - 1000, 175], [81.0649, 557.729 - 1000, 175], [79.533, 564.131 - 1000, 175]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[34.29, 595.54 - 1000, 180], [36.87, 585.72 - 1000, 180], [24.07, 583.74 - 1000, 180], [29.24, 562.81 - 1000, 180], [41.97, 564.44 - 1000, 180], [67.5, 568.17 - 1000, 180], [77.97, 569.64 - 1000, 180], [73.53, 590.64 - 1000, 180], [61.35, 589.13 - 1000, 180], [58.95, 598.91 - 1000, 180]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[274.932, 289.088, 189], [319.944, 359.148, 189], [286.273, 373.305, 189], [242.609, 302.933, 189]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[446.024, 792.233 - 1000, 165], [460.17, 743.611 - 1000, 165], [523.031, 754.893 - 1000, 165], [509.502, 803.636 - 1000, 165]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[419.251, 855.312 - 1000, 123], [428.06, 822.149 - 1000, 123], [499.033, 834.8 - 1000, 123], [490.562, 867.609 - 1000, 123]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[30 + 274.527, 819.574 - 1000, 134], [30 + 295.59, 737.956 - 1000, 134], [30 + 378.179, 752.021 - 1000, 134], [30 + 357.387, 833.291 - 1000, 134]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[10 + 331.997, 208.454, 225], [10 + 343.411, 166.406, 225], [10 + 412.779, 178.284, 225], [10 + 400.393, 220.692, 225]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[20 + 54.137, 121.586, 117], [20 + 71.5851, 124.045, 117], [20 + 110.207, 176.149, 117], [20 + 107.257, 187.803, 117], [20 + 40.9382, 176.409, 117]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[20 + 55.852, 115.959, 117], [20 + 68.2755, 65.6705, 117], [20 + 133.535, 76.3781, 117], [20 + 130.416, 88.0469, 117], [20 + 92.6287, 82.3254, 117], [20 + 91.738, 85.723, 117], [20 + 84.6793, 90.0835, 117], [20 + 80.1461, 89.5567, 117], [20 + 73.1668, 118.676, 117]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[437.21, 967.406 - 1000, 138], [448.63, 928.386 - 1000, 138], [461.835, 930.938 - 1000, 138], [460.173, 935.825 - 1000, 138], [469.262, 937.626 - 1000, 138], [470.47, 932.765 - 1000, 138], [484.42, 935.579 - 1000, 138], [473.282, 974.226 - 1000, 138], [459.988, 971.536 - 1000, 138], [461.535, 965.905 - 1000, 138], [452.341, 964.32 - 1000, 138], [450.782, 969.892 - 1000, 138]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[388.5, 33.83, 178], [392.01, 21.88, 178], [382.07, 20.28, 178], [393.8, 973.91 - 1000, 178], [410.18, 976.51 - 1000, 178], [406.47, 990.83 - 1000, 178], [417.37, 992.62 - 1000, 178], [405.69, 36.76, 178]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[151.154, -1000 + 940.128, 242], [132.151, -1000 + 915.396, 242], [135.438, -1000 + 913.255, 242], [132.845, -1000 + 910.582, 242], [161.82, -1000 + 895.078, 242], [164.125, -1000 + 898.006, 242], [167.896, -1000 + 896.266, 242], [188.271, -1000 + 918.465, 242], [184.427, -1000 + 920.434, 242], [186.649, -1000 + 923.391, 242], [157.916, -1000 + 940.532, 242], [155.18, -1000 + 937.814, 242]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[132.854, 5.29882, 242], [113.483, -1000 + 981.415, 242], [117.836, -1000 + 979.055, 242], [115.932, -1000 + 975.506, 242], [144.032, -1000 + 961.805, 242], [146.801, -1000 + 964.649, 242], [150.888, -1000 + 962.401, 242], [171.627, -1000 + 985.181, 242], [166.674, -1000 + 987.762, 242], [169.27, -1000 + 991.4, 242], [141.687, 5.9627, 242], [137.921, 2.55649, 242]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[128.364, -1000 + 923.24, 180], [133.363, -1000 + 903.503, 180], [191.256, -1000 + 912.156, 180], [184.805, -1000 + 933.634, 180]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[109.241, -1000 + 988.908, 180], [115.778, -1000 + 968.031, 180], [175.065, -1000 + 978.322, 180], [169.174, -1000 + 997.907, 180]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[140.475, -1000 + 939.887, 180], [152.809, -1000 + 892.052, 180], [176.339, -1000 + 896.661, 180], [165.38, -1000 + 944.086, 180]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[124.092, 3.83769, 180], [135.965, -1000 + 959.86, 180], [161.341, -1000 + 963.943, 180], [147.743, 7.67526, 180]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[133.64, -1000 + 931.373, 210], [143.207, -1000 + 897.359, 210], [184.68, -1000 + 904.985, 210], [174.623, -1000 + 938.067, 210]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[117.384, -1000 + 996.399, 210], [126.112, -1000 + 964.135, 210], [167.482, -1000 + 970.774, 210], [158.92, 3.18783, 210]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[136.299, -1000 + 931.321, 160], [173.197, -1000 + 937.426, 160], [165.077, -1000 + 968.733, 160], [128.057, -1000 + 962.795, 160]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[219.371, -1000 + 793.936, 115], [214.255, -1000 + 814.736, 115], [197.744, -1000 + 811.666, 115], [193.55, -1000 + 826.434, 115], [168.973, -1000 + 821.701, 115], [172.498, -1000 + 809.006, 115], [156.747, -1000 + 807.375, 115], [162.631, -1000 + 784.073, 115]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[226.434, -1000 + 768.02, 130], [220.622, -1000 + 789.846, 130], [163.423, -1000 + 781.22, 130], [169.095, -1000 + 758.913, 130]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[216.396, -1000 + 726.918, 145], [213.354, -1000 + 739.979, 145], [231.627, -1000 + 743.241, 145], [227.39, -1000 + 762.003, 145], [170.782, -1000 + 753.37, 145], [175.908, -1000 + 734.439, 145], [191.16, -1000 + 737.095, 145], [195.103, -1000 + 723.051, 145]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[172.162, -1000 + 781.251, 120], [211.96, -1000 + 789.379, 120], [203.43, -1000 + 821.752, 120], [163.381, -1000 + 814.246, 120]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[171.001, -1000 + 785.437, 135], [177.316, -1000 + 760.282, 135], [218.159, -1000 + 766.639, 135], [211.373, -1000 + 791.677, 135]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[186.575, -1000 + 727.065, 150], [224.049, -1000 + 733.871, 150], [218.146, -1000 + 766.816, 150], [177.272, -1000 + 760.366, 150]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[178.914, -1000 + 822.189, 130], [159.704, -1000 + 797.955, 130], [163.244, -1000 + 795.836, 130], [161.096, -1000 + 793.453, 130], [180.35, -1000 + 782.272, 130], [202.359, -1000 + 783.224, 130], [216.359, -1000 + 800.764, 130], [212.16, -1000 + 803.251, 130], [214.86, -1000 + 806.763, 130], [185.135, -1000 + 822.856, 130], [182.596, -1000 + 820.046, 130]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[184.482, -1000 + 795.974, 145], [166.5, -1000 + 773.048, 145], [171.146, -1000 + 770.368, 145], [168.872, -1000 + 767.146, 145], [187.388, -1000 + 757.325, 145], [212.722, -1000 + 762.741, 145], [223.431, -1000 + 775.754, 145], [219.293, -1000 + 778.019, 145], [221.955, -1000 + 781.53, 145], [192.419, -1000 + 796.817, 145], [189.584, -1000 + 793.163, 145]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[173.678, -1000 + 745.712, 160], [177.781, -1000 + 743.26, 160], [174.819, -1000 + 739.913, 160], [200.921, -1000 + 725.728, 160], [203.94, -1000 + 729.059, 160], [208.786, -1000 + 726.56, 160], [229.421, -1000 + 748.834, 160], [225.25, -1000 + 750.96, 160], [228.323, -1000 + 753.914, 160], [199.78, -1000 + 770.372, 160], [196.464, -1000 + 766.427, 160], [191.959, -1000 + 768.634, 160]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[311.293, 5.25211, 41], [311.983, 2.25499, 41], [309.29, -1000 + 998.153, 41], [307.419, -1000 + 992.847, 41], [306.676, -1000 + 989.019, 41], [306.403, -1000 + 983.831, 41], [307.091, -1000 + 978.47, 41], [308.816, -1000 + 973.183, 41], [310.847, -1000 + 968.97, 41], [313.892, -1000 + 965.091, 41], [316.997, -1000 + 961.511, 41], [320.416, -1000 + 958.296, 41], [323.955, -1000 + 955.773, 41], [324.749, -1000 + 952.564, 41], [356.372, -1000 + 958.076, 41], [343.151, 10.8007, 41]]]);
            mapbuilding_array.push([[0, 0, 52224, 0], [[325.307, 49.3387, 20], [122.383, 14.4959, 20], [124.071, 8.60631, 20], [239.879, 27.9961, 20], [250.627, 27.789, 20], [259.676, 26.2996, 20], [272.019, 22.5064, 20], [282.833, 17.1387, 20], [289.466, 12.2345, 20], [294.857, 6.65348, 20], [300.297, 0.70102, 20], [304.766, -1000 + 995.044, 20], [307.809, -1000 + 989.642, 20], [310.133, -1000 + 982.665, 20], [312.005, -1000 + 975.65, 20], [313.747, -1000 + 969.756, 20], [314.496, -1000 + 964.152, 20], [314.319, -1000 + 955.064, 20], [311.659, -1000 + 947.262, 20], [307.985, -1000 + 940.12, 20], [304.26, -1000 + 933.347, 20], [298.193, -1000 + 926.73, 20], [292.328, -1000 + 922.02, 20], [286.049, -1000 + 916.887, 20], [279.972, -1000 + 913.664, 20], [273.019, -1000 + 909.976, 20], [262.729, -1000 + 906.736, 20], [153.293, -1000 + 888.571, 20], [155.048, -1000 + 882.666, 20], [358.654, -1000 + 915.786, 20], [356.613, -1000 + 922.627, 20], [364.911, -1000 + 923.901, 20], [334.768, 44.0888, 20], [326.659, 43.0596, 20]]]);
            i = new uint();
            i = 0;
            while (i < mapbuilding_array.length)
            {
                
                mapbuilding_array[i][0][4] = i;
                map_array.push(mapbuilding_array[i]);
                h = 0;
                while (h < mapbuilding_array[i][1].length)
                {
                    
                    g = (h + 1) % mapbuilding_array[i][1].length;
                    color_num = new uint();
                    if (h % 4 == 0)
                    {
                        color_num = 10092339;
                    }
                    else if (h % 4 == 2)
                    {
                        color_num = 52224;
                    }
                    else
                    {
                        color_num = 6736896;
                    }
                    map_array.push([[0, 0, color_num, 0, i], [[mapbuilding_array[i][1][h][0], mapbuilding_array[i][1][h][1], 0], [mapbuilding_array[i][1][g][0], mapbuilding_array[i][1][g][1], 0], [mapbuilding_array[i][1][g][0], mapbuilding_array[i][1][g][1], mapbuilding_array[i][1][g][2]], [mapbuilding_array[i][1][h][0], mapbuilding_array[i][1][h][1], mapbuilding_array[i][1][h][2]]]]);
                    var _loc_2:* = h + 1;
                    h = _loc_2;
                }
                var _loc_2b:* = i + 1;
                i = _loc_2b;
            }
			
            origin_array = origin_array.concat(map_array);
            h = 0;
            markcount_uint = new uint();
            txtcount_uint = new uint();
            i = 0;
            while (i < map_array.length)
            {
                
                h = h + map_array[i][1].length;
                if (map_array[i][0][0] == 10)
                {
                    var _loc_2c:* = markcount_uint + 1;
                    markcount_uint = _loc_2c;
                }
                else if (map_array[i][0][0] == 20)
                {
                    var _loc_2d:* = txtcount_uint + 1;
                    txtcount_uint = _loc_2d;
                }
                var _loc_2e:* = i + 1;
                i = _loc_2e;
            }
            //trace(h, markcount_uint, txtcount_uint);
            vp_num = new uint(450);
            vpcutpoint_num = new uint(50);
            lightpoz_array = new Array(0, 0, -450);
            poz_array = new Array(0, 0, 800, 3.14, 0, 0);
            sprits = new Array();
            i = 0;
            while (i < origin_array.length)
            {
                
                mc = new PolygonDrawer(this);
                mc.num = 10;
                this.addChild(mc);
                mc.x = 320;
                mc.y = 240;
                sprits.push(mc);
                var _loc_2f:* = i + 1;
                i = _loc_2f;
            }
			
			var pngCut:Array = [[0,80],[0,80],[80,220],[80,220],[80,220],[220,314],[220,314],[220,314],[220,314],[220,314],[220,314],[220,314]];
			_markBitmaps = [];
            marksprits = new Array();
            i = 0;
            while (i < markcount_uint)
            {
                
                var _loc_2g:* = i + 1;
                i = _loc_2g;
				var bitmapData:BitmapData = new BitmapData(pngCut[i][1]-pngCut[i][0],90,true,0x00000000);
				bitmapData.draw(_mulitiLoader.getBitmap("mark"),new Matrix(1,0,0,1,-pngCut[i][0],0));
				var bitmap:Bitmap = new Bitmap(bitmapData,"auto",true);
				_markBitmaps.push(bitmap);
            }
			
            txtsprits = new Array();
            i = 0;
            while (i < txtcount_uint)
            {
                
                tmc = new TextField();
                txtsprits.push(tmc);
                var _loc_2h:* = i + 1;
                i = _loc_2h;
            }
            sq_array = new Array();
            mztm = new mztm_3d(vp_num);
            sansho_array = new Array();
			
			_flip = new Flip();
            this.addChild(_flip);
            _flip.x = 8;
            _flip.y = 8;
            _flip.visible = false;
			
            animecount_num = new uint(1);
            anime_array = new Array(0, 0, 0, 3.14, 0, 0);
            animestep_num = new uint(60);
            chktime0 = new uint();
            chktime1 = new uint();
            fc_startint(0);
            stage.addEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, fc_keydown);
			
        }// end function

        public function fc_startint(param1:uint) : void
        {
            clearInterval(my_timedProcess);
            animecount_num = 1;
			_flip.visible = false;
            my_timedProcess = setInterval(fc_animator, 30, param1);
            return;
        }// end function

        public function fc_arraycopy(param1:Array) : Array
        {
            var _loc_2:Array = null;
            var _loc_3:Array = null;
            var _loc_4:uint = 0;
            var _loc_5:Array = null;
            var _loc_6:uint = 0;
            _loc_2 = new Array();
            _loc_3 = new Array();
            _loc_4 = 0;
            while (_loc_4 < param1.length)
            {
                
                _loc_3[0] = param1[_loc_4][0].concat();
                _loc_5 = new Array();
                _loc_6 = 0;
                while (_loc_6 < param1[_loc_4][1].length)
                {
                    
                    _loc_5[_loc_6] = param1[_loc_4][1][_loc_6].concat();
                    _loc_6 = _loc_6 + 1;
                }
                _loc_3[1] = _loc_5.concat();
                _loc_2[_loc_4] = _loc_3.concat();
                _loc_4 = _loc_4 + 1;
            }
            return _loc_2;
        }// end function

        public function fc_create(param1:Array) : void
        {
            var _loc_2:Array = null;
            var _loc_3:uint = 0;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Array = null;
            var _loc_11:uint = 0;
            var _loc_12:uint = 0;
            var _loc_13:Number = NaN;
            var _loc_14:Array = null;
            var _loc_15:Array = null;
            var _loc_16:uint = 0;
            var _loc_17:uint = 0;
            var _loc_18:Array = null;
            var _loc_19:* = undefined;
            var _loc_20:* = undefined;
            var _loc_21:* = undefined;
            _loc_2 = new Array();
            _loc_2 = fc_arraycopy(origin_array);
            _loc_3 = new uint();
            _loc_3 = _loc_2.length;
            _loc_4 = Math.cos(param1[3]);
            _loc_5 = Math.sin(param1[3]);
            _loc_6 = Math.cos(param1[4]);
            _loc_7 = Math.sin(param1[4]);
            _loc_8 = Math.cos(param1[5]);
            _loc_9 = Math.sin(param1[5]);
            _loc_10 = new Array(15);
            _loc_10[6] = _loc_8 * _loc_6 + _loc_5 * _loc_7 * _loc_9;
            _loc_10[7] = _loc_5 * _loc_7 * _loc_8 - _loc_9 * _loc_6;
            _loc_10[8] = _loc_7 * _loc_4;
            _loc_10[9] = _loc_4 * _loc_9;
            _loc_10[10] = _loc_4 * _loc_8;
            _loc_10[11] = -_loc_5;
            _loc_10[12] = _loc_6 * _loc_5 * _loc_9 - _loc_7 * _loc_8;
            _loc_10[13] = _loc_7 * _loc_9 + _loc_6 * _loc_5 * _loc_8;
            _loc_10[14] = _loc_4 * _loc_6;
            _loc_11 = 0;
            while (_loc_11 < _loc_3)
            {
                
                _loc_16 = 0;
                while (_loc_16 < _loc_2[_loc_11][1].length)
                {
                    
                    _loc_10[15] = _loc_2[_loc_11][1][_loc_16][0];
                    _loc_10[16] = _loc_2[_loc_11][1][_loc_16][1];
                    _loc_10[17] = _loc_2[_loc_11][1][_loc_16][2];
                    _loc_17 = 0;
                    while (_loc_17 < 3)
                    {
                        
                        _loc_2[_loc_11][1][_loc_16][_loc_17] = _loc_10[15] * _loc_10[6 + 3 * _loc_17] + _loc_10[16] * _loc_10[7 + 3 * _loc_17] + _loc_10[17] * _loc_10[8 + 3 * _loc_17] + param1[_loc_17];
                        _loc_17 = _loc_17 + 1;
                    }
                    _loc_16 = _loc_16 + 1;
                }
                _loc_11 = _loc_11 + 1;
            }
            _loc_12 = new uint(0);
            _loc_13 = new Number(vpcutpoint_num - vp_num);
            _loc_11 = 0;
            while (_loc_11 < _loc_3)
            {
                
                _loc_18 = new Array();
                _loc_16 = 0;
                while (_loc_16 < _loc_2[_loc_11][1].length)
                {
                    
                    if (_loc_2[_loc_11][1][_loc_16][2] < _loc_13)
                    {
                        _loc_17 = 0;
                        while (_loc_17 < 2)
                        {
                            
                            _loc_19 = ((_loc_2[_loc_11][1].length - 1) + _loc_16 + 2 * _loc_17) % _loc_2[_loc_11][1].length;
                            _loc_20 = _loc_16 % _loc_2[_loc_11][1].length;
                            if (_loc_2[_loc_11][1][_loc_19][2] > _loc_13)
                            {
                                var n_wariai:Number = (_loc_13 - _loc_2[_loc_11][1][_loc_20][2]) / (_loc_2[_loc_11][1][_loc_19][2] - _loc_2[_loc_11][1][_loc_20][2]);
                                var n_repointx:Number = (_loc_2[_loc_11][1][_loc_19][0] - _loc_2[_loc_11][1][_loc_20][0]) * n_wariai + _loc_2[_loc_11][1][_loc_20][0];
                                var n_repointy:Number = (_loc_2[_loc_11][1][_loc_19][1] - _loc_2[_loc_11][1][_loc_20][1]) * n_wariai + _loc_2[_loc_11][1][_loc_20][1];
                                _loc_18.push([n_repointx, n_repointy, _loc_13]);
                            }
                            _loc_17 = _loc_17 + 1;
                        }
                    }
                    else
                    {
                        _loc_18.push(_loc_2[_loc_11][1][_loc_16]);
                    }
                    _loc_16 = _loc_16 + 1;
                }
                if (_loc_18.length < 1)
                {
                    _loc_2[_loc_11][0][0] = _loc_2[_loc_11][0][0] + 100;
                }
                else
                {
                    _loc_2[_loc_11][1] = _loc_18.concat();
                }
                _loc_11 = _loc_11 + 1;
            }
            _loc_14 = new Array();
            _loc_11 = 0;
            while (_loc_11 < _loc_3)
            {
                
                _loc_14[_loc_11] = 0;
                if (_loc_2[_loc_11][0][0] >= 100)
                {
                }
                else
                {
                    _loc_16 = 0;
                    while (_loc_16 < _loc_2[_loc_11][1].length)
                    {
                        
                        _loc_14[_loc_11] = _loc_14[_loc_11] + Math.sqrt((_loc_2[_loc_11][1][_loc_16][2] + vp_num) * (_loc_2[_loc_11][1][_loc_16][2] + vp_num) + _loc_2[_loc_11][1][_loc_16][0] * _loc_2[_loc_11][1][_loc_16][0] + _loc_2[_loc_11][1][_loc_16][1] * _loc_2[_loc_11][1][_loc_16][1]) / _loc_2[_loc_11][1].length;
                        _loc_16 = _loc_16 + 1;
                    }
                    _loc_14[_loc_11] = _loc_14[_loc_11] + _loc_2[_loc_11][0][1] * 5000;
                }
                _loc_11 = _loc_11 + 1;
            }
            _loc_15 = new Array();
            _loc_15 = _loc_14.sort(Array.NUMERIC | Array.RETURNINDEXEDARRAY | Array.DESCENDING);
            _loc_11 = 0;
            while (_loc_11 < _loc_3)
            {
                
                if (_loc_2[_loc_11][0][0] >= 100)
                {
                }
                else
                {
                    _loc_16 = 0;
                    while (_loc_16 < _loc_2[_loc_11][1].length)
                    {
                        
                        _loc_2[_loc_11][1][_loc_16] = mztm.pertrans(_loc_2[_loc_11][1][_loc_16]);
                        _loc_16 = _loc_16 + 1;
                    }
                }
                _loc_11 = _loc_11 + 1;
            }
            _loc_17 = 0;
            while (_loc_17 < _loc_3)
            {
                
                _loc_21 = PolygonDrawer(sprits[_loc_17]);
                _loc_21.graphics.clear();
                _loc_11 = _loc_15[_loc_17];
                if (_loc_2[_loc_11][0][0] >= 100)
                {
                    if (_loc_2[_loc_11][0][0] == 120)
                    {
                        _loc_16 = _loc_2[_loc_11][0][3];
                        txtsprits[_loc_16].visible = false;
                        _loc_21.addChild(txtsprits[_loc_16]);
                    }
                    else if (_loc_2[_loc_11][0][0] == 110)
                    {
                        _loc_16 = _loc_2[_loc_11][0][3];
                        //marksprits[_loc_16].visible = false;
                        //_loc_21.addChild(marksprits[_loc_16]);
						
						_markBitmaps[_loc_16].visible = false;
                        _loc_21.addChild(_markBitmaps[_loc_16]);
						
                    }
                }
                else
                {
                    switch(_loc_2[_loc_11][0][0])
                    {
                        case 0:
                        {
                            _loc_21.graphics.beginFill(_loc_2[_loc_11][0][2], 1);
                            _loc_21.graphics.moveTo(_loc_2[_loc_11][1][0][0], _loc_2[_loc_11][1][0][1]);
                            _loc_16 = 1;
                            while (_loc_16 < _loc_2[_loc_11][1].length)
                            {
                                
                                _loc_21.graphics.lineTo(_loc_2[_loc_11][1][_loc_16][0], _loc_2[_loc_11][1][_loc_16][1]);
                                _loc_16 = _loc_16 + 1;
                            }
                            _loc_21.graphics.lineTo(_loc_2[_loc_11][1][0][0], _loc_2[_loc_11][1][0][1]);
                            if (typeof(_loc_2[_loc_11][0][4]) == "number")
                            {
                                _loc_21.num = _loc_2[_loc_11][0][4] + 500;
                            }
                            else
                            {
                                _loc_21.num = 0;
                            }
                            break;
                        }
                        case 10:
                        {
                            _loc_16 = _loc_2[_loc_11][0][3];
							
                            _markBitmaps[_loc_16].visible = true;
                            _markBitmaps[_loc_16].x = _loc_2[_loc_11][1][0][0]-_markBitmaps[_loc_16].width/2;
                            _markBitmaps[_loc_16].y = _loc_2[_loc_11][1][0][1]-_markBitmaps[_loc_16].height/2;
                            _markBitmaps[_loc_16].scaleX = _loc_2[_loc_11][1][0][2]*0.2;
                            _markBitmaps[_loc_16].scaleY = _loc_2[_loc_11][1][0][2]*0.2;
                            _loc_21.addChild(_markBitmaps[_loc_16]);
							
							
                            break;
                        }
                        case 20:
                        {
                            _loc_16 = _loc_2[_loc_11][0][3];
                            txtsprits[_loc_16].visible = true;
                            txtsprits[_loc_16].text = msg_array[_loc_2[_loc_11][0][3]];
                            txtsprits[_loc_16].autoSize = "center";
                            txtsprits[_loc_16].selectable = false;
                            txtsprits[_loc_16].x = _loc_2[_loc_11][1][0][0];
                            txtsprits[_loc_16].y = _loc_2[_loc_11][1][0][1];
                            txtsprits[_loc_16].scaleX = _loc_2[_loc_11][1][0][2];
                            txtsprits[_loc_16].scaleY = _loc_2[_loc_11][1][0][2];
                            _loc_21.addChild(txtsprits[_loc_16]);
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    ;
                    //trace("nonn!");
                }
                _loc_17 = _loc_17 + 1;
            }
            return;
        }// end function

        public function onWheel(event:MouseEvent) : void
        {
            if (event.delta < 0)
            {
                fc_pozset(186);
            }
            else
            {
                fc_pozset(189);
            }
            return;
        }// end function

        public function fc_pozset(param1:uint) : void
        {
            switch(param1)
            {
                case 32:
                {
                    trace(poz_array);
                    break;
                }
                case 37:
                {
                    poz_array[0] = poz_array[0] + 30;
                    break;
                }
                case 39:
                {
                    poz_array[0] = poz_array[0] - 30;
                    break;
                }
                case 38:
                {
                    poz_array[1] = poz_array[1] + 30;
                    break;
                }
                case 40:
                {
                    poz_array[1] = poz_array[1] - 30;
                    break;
                }
                case 186:
                {
                    poz_array[2] = poz_array[2] - 10;
                    break;
                }
                case 189:
                {
                    poz_array[2] = poz_array[2] + 10;
                    break;
                }
                case 48:
                {
                    poz_array = [355, -45, 75, 2.917, 0, 2.864];
                    break;
                }
                case 49:
                {
                    poz_array[2] = poz_array[2] + 30;
                    break;
                }
                case 50:
                {
                    poz_array[2] = poz_array[2] - 30;
                    break;
                }
                case 51:
                {
                    poz_array = [150, 235, 50, 3.14, 0, 1.5708];
					//param1 = 50;
                    break;
                }
                case 52:
                {
                    poz_array = [-390, -20, -175, 3.14, 0, 0];
                    break;
                }
                case 53:
                {
                    poz_array = [-360, -110, -25, 3.14, 0, 0];
                    break;
                }
                case 54:
                {
                    poz_array = [155, 195, -250, 3.14, 0, 2.33435];
                    break;
                }
                case 55:
                {
                    poz_array = [-430, -150, 645, 3.14, 0, 0];
                    break;
                }
                case 56:
                {
                    poz_array = [-70, 315, 445, 3.17183, 0, 1.46406];
                    break;
                }
                case 57:
                {
                    poz_array = [30, -330, 470, 3.14, 0, -1.55972];
                    break;
                }
                case 81:
                {
                    poz_array[3] = poz_array[3] + 1 / (Math.PI * 10);
                    break;
                }
                case 87:
                {
                    poz_array[4] = poz_array[4] + 1 / (Math.PI * 10);
                    break;
                }
                case 69:
                {
                    poz_array[5] = poz_array[5] + 1 / (Math.PI * 10);
                    break;
                }
                case 65:
                {
                    poz_array[3] = poz_array[3] - 1 / (Math.PI * 10);
                    break;
                }
                case 83:
                {
                    poz_array[4] = poz_array[4] - 1 / (Math.PI * 10);
                    break;
                }
                case 68:
                {
                    poz_array[5] = poz_array[5] - 1 / (Math.PI * 10);
                    break;
                }
                case 90:
                {
                    poz_array = [-360, 120, 120, 0.859, 0, 0.604];
                    break;
                }
                case 88:
                {
                    poz_array = [-360, 0, 150, 0, 0, 0];
                    break;
                }
                case 67:
                {
                    poz_array = [270, -30, 105, 0.878563, 0, 2.354];
                    break;
                }
                case 86:
                {
                    poz_array = [-90, -150, 45, 1.738, 0, 6.96949];
                    break;
                }
                case 66:
                {
                    poz_array = [120, 180, -45, 0.655746, 0, 4.39118];
                    break;
                }
                case 78:
                {
                    poz_array = [-270, 30, 255, 1.41969, 0, 5.69625];
                    break;
                }
                case 77:
                {
                    poz_array = [150, 120, 435, 1.13321, 0, 4.2002];
                    break;
                }
                case 82:
                {
                    poz_array = [180, 60, -75, 1.738, 0, 4.2002];
                    break;
                }
                case 84:
                {
                    poz_array = [30, 180, 345, 1.675, 0, -2.0362];
                    break;
                }
                case 89:
                {
                    poz_array = [30, -210, 470, 2.24873, 0, -1.52789];
                    break;
                }
                case 85:
                {
                    poz_array = [240, 90, 15, 1.738, 0, 2.354];
                    break;
                }
                case 73:
                {
                    poz_array = [-240, 90, 105, 1.707, 0, 1.049];
                    break;
                }
                case 79:
                {
                    poz_array = [150, 30, 435, 1.675, 0, -2.45];
                    break;
                }
                case 80:
                {
                    poz_array = [-115, 165, -10, 1.23014, 0, 5.2628];
                    break;
                }
                case 70:
                {
                    poz_array = [180, 0, 285, 1.64251, 0, 4.2002];
                    break;
                }
                case 71:
                {
                    poz_array = [-345, 210, -15, 1.13465, 0, 0];
                    break;
                }
                case 72:
                {
                    poz_array = [-195, -40, -525, 1.07099, 0, 0.859437];
                    break;
                }
                case 74:
                {
                    poz_array = [275, 45, -280, 1.42113, 0, 2.33435];
                    break;
                }
                case 75:
                {
                    poz_array = [270, 240, 195, 1.22937, 0, -2.70465];
                    break;
                }
                case 76:
                {
                    poz_array = [-205, 45, -370, 1.19831, 0, 1.15661];
                    break;
                }
                case 0:
                {
                    poz_array = [0, 0, 800, 3.14, 0, 0];
                    break;
                }
                case 500:
                {
                    poz_array = [150, 235, 50, 3.14, 0, 1.5708];
                    break;
                }
                case 501:
                {
                    poz_array = [90, 130, 425, 1.67577, 0.190986, -1.90986];
                    break;
                }
                case 502:
                {
                    poz_array = [575, -315, -190, 3.14, 0.1273, 3.1619];
                    break;
                }
                case 503:
                {
                    poz_array = [-60, 100, 515, 1.61211, 0.190986, -1.40056];
                    break;
                }
                case 504:
                {
                    poz_array = [240, 120, 165, 1.2605, 2.069, 4.8368];
                    break;
                }
                case 505:
                case 506:
                case 507:
                case 508:
                case 509:
                case 510:
                case 511:
                {
                    poz_array = [-240, -60, 200, 2.121, -1.496, -1.114];
                    break;
                }
                case 512:
                {
                    poz_array = [210, 180, 135, 1.19687, -0.477465, 2.95879];
                    break;
                }
                case 513:
                {
                    poz_array = [-120, -90, 470, 2.02592, -0.350141, -1.24141];
                    break;
                }
                case 514:
                {
                    poz_array = [105, -60, -765, 1.32563, -0.254648, 1.81437];
                    break;
                }
                case 515:
                {
                    poz_array = [-345, 210, -15, 1.13465, 0, 0];
                    break;
                }
                case 516:
                {
                    poz_array = [270, 240, 195, 1.22937, 0, -2.70465];
                    break;
                }
                case 517:
                {
                    poz_array = [210, 30, -220, 2.2805, -0.03183, 2.1008];
                    break;
                }
                case 518:
                {
                    poz_array = [30, 150, -255, 0.94222, -0.09549, 3.9137];
                    break;
                }
                case 519:
                {
                    poz_array = [210, 180, 105, 1.26, -0.0954, 4.295];
                    break;
                }
                case 520:
                {
                    poz_array = [-390, 10, -175, 3.14, 0, 0];
                    break;
                }
                case 521:
                case 522:
                case 523:
                case 524:
                case 525:
                case 526:
                case 527:
                case 528:
                case 529:
                {
                    poz_array = [5, 165, -10, 1.2301, 0, 4.9444];
                    break;
                }
                case 530:
                case 531:
                case 532:
                case 533:
                case 534:
                case 535:
                case 536:
                case 537:
                case 538:
                {
                    poz_array = [-210, 190, -205, 2.312, 0.509, 1.4];
                    break;
                }
                case 539:
                case 540:
                {
                    poz_array = [-195, -40, -525, 1.07099, 0, 0.859437];
                    break;
                }
                case 551:
                {
                    poz_array = [-55, 195, 140, 1.51662, -0.063662, 1.15661];
                    break;
                }
                default:
                {
                    break;
                }
            }
            fc_startint(param1);
            return;
        }// end function

        public function myTimer() : void
        {
            var _loc_1:Date = null;
            _loc_1 = new Date();
            chktime1 = _loc_1.getMinutes() * 60000 + _loc_1.getSeconds() * 1000 + _loc_1.setMilliseconds();
            //label.text = chktime1 - chktime0;
            chktime0 = chktime1;
            return;
        }// end function

        public function fc_keydown(event:KeyboardEvent) : void
        {
            fc_pozset(event.keyCode);
            return;
        }// end function

    }
}
//Flip.as
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author umhr
	 */
	class Flip extends Sprite 
	{
		private var _textField:TextField;
		public function Flip():void {
			_textField = new TextField();
			_textField.width = 250 - 16;
			_textField.defaultTextFormat = new TextFormat("_sans", 9);
			_textField.multiline = true;
			_textField.wordWrap = true;
			_textField.x = 8;
			_textField.y = 8;
			_textField.selectable = false;
			_textField.autoSize = "left";
			this.addChild(_textField);
		}
		public function gotoAndStop(num:int):void {
			_textField.htmlText = getText(num);
			this.graphics.clear();
			this.graphics.beginFill(0xFFFFFF, 0.75);
			this.graphics.drawRoundRect(0, 0, _textField.width + 16, _textField.height + 16, 8, 8);
			this.graphics.endFill();
		}
		private function getText(num:int):String {
			var txt:String = "";
			switch (num) {
			case 0:
				txt = "";
				break;
			case 1:
				txt = "新宿住友ビルディング\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Shinjuku_SumitomoBuilding_2007-02.jpg/150px-Shinjuku_SumitomoBuilding_2007-02.jpg' width='100' height='208'>住友不動産が経営している。通常は新宿住友ビルと呼ばれている。また、単に住友ビルと呼ばれたり、当ビルディングの愛称でもある三角ビルとも呼ばれたりする。新宿高層ビル街の草分け的存在で、ビル内には多くの企業がテナントとして入り、上層部は飲食店（48階から52階）・展望室があり、観光スポットとしての顔も持つ。完成当時は日本一の高さを誇ったが、直後に新宿三井ビルディングが完成し、すぐに抜かれてしまった。また、住友ビルは日本の高層ビルでは初めて200mの高さを越えたビルであり、この住友ビルを皮切りに、以降、新宿を始め、東京各地、神奈川県、大阪府、愛知県等に200m級の高層ビルが建つ様になった。\nビルの構造と形が特徴的。階層部は中央が吹きぬけ、すなわち周辺部のみのフロアとなる。また外観が三角形に見える事から（実際は三角形の頂点を削った六角形）、三角ビルの愛称を持つ。\nまた、非常用エレベーターが利用者から見える、珍しい構造となっている（通常は荷物の搬送に使われており、一般利用者は使用禁止となっている）。";
				break;
			case 2:
				txt = "損保ジャパン本社ビル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Sompo_Japan_Insurance_Office_Building2007-02.jpg/200px-Sompo_Japan_Insurance_Office_Building2007-02.jpg' width='100' height='174'>損害保険ジャパンの本社ビルで、新宿高層ビル街の一群を担う超高層ビルの一つとしても認知されている。42階は、旧安田火災（損害保険ジャパンの前身）と親交が深かった東郷青児のコレクションを中心とした損保ジャパン東郷青児美術館になっている。\n1976年に安田火災海上本社ビルとしてオープン。1978年に第19回BCS賞を受賞。2002年の損保ジャパン発足に伴い名称変更。42階の美術館と1階の伊予銀行新宿支店（旧安田火災社長だった三好武夫が愛媛県出身だったため設置）を除き、部外者の立ち入りは出来ない。\n白と茶色のツートーンカラーに、裾がスカートのように広がった形をしているビル。”パンタロンビル”の名で呼ぶ人もいる。新宿野村ビルと隣接している。デザインは芙蓉グループのシンボルマークである富士山をモデルに設計したとも言われている。";
				break;
			case 3:
				txt = "新宿野村ビルディング\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Shinjuku_Nomura_Building_20070311-01.jpg/240px-Shinjuku_Nomura_Building_20070311-01.jpg' width='100' height='235'>野村不動産が経営している。通常は、新宿野村ビル。また新宿界隈では単に野村ビルと呼ばれたりもする。\n新宿高層ビル街の代表的な存在で、ビル内には多くの企業がテナントとして入っている。地下(B1・B2)と上層階(49F・50F)には飲食店やコンビニなどが入っており、50Fには展望ロビーがある。ビルの前の広場では、休日にフリーマーケットなどのイベントが行われることもある。\n白を基調に青緑色のガラスが特徴のビルで、隣接して損保ジャパンビルがある。新宿駅から都庁方面へ地下道を通り、新宿センタービルとの連絡通路を経由すると、少し遠回りになるが雨の日でも濡れずにアクセスできる。\n2006年5月に地下商業フロアの大規模リニューアルを行っており、あわせて人通りの多い「新宿警察署裏」交差点から直接地下店舗へのアクセスが可能になるよう、階段とエスカレーターを新設した。";
				break;
			case 4:
				txt = "新宿センタービル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Shinjuku_Center_Building_20070311-05_cropped.jpg/240px-Shinjuku_Center_Building_20070311-05_cropped.jpg' width='100' height='201'>東京建物、朝日生命、明治安田生命が経営している。新宿界隈では単に、センタービルと呼ばれている。茶色で統一された落ち着いた色調のビル。地下にある飲食店街を経由し、連絡通路を通ると、新宿野村ビルへ行くことができる。 高さは隣の新宿三井ビルより2メートル低いが本ビルの1階部分が三井ビルより高い位置からあるため実際は高く見える。\nビル内には多くの企業がテナントとして入り、上層部は飲食店・展望室があり、観光スポットとしての顔も持つ。また日本テレビ・フジテレビ・テレビ朝日の予備送信所も同ビルに置かれている。";
				break;
			case 5:
				txt = "新宿オークシティ\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Shinjuku_oak_city_cropped.jpg/250px-Shinjuku_oak_city_cropped.jpg' width='100' height='133'>東京都新宿区西新宿の新宿新都心の一角にある超高層ビルなどが集まった施設の総称。いずれも淀橋浄水場の跡地ではなく、地元再開発で生まれたビル群である。新宿区立淀橋第二中学校（合併・廃校）の跡地に竣工された。\n住友不動産が経営する住友不動産新宿オークタワーと日本土地建物が経営する日土地西新宿ビル、新宿区内の中小企業の振興を目的とした新宿区立産業会館(BIZ新宿）、住居棟（高級マンション）であるオークコート、青梅街道側に飲食店が軒を連ねる区画であるオークテラスからなっている。中心的な建物である住友不動産新宿オークタワーと日土地西新宿ビルは、多くの企業がテナントとして入り、ビル内には飲食店なども入っている。"
				break;
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
				txt = "新宿パークタワー\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Shinjuku_Park_Tower_7_Desember_2003_cropped2.jpg/240px-Shinjuku_Park_Tower_7_Desember_2003_cropped2.jpg' width='100' height='166'>テナントの多くはオフィスであるが、最上部がホテル（パークハイアット東京）、低層部はショールーム (OZONE) となった複合した、N棟･S棟･C棟の3棟からなる高層ビルである。新宿高層ビル群の中では、日が浅いが、ビジネスマン以外の人でも多くの人が来訪するビルである。設計は、近隣にある東京都庁舎と同じ丹下健三で、独特のデザインのビルでもある。また、元々当地は東京ガスのガスタンクが在った場所で、東京ガスがこのビルを所有しているため、東京ガス関連の施設も入っているほか、敷地内には、新宿新都心地区内に熱供給を行なっている地域冷暖房センターが設けられている。新宿では、都庁第一庁舎とNTTドコモ代々木ビルに次いで3番目に高いビルである。";
				break;
			case 13:
				txt = "新宿アイランドタワー\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Shinjuku_iland_tower_cropped.jpg/200px-Shinjuku_iland_tower_cropped.jpg' width='100' height='166'>東京都新宿区西新宿六丁目の新宿新都心の一角にある超高層ビル。都市再生機構が運営している。新宿アイランドタワーを中心に、職住一体型のコンドミニアムや店舗などが複合した区域を形成しており、全体では「新宿アイランド（Shinjuku i-Land）と呼ばれる。";
				break;
			case 14:
				txt = "KDDIビル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/KDDI_Office_Building_Shinjuku_2007-01_cropped.jpg/200px-KDDI_Office_Building_Shinjuku_2007-01_cropped.jpg' width='100' height='166'>新宿高層ビル街の一群を担う超高層ビルの一つとしても広く認知されている。新宿高層ビルの中でも古くからある存在で、中には重要なライフラインである通信機器設備があるため（国際電話回線の手動接続オペレーション室もここにある）、関東大震災クラスの10倍の地震でも十分耐えられるような頑強な造りをしたビルとして、当時は話題となった。後の日本の高層ビル建築にも影響をあたえたビルとして知られている。\n全体がメタリックシルバーの色調で覆われたビル。幅と奥行きが他のビルと比べて、差がない。正面入り口付近には、竣工のさいにデンマークのグレート・ノーザン・テレグラフ社から贈られた記念碑がある。冬季にビル上部から氷塊が落ちてくることがあり、注意を呼びかける看板が設置されている。";
				break;
			case 15:
				txt = "新宿モノリスビル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Shinjuku_monolith_building_cropped.jpg/200px-Shinjuku_monolith_building_cropped.jpg' width='100' height='166'>新宿モノリスビル（しんじゅく - ）は、東京都新宿区西新宿の新宿新都心の一角にある超高層ビル。自治体初（東京都）の土地信託のビルとして、安田信託銀行（現みずほ信託銀行）、三菱信託銀行（現三菱UFJ信託銀行）、住友信託銀行が経営を担当している。ビル内には多くの企業がテナントとして入り、飲食店なども多い。\n1991年に公開された『ゴジラvsキングギドラ』では、ゴジラによって破壊されるシーンが描かれた。";
				break;
			case 16:
				txt = "新宿NSビル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Shinjuku_NS_building_cropped.jpg/300px-Shinjuku_NS_building_cropped.jpg' width='100' height='133'>NSの名前の由来は、事業主の日本生命と住友不動産のそれぞれの頭文字をとっている。白を基調に、上部に独特な採光施設がある。一角にレインボーカラーの展望エレベーターが見えるのが特徴。このエレベーターは1 - 29・30階を直通運転している。29階には飲食店（スカイレストラン）30階部分はスカイカンファレンス（会議室）になっている。以前、30階部分にあった飲食店の店舗は29階または1階に移転、または閉店している。1階と地階フロアを除き階層部は全て吹きぬけという構造で（つまり階層部は周辺部のみのフロア）の為、29階には対岸への渡り廊下がある。";
				break;
			case 17:
				txt = "新宿三井ビルディング\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Shinjuku_Mitsui_Building_2009_02.jpg/300px-Shinjuku_Mitsui_Building_2009_02.jpg' width='100' height='125'>高さは軒高210メートル、最頂部225メートル。 黒を基調としたガラス張りのビルで、新宿の超高層ビル群の中でもひときわ目立つ外観。竣工当初の塔屋は黒だったが現在は白となっている。隣の新宿センタービルより高さ自体は2メートル高いが、新宿センタービルの1階より随分低い位置に本ビルの1階があるため、実際は低くなって見える。\nビル側面にあるX形の鉄骨は、耐震補強の為の筋交いであると共に、各階の両端に設けた機械室の扉の押さえを兼ねている。機械室の扉は4~5階分を1枚にまとめており、これを開くことで空調などの機械を容易に交換できるようになっている[2]。また京王プラザホテルの設計を取り入れ、非常階段の一部を外部に剥き出しに設置し、火災時の煙が非常階段内に溜まらない設計が取り入れられている。";
				break;
			case 18:
				txt = "小田急第一生命ビルディング\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Shinjuku_dai-ichi-life_Building_20070317_cropped.jpg/300px-Shinjuku_dai-ichi-life_Building_20070317_cropped.jpg' width='100' height='166'>隣接してあるハイアットリージェンシー東京とのツインビルになっている。新宿高層ビル街の代表的な存在で、ビル内には多くの企業がテナントとして入り、地下部には飲食店などがある。外観の通り三角形の建物で、通常の建物と勝手が異なる。そのためか、内部を歩くとたびたび迷う。また、ハイアットリージェンシー東京との間のオープンスペース（スペースセブン）では、イベントが行われる事がある。";
				break;
			case 19:
				txt = "ハイアットリージェンシー東京\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Centuryhyatt_Tokyo_Building-2007_cropped.jpg/225px-Centuryhyatt_Tokyo_Building-2007_cropped.jpg' width='100' height='133'>1980年9月15日に日本初のハイアットホテル「ホテルセンチュリーハイアット」として新宿副都心の小田急センチュリービルに開業した。2001年3月30日には「センチュリーハイアット東京」に名称変更したが、2007年10月1日、「ハイアット リージェンシー 東京」に再変更した。\nスイートルーム18室を含む全744室。7つの個性的レストラン・バー、スパ、プール&フィットネスがある。\nエントランスを入ったロビー天井にはクリスタル製、1基5,000万円(1980年当時の価格）といわれるシャンデリアが3基ある。";
				break;
			case 20:
			case 21:
				txt = "京王プラザホテル\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Keio_Plaza_Hotel_-_ShinjukuBuilding_2007-02_cropped.jpg/240px-Keio_Plaza_Hotel_-_ShinjukuBuilding_2007-02_cropped.jpg' width='100' height='166'>淀橋浄水場の再開発により生まれた新宿の超高層ビル群の先駆け的存在であるとともに、日本初の超高層ホテル。1971年6月5日に本館が開業し、1980年11月1日には南館が開業した。高さは本館が178メートル、南館が138メートル。客室総数1450の巨艦ホテルである。帝国・オークラ・ニューオータニの旧御三家や、ハイアット・フォーシーズンズ・ウェスティンの新御三家とは一線を画した営業を行う。\n2008年11月21日、「ミシュランガイド東京日本語版2009」の「快適なホテル格付け順」で、「黒い家マーク3つ」を獲得した。\n1971年の開業後、1974年に新宿住友ビルに抜かれるまでは、日本で最も高い超高層ビルであった。その後もホテル単体の建物としての高さは長らく日本一の座を誇っていたが、1993年の幕張プリンスホテル（現 APAホテル&リゾート東京ベイ幕張）完成により日本一の座を譲った。最上階の47階は有料の展望台として一般に公開されていたが、現在はカラオケフォーティーセブンとなっている。";
				break;
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
			case 30:
			case 31:
				txt = "東京都庁舎　第一本庁舎\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tokyo_Metropolitan_Government_Building_No.1_200908.jpg/300px-Tokyo_Metropolitan_Government_Building_No.1_200908.jpg' width='100' height='108'>第一本庁舎は高さ243 mで、完工時にサンシャイン60を抜き、日本一の高さを誇った。その後、日本一の座を横浜ランドマークタワー（1993年完工、296m）に、東京一の座を六本木のミッドタウン・タワー（2007年完工、248m）に譲った。 着工から完工当時の東京都知事は鈴木俊一。バブル経済の最中に計画された当時日本一の超高層ビルであり、「バベルの塔」をもじって「バブルの塔」、また投入された税金から「タックス・タワー」と揶揄されることもあるが、反面、東京の観光名所の一つとして展望室に訪れる人が絶えない。夜間はライトアップされる。";
				break;
			case 32:
			case 33:
			case 34:
			case 35:
			case 36:
			case 37:
			case 38:
			case 39:
			case 40:
			case 41:
			case 42:
			case 43:
			case 44:
			case 45:
			case 46:
			case 47:
			case 48:
			case 49:
			case 50:
				txt = "東京都庁舎　第二本庁舎・都議会議事堂\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Building_of_Tokyo_Metropolitan_Assembly_2_7_Desember_2003.jpg/250px-Building_of_Tokyo_Metropolitan_Assembly_2_7_Desember_2003.jpg' width='225' height='168'>2006年2月、建設から約16年にして、雨漏りがひどく、その補修に1000億円近くかかることが記事にされる。特別にデザインして作られており、既存の補修方法では対応が難しいのが、補修費用の高騰に拍車を乗けているとのこと[1]。\n建設費に約1600億円かかっており、今後どう対応するかが注目される。都庁舎における雨漏りは、エキスパンションジョイントの劣化や施工不良によるコールドジョイントが主な原因であり、前述の通り特殊な意匠を施した都庁舎では、従来の工法とは異なる全く新しい工法による補修が必要となるため、全面的な建て替えをすべきという声も上がっている。東京都の財政規模を勘案すれば、都庁舎の建て替えは決して不可能ではないが、東京の財政は逼迫しており、建て替えは財政面で困難である。";
				break;
			case 51:
			case 52:
			case 53:
				txt = "西新宿\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Skyscrapers_of_Shinjuku_2009_January.jpg/480px-Skyscrapers_of_Shinjuku_2009_January.jpg' width='120' height='64'>西新宿の範囲は新宿駅の西口から、渋谷区と中野区の区境付近までで、日本でも屈指のターミナル駅である新宿駅の西側一帯の地域である。繁華街のほか新宿新都心（副都心）と呼ばれる超高層ビル街がある。超高層ビル群は日本最大級のオフィス街を形成しているが、周辺には再開発されていない古くからの住宅街も存在する。\n西新宿の名の由来は、新宿地区の西に位置することからであるが、この名称になったのは1970年の住居表示が実施されてからで、それ以前この地の大半（西新宿一 - 六丁目）は角筈（つのはず）と呼ばれていた。これはかつての角筈村の範囲、南豊島郡淀橋町発足後は大字角筈の範囲に基づく。また青梅街道の北側（西新宿七 - 八丁目）は柏木（かしわぎ）一丁目と呼ばれていた[1]。これらの地名は、新宿区特別出張所やバス停の名称などに未だに見られる。また、新町（しんまち）・成子（なるこ）町・十二社（じゅうにそう）・辻・幡谷前・豊水・添地町・五十人町といった字（あざな）も過去にみられ、いずれも史跡やバス停などの名称、現地の通称として残っているものもある。";
				break;
			case 54:
				txt = "新宿中央公園\n<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Stairs_in_the_Shinjuku_Central_Park_by_mrhayata.jpg/300px-Stairs_in_the_Shinjuku_Central_Park_by_mrhayata.jpg' width='120' height='80'>西新宿の新宿高層ビル群の一角にあり、付近の貴重な緑地として、当地界隈に勤めるビジネスマンなどにも馴染みの公園である。また、開園当初よりドラマの撮影などが頻繁に行われており、撮影現場を見かけることも多い（有名なところでは｢キイハンター」や「太陽にほえろ」）。新宿ナイアガラの滝と前の広場は、公園のシンボル的な存在でドラマや特撮アニメの撮影でも登場する。\n元々当地は、現在隣接する熊野神社の敷地の一部であり、戦前には小西六写真工業（現:コニカミノルタ）の工場敷地などになっていた。それに、戦後新宿副都心計画の一環として、淀橋浄水場の跡地と併せて、西新宿に勤めるサラリーマンなどへの憩いの場として公園として整備されることになった。公園の北端には新宿区立環境学習情報センターと新宿区立区民ギャラリーの複合施設エコギャラリー新宿が設けられた。"
				break;
			default:
			txt = "";
			}
			txt += "（出典：wikipedia）";
			//txt += String(num);
			return txt;
		}
	}
	

//MulitLoader.as
	/**
	 * Fileローダー
	 * ...
	 * @author umhr
	 */
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.Security;
	import flash.utils.Dictionary;

	class MultiLoader{
		public static var IMAGE_EXTENSIONS:Array = ["swf", "jpg", "jpeg", "gif", "png"];
		public static var TEXT_EXTENSIONS:Array = ["txt", "js", "xml", "php", "asp", "pat"];
		public static const COMPLETE:String = "complete";
		private var _listener:Function = function(event:Event):void{};
		private var _loads:Dictionary;
		private var _keyFromId:Dictionary;
		private var _loadCount:int;
		private var _itemsLoaded:int;
		public var items:Array;
		public function MultiLoader(name:String){
			_loads = new Dictionary();
			_keyFromId = new Dictionary();
			_itemsLoaded = 0;
			items = [];
		}
		public function add(url:String, props:Object = null):void {	
			var loadingItem:LoadingItem = new LoadingItem();
			loadingItem.url = url;
			loadingItem.type = getType(url, props);
			if(props){
				if(props.context){
					loadingItem.context = props.context;
				}
				if (props.id) {
					_keyFromId[props.id] = url;
				}
				if (props.preventCache) {
					loadingItem.preventCache = props.preventCache;
				}
			}
			items.push(loadingItem); 
		}
		private function getType(url:String, props:Object = null):String{
			var result:String = "";
			if (props && props.type) {
				return props.type;
			}
			var i:int;
			var extension:String;
			var n:int = IMAGE_EXTENSIONS.length;
			for (i = 0; i < n; i++) {
				extension = IMAGE_EXTENSIONS[i];
				if(extension == url.substr(-extension.length).toLowerCase()){
					result = "image";
					break;
				}
			}
			if(result == ""){
				n = TEXT_EXTENSIONS.length;
				for (i = 0; i < n; i++) {
					extension = TEXT_EXTENSIONS[i];
					if(extension == url.substr(-extension.length).toLowerCase()){
						result = "text";
						break;
					}
				}
			}
			return result;
		}
		
		public function start():void{
			var n:int = items.length;
			for (var i:int = 0; i < n; i++) {
				var type:String = items[i].type;
				var url:String = items[i].url;
				url += (items[i].preventCache)?"?rand=" + Math.random():"";
				var uRLRequest:URLRequest = new URLRequest(url);
				if(type == "image"){
					_loads[items[i].url] = loadImage(uRLRequest, items[i].context);
				}if(type == "text"){
					_loads[items[i].url] = loadText(uRLRequest);
				}
			}
		}
		public function addEventListener(type:String,listener:Function):void{
			_listener = listener;
		}
		public function getBitmap(key:String):Bitmap{
			key = keyMatching(key);
			var bitmap:Bitmap = _loads[key].content;
			return bitmap;
		}
		public function getBitmapData(key:String):BitmapData{
			key = keyMatching(key);
			var bitmap:Bitmap = getBitmap(key);
			var bitmapData:BitmapData = new BitmapData(bitmap.width, bitmap.height);
			bitmapData.draw(bitmap);
			return bitmapData;
		}
		private function loadImage(url:URLRequest, context:LoaderContext = null):Loader {
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComp);
			loader.load(url,context);
			return loader;
		}
		public function getText(key:String):String {
			key = keyMatching(key);
			return key?_loads[key].data:key;
		}
		public function getXML(key:String):XML {
			return XML(getText(key));
		}
		private function keyMatching(key:String):String {
			return _loads[key]?key:_keyFromId[key];
		}
		
		private function loadText(url:URLRequest):URLLoader{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComp);
			loader.load(url);
			return loader;
		}
		private function onComp(event:Event):void{
			_itemsLoaded ++;
			if (_itemsLoaded == items.length) {
				_itemsLoaded = 0;
				_listener(event);
			}
		}
		public function get itemsTotal():int{
			return items.length;
		}
		public function get itemsLoaded():int{
			return _itemsLoaded;
		}
		public function get loadedRatio():Number {
			return _itemsLoaded / items.length;
		}
	}


import flash.net.URLRequest;
import flash.system.LoaderContext;
class LoadingItem{
	public var url:String;
	public var preventCache:Boolean;
	public var type:String;
	public var status:String;
	public var context:LoaderContext;
	public function LoadingItem(){};
}

//mztm_3d.as
    //import mztm_3d.*;

    class mztm_3d extends Object
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

//PolygonDrawer.as
    import flash.display.*;
    import flash.events.*;

     class PolygonDrawer extends Sprite
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
