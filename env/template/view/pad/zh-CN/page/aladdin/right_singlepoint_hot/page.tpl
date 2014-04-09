{%extends 'c_right_base.tpl'%} {%block name='content'%}<style>{%fe_fn_c_css css='input'%}{%fe_fn_c_css css='tabs'%}{%fe_fn_c_css css='btn'%}.opr-singlepoint-hot-map{height:146px;background:url(http://api.map.baidu.com/staticimage?center={%$tplData.point[0].lng|escape:'url'%},{%$tplData.point[0].lat|escape:'url'%}&width=351&height=146&zoom=15) 0 0 no-repeat}.container_s .opr-singlepoint-hot-map{background:url(http://api.map.baidu.com/staticimage?center={%$tplData.point[0].lng|escape:'url'%},{%$tplData.point[0].lat|escape:'url'%}&width=259&height=146&zoom=15) 0 0 no-repeat}.opr-singlepoint-hot-map .BMap_cpyCtrl{display:none}.opr-singlepoint-hot-hot-level-lable{font-weight:bold}.opr-singlepoint-hot-hot-level-tag{font-weight:bold;color:#fff;font-weight:normal;width:68px;display:inline-block;padding-left:2px}.opr-singlepoint-hot-hot-level-yongji{background-color:#f13e41}.opr-singlepoint-hot-hot-level-miji{background-color:#f4c537}.opr-singlepoint-hot-hot-level-xishao{background-color:#54c279}.opr-singlepoint-hot-hot-level-{%*i*%}icon{position:relative;top:-2px;width:5px;height:5px;overflow:hidden;display:inline-block}.opr-singlepoint-hot-hot-level-explanation{color:#666}.opr-singlepoint-hot-input-container{float:left}.opr-singlepoint-hot-btn-container{float:left}.opr-singlepoint-hot-content .opr-singlepoint-hot-input{width:201px}.opr-singlepoint-hot-input-container{float:none}.opr-singlepoint-hot-btn-container{float:none;margin:10px 0 0 0}</style>{%$hotmapurl = 'spotshot.baidu.com'%}{%if $tplData.poiname || strpos($tplData.point[0].link, $hotmapurl) !== false%} <div class="cr-title c-gap-bottom">人群密度分布信息</div><div class="c-gap-bottom-small"><span class="opr-singlepoint-hot-hot-level-lable">人群拥挤度</span><span class="c-gap-left-small opr-singlepoint-hot-hot-level-tag"></span></div><div class="c-gap-bottom-small opr-singlepoint-hot-hot-level-explanation"><span class="opr-singlepoint-hot-hot-level-icon opr-singlepoint-hot-hot-level-yongji">&nbsp;</span>&nbsp;拥挤<span class="c-gap-left opr-singlepoint-hot-hot-level-icon opr-singlepoint-hot-hot-level-miji">&n{%*i*%}bsp;</span>&nbsp;密集<span class="c-gap-left opr-singlepoint-hot-hot-level-icon opr-singlepoint-hot-hot-level-xishao">&nbsp;</span>&nbsp;稀少</div> {%else%} {%if $tplData.title%} <div class="cr-title c-gap-bottom">地图信息</div> {%/if%}{%/if%}<div class="opr-singlepoint-hot-map"></div>{%if !$tplData.addrlist%}<div class="c-gap-top-small"> <div class="c-tabs opr-singlepoint-hot-tabs c-gap-bottom"><ul class="c-tabs-nav"><li class="c-tabs-nav-li c-tabs-nav-selected" data-click="{fm: 'beha'}">到这里去</li><li class="c-tabs-nav-li" data-click="{fm: 'beha'}">从这里出发</li></ul><div class="c-tabs-content opr-singlepoint-hot-content c-gap-top c-clearfix"><div class="opr-singlepoint-hot-input-container"><p><input class="c-input opr-singlepoint-hot-input" placeholder="输入起点"  data-placeholder="输入起点" /></p></div><div cl{%*i*%}ass="opr-singlepoint-hot-btn-container c-gap-left"><span class="c-gap-right"><button class="c-btn c-btn-primary opr-singlepoint-hot-btn" data-d="bus" data-b="en">公交</button></span><span><button class="c-btn c-btn-primary opr-singlepoint-hot-btn" data-d="nav" data-b="en">驾车</button></span></div></div><div class="c-tabs-content opr-singlepoint-hot-content c-gap-top c-clearfix" style="display:none;"><div class="opr-singlepoint-hot-input-container"><p><input class="c-input opr-singlepoint-hot-input"{%*i*%} placeholder="输入终点"  data-placeholder="输入终点" /></p></div><div class="opr-singlepoint-hot-btn-container c-gap-left"><span class="c-gap-right"><button class="c-btn c-btn-primary opr-singlepoint-hot-btn" data-d="bus" data-b="sn">公交</button></span><span><button class="c-btn c-btn-primary opr-singlepoint-hot-btn" data-d="nav" data-b="sn">驾车</button></span></div></div></div> {%if $tplData.tel%} <div> 电话：<span class="opr-singlepoint-hot-tel-s">{%$tplData.tel|limitlen:30%}</span> </div> {%/if%} {%if $tplData.address%} <div title="{%$tplData.address%}"> 地址：<span class="opr-singlepoint-hot-address-s">{%$tplData.address|limitlen:36%}</span> </div> {%/if%} <div title="{%$tplData.address%}"> <a target="_blank" href="{%$tplData.parkUrl%}">附近停车场</a> <a target="_blank" href="{%$tplData.lkUrl%}" style="margin-left:20px;">实时路况</a> </div></div>{%/if%}<script >
    A.setup({"tplData": {%json_encode($tplData)%},'isHotMap':'{%if $tplData.poiname%}1{%/if%}'});  
</script><script data-merge> A.setup(function(){var __this = this, _maploaded,time1 = null,$mapContainer = __this.find(".opr-singlepoint-hot-map").eq(0),initTime = new Date().getTime(), startTime, endTime;var hotLevelExpression = "[,10)稀少 [10,70)密集 [70,)拥挤";var hotLevelColorMap = {"稀少": "xishao", "密集": "miji", "拥挤": "yongji"};var $hotTag = __this.find('.opr-singlepoint-hot-hot-level-tag');var placeholderSupport = ("placeholder" in document.createElement("input"));A._____right_singlepoint_hot_map{%*i*%} = function(){var ajaxFinished = false;var anchor = new BMap.Size(0, -115),anchorMouseOver = new BMap.Size(0, -156),point = __this.data.tplData.point[0],mapPoint = new BMap.Point( point.lng, point.lat);map = new BMap.Map( __this.find(".opr-singlepoint-hot-map").get(0), {'enableMapClick':false} );map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_SMALL}));map.enableScrollWheelZoom();map.centerAndZoom( mapPoint , 10 );var iconURL = "http://www.ba{%*i*%}idu.com/aladdin/img/jigou/markers.png",marker = new BMap.Marker( mapPoint ),icon = new BMap.Icon(iconURL, new BMap.Size(34,39), {imageOffset:anchor}),iconHover = new BMap.Icon(iconURL, new BMap.Size(34,39), {imageOffset:anchorMouseOver});marker.setIcon( icon );marker.setTitle( point.title );map.addOverlay( marker );var label = new BMap.Label('<a hideFocus="true" data-click="{fm:\'alxr\'}" href="'+ point.link+'" target="_blank" class="opr-singlepoint-hot-map-label" title="'+point.title+'">'+subBy{%*i*%}te(point.title,20)+'<a>',{offset:new BMap.Size(20,-10)});label.setStyle({ border:"none",backgroundColor:"none"});marker.setLabel(label);marker.addEventListener("click", function(){window.open(point.link, "_blank");c({'fm':'alxr','rsv_srcid':__this.srcid,'p1':__this.p1,'p5':__this.p1,'mu':__this.mu,'title':'point','rsv_xpath':'div-div3-div','rsv_tpl':'right_singlepoint_hot'});});map.addEventListener("dragstart", function(){c({'fm':'beha','rsv_srcid':__this.srcid,'p1':__this.p1,'p5':__this.p1,'mu'{%*i*%}:__this.mu,'title':'drag','rsv_xpath':'div-div3-div','rsv_tpl':'right_singlepoint_hot'});});map.addEventListener("zoomstart", function(){c({'fm':'beha','rsv_srcid':__this.srcid,'p1':__this.p1,'p5':__this.p1,'mu':__this.mu,'title':'zoom','rsv_xpath':'div-div3-div','rsv_tpl':'right_singlepoint_hot'});});map.addEventListener("tilesloaded",function(){if(!__this.maploaded){__this.maploaded = 1;time1 = setTimeout(function(){$mapContainer.attr('background','none');},500);endTime = new Date().getTime();{%*i*%}ns_c({'tab':'right_singlepoint_hot','waitTime':startTime-initTime,'loadTime':endTime-startTime});var mapBtn = __this.find('.BMap_stdMpPan .BMap_button');$.each(mapBtn, function(i,e){$(e).on('click', function(){c({'fm':'beha','rsv_srcid':__this.srcid,'p1':__this.p1,'p5':__this.p1,'mu':__this.mu,'title':'control','rsv_xpath':'div-div3-div','rsv_tpl':'right_singlepoint_hot'});});});}});function subByte(str, len, tail){ var a = [], s = str.split('');tail = tail || '…'; for(var i = 0, l = s.length; i{%*i*%} < l; i++){if(s[i].charCodeAt(0) > 255){a.push("*");}a.push(s[i]);}if(len && len > 0 && a.length > len){ s = a.join("").substring(0, len - 1).replace(/\*/g,'') + tail;}else{return str;}return s;}if (__this.data.isHotMap) {var pattern=window.navigator.userAgent.match(/MSIE\s*(\d+)/);var ie68 = pattern && pattern[1] && parseInt(pattern[1])<9;var color = 'rgb(215,57,32)';var poiname = __this.data.tplData.poiname;if (!poiname)return;var cityname = __this.data.tplData.cityname;var time = ( bds && bds{%*i*%}.comm && bds.comm.serverTime )? bds.comm.serverTime-60: parseInt( new Date().getTime()/1000 ) - 60;time = parseInt( (+new Date())/1000 ) - 60;var version;var polygonurl = "http://spotshot.baidu.com/getPoint.php?poiname="+encodeURIComponent(poiname)+"&city="+encodeURIComponent(cityname)+"&time="+time;var hoturl = "http://spotshot.baidu.com/getHotW.php?poiname="+encodeURIComponent(poiname)+"&city="+encodeURIComponent(cityname)+"&time="+time;var rankhoturl = "http://spotshot.baidu.com/getRankHotVie{%*i*%}w.php?poiname="+encodeURIComponent(cityname)+"&subpoiname="+encodeURIComponent(poiname)+"&time="+time;$.ajax({url: rankhoturl,dataType: 'jsonp',timeout: 6000}).done(function(data){if(data && data.data && data.data.hot !== undefined){var hotNumber = data.data.hot;var hotText = getRegionText(hotNumber, hotLevelExpression);$hotTag.html(hotText).addClass("opr-singlepoint-hot-hot-level-"+hotLevelColorMap[hotText]);;}});if(ie68) {$.ajax({ url: 'http://spotshot.baidu.com/getVersion.php',dataType:'jsonp{%*i*%}', timeout: 6000, jsonp:'callback',success: function(data){if (ajaxFinished) return; version = data.version;addMapLayer();return;}});} else {var script1 = document.createElement('script');__this.container.appendChild(script1);script1.src="http://spotshot.baidu.com/js/heatmap.js";var script2 = document.createElement('script');__this.container.appendChild(script2);script2.src="http://spotshot.baidu.com/js/heatmap-bmaps.js";$.ajax({ url: hoturl,dataType:'jsonp', timeout: 6000, jsonp:'callback',succ{%*i*%}ess: function(hot){if (ajaxFinished) return; var heatOlay = new HeatmapOverlay(map, {"radius":10, "visible":true, "opacity":30});map.addOverlay(heatOlay);function addHeatPoints(rs){var tmmp = null;var px = null;var py = null;var phot = null;HotData.data=[];for(var i = 0; i < rs.length; i++){tmpp = rs[i];px = tmpp.x;py = tmpp.y;phot = tmpp.hot;HotData.data.push({"lat": px, "lng": py, "count": phot}); } }var HotData = {"max": 4 ,"data":[]};addHeatPoints(hot.data);heatOlay['setDataSet'](HotData);}}{%*i*%});$.ajax({ url: polygonurl,dataType:'jsonp', timeout: 6000, jsonp:'callback',success: function(result_){if (ajaxFinished) return; var pixels = result_.point;cityname = result_.city?result_.city:cityname;var points = [];for(var i = 0,item; item = pixels[i]; i++){var xy = item.split("|");var pixel = new BMap.Pixel(xy[0],xy[1]);points[i] = map.getMapType().getProjection().pointToLngLat(pixel);}var colorurl = "http://spotshot.baidu.com/getRankHotView.php?poiname="+encodeURIComponent(cityname)+"&time{%*i*%}="+time;$.ajax({ url: colorurl,dataType:'jsonp', timeout: 6000, jsonp:'callback',success: function(result){for(var i = 0, poi; poi = result.data[i]; i++){if(poi['poiname'] == poiname){color = getColor(poi['hot']);}} var polygon = new BMap.Polygon(points, {strokeColor:color, strokeWeight:2, strokeOpacity:0.7, fillColor:color,fillOpacity:0.2}); map.addOverlay(polygon); map.setViewport(polygon.getPath());}});}});}function getColor(hot){var hotNum = parseInt(hot);if(1<=hotNum && hotNum<10){return "r{%*i*%}gb(44,200,2)";}else if(10<=hotNum && hotNum<25){return "rgb(255,201,115)";}else if(25<=hotNum && hotNum<40){return "rgb(254,170,58)";}else if(40<=hotNum && hotNum<55){return "rgb(254,135,0)";}else if(55<=hotNum && hotNum<70){return "rgb(255,84,18)";}else if(70<=hotNum && hotNum){return "rgb(215,57,32)";}}function addMapLayer() {var TILE_BASE_URLS = ['http://shangetu0.map.bdimg.com/it/','http://shangetu1.map.bdimg.com/it/','http://shangetu2.map.bdimg.com/it/','http://shangetu3.map.bdimg.com/it/',{%*i*%}'http://shangetu4.map.bdimg.com/it/'];var tileLayer = new BMap.TileLayer({isTransparentPng: true});var tileCoord = {'x':point.lng,'y':point.lat};var zoom = 15;tileLayer.getTilesUrl = function(tileCoord, zoom) {var row = tileCoord.x;var column = tileCoord.y;var url = TILE_BASE_URLS[Math.abs(row + column) % TILE_BASE_URLS.length] + 'u=x=' + row + ';y=' + column + ';z=' + zoom + ';v='+ version +';type=hot&fm=44&t='+parseInt((new Date().getTime())/1000*60*10);return url.replace(/-(\d+)/gi, 'M\$1');}{%*i*%};map.addTileLayer(tileLayer);} }};function getRegionText(number, regionExpression){return regionExpression.replace(/(\[|\()(\s?|\d+)\,(\s?|\d+)(\]|\))([^\s]+)\s?/g, function(str, left, min, max, right, text){min = left === '[' ? min : min === "" ? "" : min - 1;max = right === ']' ? max : max === "" ? "" : max - 1;return ( min === "" ? number <= max : number >= min && ( max === "" ? true : number <= max ) ) ? text : '';});}bindEvent();function bindEvent(){var $contents =__this.find('.opr-singlepo{%*i*%}int-hot-content');$contents.each(function(i, content){var $content = $(content);var $input = $content.find('.opr-singlepoint-hot-input').eq(0);if(!placeholderSupport){bindPlaceholderForIE($input);}var $btns = $content.find('.opr-singlepoint-hot-btn');$btns.each(function(i, btn){var $btn = $(btn);$btn.click(function(){var val = $.trim($input.val());var placeholder = $input.attr('data-placeholder');if (val === '' || val === placeholder) { return false; }var d = $btn.attr('data-d') === 'bus' ? 'bse{%*i*%}' : 'nse';var b = $btn.attr('data-b');getRoute(d, b, val);});});});}function getRoute(d, b, v){var url = "http://map.baidu.com/?newmap=1&s=";var a = d + "&wd=" + v + "&t=" + (+(b == "sn")) + "&" + b + "=1$$$$" +__this.data.tplData.coord + "$$" +__this.data.tplData.poiname + "$$$$$$";a = encodeURIComponent( a +__this.data.tplData.mapurl );a = "http://map.baidu.com/?newmap=1&s=" + a +"&req="+ encodeURIComponent( a );window.open(a);}function bindPlaceholderForIE($input){var placeholder = $.trim($in{%*i*%}put.attr('data-placeholder'));if(placeholder){$input.val(placeholder).css('color', '#666').focus(function(){if($input.val() == placeholder){$input.val('').css('color', '');}}).blur(function(){if($.trim($input.val()) == ''){$input.val(placeholder).css('color', '#666');}});}}A.use('tabs5', function(){A.ui.tabs5(__this.find('.opr-singlepoint-hot-tabs')[0],{toggleSep: false});});bds.ready(function(){startTime = new Date().getTime();$.getScript("http://api.map.baidu.com/api?v=1.4&callback=A._____righ{%*i*%}t_singlepoint_hot_map");}); this.dispose = function(){ajaxFinished = true; time1 && clearTimeout(time1);}; }); </script>{%/block%}