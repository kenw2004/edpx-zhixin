{%extends 'c_right_base.tpl'%} {%block name="data_modifier"%}{%$extData.feData.narrow = true%}{%/block%}{%block name='content'%}{%if $tplData.schedules.scheduleone && !$tplData.schedules.scheduleone[0]%}{%$tplData.schedules.scheduleone=[$tplData.schedules.scheduleone]%}{%/if%}<style data-merge>.opr-officalschedule-title-subtitle{font-size:1.077em;font-weight:bold;margin-right:8px}.opr-officalschedule-title{position:relative}.opr-officalschedule-title a{position:absolute;right:0;top:0}.opr-officalschedule-list{border-bottom:1px solid #f3f3f3;padding-bottom:5px;padding-top:5px}.opr-officalschedule-list a,.opr-officalschedule-list a:visited{text-decoration:none}.opr-officalschedule-list a:hover,.opr-officalschedule-list a:active{text-decoration:underline}</style><div cl{%*i*%}ass="opr-officalschedule-title"><span class="opr-officalschedule-title-subtitle">官方日程</span><span class="c-text c-text-public c-text-mult">官网</span><a href="{%$tplData.morelink%}" target="_blank">更多&gt;&gt;</a></div>{%foreach $tplData.schedules.scheduleone as $item%}<ul class="opr-officalschedule-list"> <li><a href="{%$item.schedulename[0].href%}" target="_blank">{%$item.schedulename[0].txt|escape%}</a></li> <li>{%$item.scheduletime|escape%}</li> <li>{%$item.scheduleaddress|escape%}</li></ul>{%/foreach%}{%/block%}