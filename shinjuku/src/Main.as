package 
{
    import flash.display.*;
    import flash.events.*;
	import flash.geom.Matrix;
    import flash.text.*;
	import flash.utils.*;
	import flash.system.LoaderContext;

    dynamic public class Main extends MovieClip
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
		
        public function Main()
        {
			_mulitiLoader = new MultiLoader("main");
			//_mulitiLoader.add("mark.png");
			//_mulitiLoader.add("http://assets.wonderfl.net/images/related_images/2/2e/2e1d/2e1d48a5b5b82cf586183e9689e9592de541fee6",{type:"image",id:"mark",context:new LoaderContext(true)});
			_mulitiLoader.add("mark.png", { type:"image", id:"mark", context:new LoaderContext(true) } );
			_mulitiLoader.addEventListener("complete", atComp);
			_mulitiLoader.start();
			//atComp(null);
            return;
        }// end function
		
		private function atComp(event:Event):void {
			
			
            addFrameScript(0, frame1);
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
				bitmapData.draw(_mulitiLoader.getBitmap("mark.png"),new Matrix(1,0,0,1,-pngCut[i][0],0));
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
            return;
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
