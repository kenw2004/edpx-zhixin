{%extends 'c_base.tpl'%} {%block name='data_modifier'%}{%if $tplData.result[0]%} {%$tplData.result[0].url=$tplData.url%} {%$tplData=$tplData.result[0]%} {%$tplData.title=$tplData.title|cat:'_全集高清视频在线观看_百度视频'%}{%elseif $tplData.al_title%} {%$tplData.title=$tplData.al_title%} {%$tplData.title=$tplData.title|cat:'_全集高清视频在线观看_百度视频'%}{%/if%}{%if  !isset($tplData.showurl) %} {%$tplData.showurl='v.baidu.com/ '%}{%/if%}{%if !$tplData.newest_tip%} {%$tplData.newest_tip='更新至'%}{%/if%}{%if !$tplData.morelinktxt%} {%$tplData.morelinktxt='查看更多视频>>'%}{%/if%}{%$extData.feData.urData="{pid:'video',type:'tamasha'}"%}{%if $extData.resourceid&&$extData.resourceid lt 5999%}{%$extData.feData.fm='alop'%}{%/if%}{%/block%}{%block name='content'%}<style data-merge>{%fe_fn_c_css css='btn'%}{%fe_fn_c_css css='img'%}{%fe_fn_c_css css='tabs'%}.op_vd_tamasha_grey{color:#666}.op_vd_tamasha_red{color:#cd0000}.op_vd_tamasha_rlt{position:relative}.op_vd_tamasha_a{overflow:hidden;position:relative;display:block;text-decoration:none}.op_vd_tamasha_site i{width:16px;height:16px;margin:2px 2px 0 0;background-repeat:no-repeat;float:left}.op_vd_tamasha_playicon{width:42px;height:42px;position:absolute;top:50%;left:50%;margin-left:-21px;margin-top:-21px;cursor:pointer;z-index:2;background:url(http://www.baidu.com/aladdin/img/movievideo/playicon.{%*i*%}png) no-repeat;_background:0;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=noscale,src="http://www.baidu.com/aladdin/img/movievideo/playicon.png")}.op_vd_tamasha_mask{width:100%;height:100%;position:absolute;top:0;left:0;background:#000;filter:alpha(opacity=20);opacity:.2;-moz-opacity:.2;cursor:pointer;display:none;z-index:1}.op_vd_tamasha_over .op_vd_tamasha_mask{display:block}.op_vd_tamasha_ratebg,.op_vd_tamasha_rate{width:100%;position:absolute;bottom:0;{%*i*%}left:0;cursor:pointer}.op_vd_tamasha_ratebg{background:#000;filter:alpha(opacity=65);opacity:.65;-moz-opacity:.65}.op_vd_tamasha_newbg .op_vd_tamasha_ratebg{background:#2c99fe;filter:alpha(opacity=100);opacity:1;-moz-opacity:1}.op_vd_tamasha_rate{color:#fff;z-index:100;text-align:center}.op_vd_tamasha_summary{padding-left:3em;text-indent:-3em}.op_vd_tamasha_aitem{overflow:hidden;position:relative;display:block;text-decoration:none;overflow:hidden}.op_vd_tamasha_net{position:absolute;right:0;top:{%*i*%}0;color:#666}.op_vd_tamasha_new{position:absolute;right:3px;top:-11px}.op_vd_tamasha_play{float:left;margin-top:2px}.op_vd_tamasha_newbg .op_vd_tamasha_play{width:16px;height:16px;background:url(http://www.baidu.com/aladdin/img/vd_tamasha/play.png);background-position:0 0}.op_vd_tamasha_fl{float:left;display:inline}.op_vd_tamasha_tip{position:absolute;right:0;top:0;color:#fff;padding:0 8px;background:#2c99fe}.op_vd_tamasha_tgap{margin-top:7px}.op_vd_tamasha_sites i{display:inline-block;width:16p{%*i*%}x;height:16px;background-repeat:no-repeat;vertical-align:text-bottom;margin-right:3px}</style><style>.op_vd_tamasha_aitem{height:{%fe_fn_c_get_grid_height rate=3/4%}px}.op_vd_tamasha_aitem img{height:{%fe_fn_c_get_img_height col=6 rate=3/4%}px}.op_vd_tamasha_a{height:{%fe_fn_c_get_grid_height rate=161/121%}px}.op_vd_tamasha_a img{height:{%fe_fn_c_get_img_height col=6 rate=161/121%}px}</style>{%if $tplData.sites && !$tplData.sites[0]%} {%$tplData.sites=array($tplData.sites)%}{%/if%}{%if $tplData.station && !is_array($tplData.station)%} {%$tplData.station=array($tplData.station)%}{%/if%}{%if $tplData.sites[0].episode && !$tplData.sites[0].episode[0]%} {%$tplData.sites[0].episode=array($tplData.sites[0].episode)%}{%/if%}<div class="c-row"> <div class="c-span6"> <a href="{%$tplData.url%}" target="_blank" class="op_vd_tamasha_a"> <img class="c-img6" src="{%$tplData.poster%}" /> <span class="op_vd_tamasha_playicon"></span> <span class="op_vd_tamasha_mask"></span> {%if $tplData.poster_tip%} <span class="op_vd_tamasha_rate">{%$tplData.sites[0].episode[0].date|limitlen:18|escape:html%}</span> <span class="op_vd_tamasha_ratebg">&nbsp;</span> {%/if%} </a> </div> <div class="c-span18 c-span-last op_vd_tamasha_rlt"> {%if  isset($tplData.net_play_time) && $tplData.net_play_time%} <div class="op_vd_tamasha_net"> {%if $tplData.station[0] || $tplData.update_freq || $tplData.replay_time%} <p>网络直播时间</p> <p>{%$tplData.net_play_time|limitlen:36|escape:html%}</p> {%else%} {%$escaped_len=$tplData.newest_episode|string_display_len%} {%if $escaped_len>=36%}{%$escaped_len=16%}{%else%}{%$escaped_len=52-$escaped_len%}{%/if%} <p>网络直播时间：{%$tplData.net_play_time|limitlen:$escaped_len|escape:html%}</p> {%/if%} </div> {%/if%} <p class="c-clearfix op_vd_tamasha_update"> <span class="c-text c-text-public c-gap-right-small">{%$tplData.newest_tip|limitlen:10|escape:html%}</span><span class="op_vd_tamasha_red">{%$tplData.newest_episode|limitlen:36%}</span> </p> {%if $tplData.station[0]%} <p> <span class="op_vd_tamasha_grey">首播频道：</span><span>{%$tplData.station[0]|limitlen:36%}</span> </p> {%/if%} {%if $tplData.update_freq%} <p> <span class="op_vd_tamasha_grey">首播时间：</span><span>{%$tplData.update_freq|limitlen:46%}</span> </p> {%/if%} {%if isset($tplData.replay_time) && $tplData.replay_time%} <p> <span class="op_vd_tamasha_grey">重播时间：</span><span>{%$tplData.replay_time|limitlen:46%}</span> </p> {%/if%} {%if  $tplData.isonly=='true'%} {%if $tplData.station[0] || $tplData.update_freq || $tplData.replay_time%} {%$escaped_sumlen=100%} {%else%} {%$escaped_sumlen=150%} {%/if%} <p class="op_vd_tamasha_summary"> <span class="op_vd_tamasha_grey">简介：</span><span>{%$tplData.brief_short|limitlen:$escaped_sumlen|escape:html%}</span> <a href="{%$tplData.url%}" target="_blank">更多>></a> </p> <p class="c-gap-top-small c-gap-bottom-small c-clearfix"> <a class="c-btn c-btn-primary c-btn-large op_vd_tamasha_fl" target="_blank" href="{%$tplData.sites[0].episode[0].url%}"><i class="c-icon c-icon-play-white" style="margin-top:8px;margin-right:1px;"></i>立即播放</a> </p> <p class="op_vd_tamasha_sites"> <span>来源：<a target="_blank" href="{%$tplData.sites[0].episode[0].url%}"><i style="background:url({%$tplData.sites[0].site_logo%}) no-repeat 0 0;"></i>{%$tplData.sites[0].site_name%}</a></span> {%if $tplData.sites|count>1%} <span class="c-gap-left-small">其它：</span> {%foreach array_slice($tplData.sites, 1, 4) as $item%} {%if $item.episode && !$item.episode[0]%} {%$item.episode=array($item.episode)%} {%/if%} <a target="_blank" href="{%$item.episode[0].url%}" class="{%if !$item@first%}c-gap-left{%/if%}"><i style="background:url({%$item.site_logo%}) no-repeat 0 0;"></i>{%$item.site_name%}</a> {%/foreach%} {%/if%} </p> {%fe_fn_c_showurl%} {%else%} <p class="op_vd_tamasha_summary"> <span class="op_vd_tamasha_grey">简介：</span><span>{%$tplData.brief_short|limitlen:150|escape:html%}</span> <a href="{%$tplData.url%}" target="_blank">更多>></a> </p> {%if  $tplData.playTime.houer && isset($tplData.live_url)&& $tplData.live_url %} {%$nowTime=$smarty.now|date_format:'%H'*60+$smarty.now|date_format:'%M'%} {%$stTime=$tplData.playTime.houer*60+$tplData.playTime.minute%} {%$edTime=$tplData.playTime.houer*60+$tplData.playTime.minute+$tplData.playTime.lengh%} {%if $nowTime>=$stTime && $nowTime<=$edTime%} <p class="c-gap-top"> <a class="c-btn c-btn-primary c-btn-large" target="_blank" href="{%$tplData.live_url%}"><i class="c-icon c-icon-play-white" style="margin-top:8px;margin-right:1px;"></i>立即播放</a> </p> {%/if%} {%/if%} {%/if%} </div></div>{%if $tplData.isonly!='true'%}<div class="c-tabs c-gap-top"> <ul class="c-tabs-nav {%if $tplData.sites|@count<=1%}c-tabs-nav-one{%/if%}"> {%foreach $tplData.sites as $item%} <li class="c-tabs-nav-li op_vd_tamasha_site  {%if $item@first%}c-tabs-nav-selected{%/if%}"> <i style="background:url({%$item.site_logo%}) no-repeat 0 0;"></i>{%$item.site_name%} </li> {%if !$item@last%}<li class="c-tabs-nav-sep"></li>{%/if%} {%/foreach%} </ul> {%foreach $tplData.sites as $item%} {%if $item.episode && !$item.episode[0]%} {%$item.episode=array($item.episode)%} {%/if%} <div class="c-tabs-content c-gap-top" {%if !$item@first%} style="display:none;"{%/if%}> <div class="c-row"> {%foreach $item.episode as $episode%} <div class="c-span6 {%if $episode@last%}c-span-last{%/if%}"> <a href="{%$episode.url%}" target="_blank" class="op_vd_tamasha_aitem"> {%if $item@first%} <img class="c-img6" src="{%$episode.img_url%}" /> <span class="op_vd_tamasha_ratebg">&nbsp;</span> {%else%} <span class="op_vd_tamasha_ratebg" data-img="{%$episode.img_url%}">&nbsp;</span> {%/if%} {%if $episode@first && $tplData.max_episode==$episode.date || $tplData.max_episode==$episode.date|replace:'-':''%} <span class="op_vd_tamasha_tip">最新</span> {%/if%} <span class="op_vd_tamasha_rate"> <i class="c-icon c-icon-play-black c-gap-left-small c-gap-right op_vd_tamasha_play"></i> <span class="op_vd_tamasha_fl">{%$episode.date|escape:'html'%}</span> </span> </a> <p class="op_vd_tamasha_info"> <a href="{%$episode.url%}" target="_blank" title="{%$episode.title|escape:'html'%}">{%if $episode.title|string_display_len > 22%} {%$episode.title|limitlen:36|escape:'html'%} {%else%} {%$episode.title|limitlen:18|escape:'html'%} {%/if%} </a> </p> {%if $episode.guest%} <p class="op_vd_tamasha_info2">嘉宾：{%$episode.guest|limitlen:12|escape:'html'%}</p> {%/if%} </div> {%/foreach%} </div> </div> {%/foreach%} </div><p><a href="{%$tplData.url%}" target="_blank">{%$tplData.morelinktxt|limitlen:50|escape:html%}</a></p>{%fe_fn_c_showurl%}{%/if%}{%if $queryInfo.pUrlConfig.dsp != 'ipad'%}<script>A.setup(function(){var _this = this;var $aa=_this.find('.op_vd_tamasha_a');$aa.bind("mouseover", function(){$(this).toggleClass("op_vd_tamasha_over");}).bind("mouseout", function(){$(this).toggleClass("op_vd_tamasha_over");});});</script>{%/if%}<script data-merge>A.setup(function(){var _this = this;var tabDom=_this.find('.c-tabs').get(0);if(tabDom){A.use('tabs5', function(){A.ui.tabs5(tabDom,{onChange:function(){var tab=this,nowCont=tab.conts[tab.current],$nowDom=$(nowCont).find('.op_vd_tamasha_ratebg');if(!$nowDom.first().attr('data-img')){return;} $nowDom.each(function(index, obj) {var $obj=$(obj),nowSrc=$obj.attr('data-img');if(nowSrc){var $img=$('<img class="c-img6" />');$img.attr('src',nowSrc);$img.insertBefore($obj);$obj.attr('da{%*i*%}ta-img','');}});}});});}});</script>{%/block%}{%block name='foot'%}{%/block%}