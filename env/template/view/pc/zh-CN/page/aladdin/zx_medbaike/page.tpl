{%extends 'c_base.tpl'%} {%block name='data_modifier'%}{%$extData.feData.hasTitleGap = false%}{%$tplData.title=$tplData.title|cat:'_百度百科'%}{%if !$tplData.showurl%}{%$tplData.showurl = 'baike.baidu.com/'%}{%/if%}{%/block%}{%block name='content'%}<div class="c-abstract op-medbaike"> {%* 展现tab组件 逻辑 *%} {%if $tplData.tabs|count gt 1%} {%$tmpTabslabelnum = 0%} <div class="op-medbaike-summary1"> <div class="op-medbaike-tabs" data-click="{'fm':'beha'}">{%* 去掉span之间坑爹的空格 *%}{%foreach $tplData.tabs as $item%}{%$tmpTabslabelnum = $tmpTabslabelnum + strlen($item.label)%}{%if $tmpTabslabelnum > 45%}{%break%}{%/if%}{%if $item.selected == "1"%}<span class="OP_LOG_BTN op-medbaike-selected"><b>{%$item.label%}</b></span>{%else%}<span class="OP_LOG_BTN"><b>{%$item.label%}</b></span>{%/if%}{%/foreach%}</div> <div class="op-medbaike-conts {%if $tplData.yaopin%}op-medbaike-twoline{%/if%}"> {%foreach $tplData.tabs as $item%} {%$shortitem = (($item.label == '简介') && ($tplData.list[0].key || $tplData.list[1].key)) || $tplData.yaopin%} <div class="op-medbaike-content {%if $item.selected == '1'%}op-medbaike-show{%/if%}"> <div> <span>{%if $shortitem%}{%$item.content|limitlen:150|highlight:0%}{%else%}{%$item.content|limitlen:240|highlight:0%}{%/if%}{%if $item.seemore%}&nbsp;{%preg_replace("/\[url\s(.*?)\](.*?)\[\/url\]/", "<a href=\"$1\" target=\"_blank\">$2</a>", $item.seemore)%}{%/if%}</span> {%* 展现科室 症状信息 逻辑 *%} {%if $tplData.list && $shortitem%} <div class="op-medbaike-list"> {%if $tplData.list[0].key%}<span class="op-medbaike-key">{%$tplData.list[0].key%}：</span>{%/if%}{%if $tplData.list[0].value%}<span class="op-medbaike-value">{%$tplData.list[0].value|limitlen:18%}</span>{%/if%}{%if $tplData.list[1].key%}<span class="op-medbaike-key">{%$tplData.list[1].key%}：</span>{%/if%}{%if $tplData.list[1].value%}<span class="op-medbaike-value">{%$tplData.list[1].value|limitlen:40%}</span>{%/if%} </div> {%/if%} </div> {%* 知道整合 *%} {%if $tplData.question0[$item@index]%} <div class="c-clearfix">  <ul class="op-medbaike-questions"> {%$questions = [$tplData.question0[$item@index],$tplData.question1[$item@index],$tplData.question2[$item@index],$tplData.question3[$item@index],$tplData.question4[$item@index],$tplData.question5[$item@index]]%} {%foreach $questions as $ls%} {%if $ls.text && $ls.linker%}<li class="op-medbaike-question"><a href="{%$ls.linker%}" target="_blank" title="{%$ls.text%}">{%$ls.text|limitlen:34|highlight:0%}</a></li>{%/if%} {%/foreach%} {%if $tplData.question0[$item@index].morelink && $tplData.question5[$item@index]%} <li class="op-medbaike-question"><a class="op-medbaike-morequestion" href="{%$tplData.question0[$item@index].morelink%}" target="_blank">去百度知道查看更多<span>&gt;&gt;</span></a></li> {%/if%} </ul> </div> {%/if%} </div> {%/foreach%} </div> </div> {%else%} {%* 优先展现tab组 然后摘要*%} <div class="op-medbaike-summary">{%$tplData.summary|limitlen:156|highlight:0%}</div> {%$sumy="true"%} {%/if%} {%* 子链信息 *%} {%if $sumy && $tplData.tips|count gt 1%} <div class="op-medbaike-tips"> {%foreach $tplData.tips as $item%} {%if $item@first%} <a href="{%$item.linker%}" target="_blank" title="{%$item.text%}">{%$item.text|limitlen:12%}</a> {%elseif $item@index>4%} <span>-</span><a href="{%$tplData.url%}" target="_blank">查看全部&gt;&gt;</a>{%break%} {%else%} <span>-</span><a href="{%$item.linker%}" target="_blank" title="{%$item.text%}">{%$item.text|limitlen:12%}</a> {%/if%} {%/foreach%} </div> {%/if%} {%foreach $tplData.addon as $item%} <div class="op-medbaike-addon"> {%build_search_url_limit_ubburl content=$item.content limit=80%}</div> {%/foreach%} </div>{%/block%}