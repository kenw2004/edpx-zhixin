{%extends 'c_base.tpl'%} {%block name='data_modifier'%}{%$extData.feData.hasShowURLGap = true%}{%$escaped_tpl="{%basename($smarty.current_dir)%}"%}{%/block%}{%block name='title'%}<style type="text/css">.op-{%$escaped_tpl%}-sight{display:block;position:relative;padding-top:3px;overflow:hidden;height:81px;overflow:hidden}.op-{%$escaped_tpl%}-sight span{display:block;line-height:20px;bottom:0;left:0;height:20px;overflow:hidden;color:#fff;text-align:center;position:absolute}.op-{%$escaped_tpl%}-sight-mask{background-color:#000;opacity:.5;_filter:alpha(opacity=50)}.op-{%$escaped_tpl%}-sight,.op-{%$escaped_tpl%}-sight *,.op-{%$escaped_tpl%}-sight:hover,.op-{%$escaped_tpl%}-sight *:hover{text-decoration:none;cursor:pointer}.op-{%$escaped_tpl%}-degree{color:#f60;font-weight:bold}.op-{%$escaped_tpl%}-degree-label{color:#999;font-weight:normal}.op-{%$escaped_tpl%}-price{color:#f60;font-weight:bold}.op-{%$escaped_tpl%}-price-label{color:#999;font-weight:normal}.op-{%$escaped_tpl%}-desc{color:#aaa}.op-{%$escaped_tpl%}-routes,.op-{%$escaped_tpl%}-hotlinks{border-top:1px solid #eee;padding-top:5px}.op-{%$escaped_tpl%}-routes .op-{%$escaped_tpl%}-routes-title{font-weight:bold;line-height:24px}.op-{%$escaped_tpl%}-routes .op-{%$escaped_tpl%}-price{position:absolute;right:0;top:0}.op-{%$escaped_tpl%}-routes li{clear:both;line-height:24px;position:relative}.op-{%$escaped_tpl%}-hotlinks{height:20px;overflow:hidden}.op-{%$escaped_tpl%}-hotlinks-title{font-weight:bold}.op-{%$escaped_tpl%}-hotlinks *{white-space:nowrap}.op-{%$escaped_tpl%}-pager{text-align:center;overflow:hidden;padding:4px 0}.op-{%$escaped_tpl%}-pager span{display:inline-block;_display:inline;border:1px solid #d5d5d5;overflow:hidden;padding:3px 7px;margin:0 1px;color:#00c;text-decoration:none;line-height:18px;font:normal 12px Arial,Helvetica,sans-serif;text-align:center;vertical-align:middle}.op-{%$escaped_tpl%}-pager .op-{%$escaped_tpl%}-pager-current,.op-{%$escaped_tpl%}-pager .op-{%$escaped_tpl%}-pager-seperator,.op-{%$escaped_tpl%}-pager .op-{%$escaped_tpl%}-pager-loading{border:0;padding:4px 8px;color:#666}.op-{%$escaped_tpl%}-pager .op-{%$escaped_tpl%}-pager-current{color:#000}.op-{%$escaped_tpl%}-pager .op-{%$escaped_tpl%}-pager-item{cursor:pointer}.op-{%$escaped_tpl%}-header-title .op-{%$escaped_tpl%}-icon{width:16px;height:16px;background:url(http://bcscdn.baidu.com/fcnp-ip/1013/pic/283772069bc05b531cbb6d45cf2b91a1.png) no-repeat left top}</style><h3 class="t c-gap-bottom-small"> <a class="op-{%$escaped_tpl%}-header-title" target="_blank" href="{%$tplData.url%}"><span class="c-icon c-gap-icon-right-small op-{%$escaped_tpl%}-icon"></span>{%$tplData.title|limitlen:60|highlight:0%}</a> <span class="tsuf tsuf-op"></span></h3>{%/block%}{%block name='content'%}<div class="op-{%$escaped_tpl%} c-border"> <ul class="c-row op-{%$escaped_tpl%}-sights"> {%foreach $tplData.sight as $index=>$item%} <li class="c-span6{%if (($index+1)%4==0)%} c-span-last{%/if%}"> <a class="op-{%$escaped_tpl%}-sight c-gap-bottom" target="_blank" href="http://dujia.qunar.com/p/slist?sight_id={%$item.sightid%}&amp;query={%$item.name%}&amp;ex_track=bd_zhixin_dujia_theme1_02&amp;tf=bd_zhixin_theme1_jingdian"> <img src="{%$item.image%}" class="c-img c-img6" /><span class="op-{%$escaped_tpl%}-sight-mask c-img6"></span><span class="c-img6">{%$item.name%}</span> </a> <p class="op-{%$escaped_tpl%}-degree"><span class="op-{%$escaped_tpl%}-degree-label c-gap-right-small">热度</span>{%if $item.degree%}<i class="c-icon c-icon-star-gray op_videoidea_starwrap"><i style="width:{%($item.degree*20)%}%" class="c-icon c-icon-star"></i></i>{%/if%}</p> <p class="op-{%$escaped_tpl%}-price"><span class="op-{%$escaped_tpl%}-price-label c-gap-right-small">{%if $item.tprice%}门票价{%else%}最低价{%/if%}</span>&yen;{%if $item.tprice%}{%$item.tprice%}{%else%}{%$item.price%}{%/if%}起</p> </li> {%/foreach%} </ul> <div class="op-{%$escaped_tpl%}-pager c-gap-top-small" data-count="{%$tplData.count%}"></div> <img src="http://dujia.qunar.com/bs.png?checkstats={%$tplData.checkstats%}&amp;r={%time()%}{%100000000+rand(0,100000000)%}" style="position: absolute;" /></div><script >
    A.setup({dep:'{%$tplData.dep%}',tpl:'{%$escaped_tpl%}',query:'{%$tplData.key%}'});
</script>{%/block%}