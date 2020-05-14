package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author umhr
	 */
	public class Flip extends Sprite 
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
	
}