{%extends 'base.tpl'%} {%block name='content'%}<style >.op_countdown_main{margin-top:8px}.op_alad_icon{border:1px solid #ccc}.op_cd_cont1{font-size:14px;font-weight:bold;padding-bottom:2px}.op_cd_cont2{padding-bottom:1px;padding-left:1px}.op_cd_cont3{padding-top:2px;font-size:13px}.op_cd_timeBox span{display:inline-block;padding-top:2px;padding-right:2px}.op_cd_timeBox .op_cd_showTime{font-size:18px;font-family:"微软雅黑"}.op_cd_timeBox .op_cd_showTime font{padding:0 3px;font-size:22px;color:#a00000}.op_cd_timeBox .op_cd_showLogo img{vertical-al{%*i*%}ign:baseline}</style>{%$FE_GBVAR.wrapper_prefix%}<div class="op_countdown_title">{%fe_fn_title_prefix%}{%fe_fn_title title="{%$tplData.title%}" url="{%$tplData.url%}"%}{%fe_fn_title_suffix title="{%$tplData.title%}" url="{%$tplData.url%}"%}</div><div class="op_countdown_main"> <table border="0" cellspacing="0" cellpadding="0" width="100%"><tr><td width="10px" valign="top" style="padding-top: 1px">{%if $tplData.icon[0]['link']%}<a href="{%$tplData.icon[0]['link']|escape:'html'%}" target="_blank" class="OP_LOG_BTN">{%/if%}<img class="op_alad_icon" src="{%$tplData.icon[0]['address']|escape:'html'%}" width="78" height="78" border="none"/>{%if $tplData.icon[0]['link']%}</a>{%/if%}</td><td width="9"></td><td>{%if $tplData.content1%}<div class="op_cd_cont1">{%$tplData.content1|escape:'html'%}</div>{%/if%}{%if $tplData.content2%}<div class="op_cd_cont2">{%$tplData.content2|escape:'html'%}</div>{%/if%}<div class="op_cd_timeBox"><span class="op_cd_showTime"></span><span class="op_cd_showLogo">{%if $tplData.logo[0]['src']%}{%if $tplData.logo[0]['link']%}<a href="{%$tplData.logo[0]['link']|escape:'html'%}">{%/if%}<img src="{%$tplData.logo[0]['src']|escape:'html'%}" />{%if $tplData.logo[0]['link']%}</a>{%/if%}{%/if%} {%if $tplData.logo[0]['txt']%}{%$tplData.logo[0]['txt']|escape:'html'%}{%/if%}</span></div>{%if $tplData.content3%}<div class="op_cd_cont3">{%$tplData.content3|escape:'html'%}</div>{%/if%}</td></tr></table><div style="font-size:13px;padding-top:1px;">{%fe_fn_showurl showurl="{%$tplData.showurl%}" date="{%$tplData.date%}" showlamp="{%$tplData.showlamp%}"%}</div> </div>{%$FE_GBVAR.wrapper_suffix%}<script >A.init(function() {var T = A.baidu, _this = this;var op_cd_serverTime = 0;var op_cd_targetTime = {%$tplData.targetTime|escape:'html'%};var op_cd_title = '{%if $tplData.showTitle%}{%$tplData.showTitle|escape:'html'%}{%/if%}';var st = _this.qq('op_countdown_title');var cm = _this.qq('op_countdown_main');if (op_cd_title != '') {st.style.display = 'none';cm.style.marginTop = '0px';}var baidu_time = function(time){op_cd_serverTime = parseInt(time);op_cd_ct();};function op_cd_showTime(){var serverTime = new Date(op_cd_serverTime);var targetTime = new Date(op_cd_targetTime);var diffTime = targetTime.getTime() - serverTime.getTime();if (diffTime < 0) diffTime = 0;var d = parseInt(diffTime / 86400000);var h = parseInt(dif{%*i*%}fTime % 86400000 / 3600000);var m = parseInt(diffTime % 86400000 % 3600000 / 60000);var s = parseInt(diffTime % 86400000 % 3600000 % 60000 / 1000);var txt = "<font style='padding-left:0'>" + d + '</font>' + '天'+ '<font>' + (h < 10 ? ('0' + h) : h) + '</font>' + '时'+ '<font>' + (m < 10 ? ('0' + m) : m) + '</font>' + '分'+ '<font>' + (s < 10 ? ('0' + s) : s) + '</font>' + '秒';_this.qq('op_cd_showTime').innerHTML = txt;}function op_cd_ct(){op_cd_serverTime += 1000;op_cd_showTime();setTimeout(op_cd_c{%*i*%}t, 1000);}baidu_time(bdServerTime * 1000);});</script>{%/block%}