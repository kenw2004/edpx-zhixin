<?php 
  class CssJs_Util_yaohao
   {
      private static $cssStr = '.op-yaohao-search-btn{float:left;}.op-yaohao-list{display:none;}.op-yaohao-list-table td{height:24px;line-height:24px;font-weight:bold;font-size:1.07em;}.op-yaohao-list-table-td-number{padding-left:10px;}.op-yaohao-list-more{display:none;height:20px;line-height:20px;*width:80px;cursor:pointer;}.op-yaohao-list-more-text-box,.op-yaohao-list-less-text-box{float:left;color:#00c;cursor:pointer;text-decoration:underline;}.op-yaohao-tip{color:#666;}.op-yaohao-msg-container .op-yaohao-msg{display:none;color:#c00;font-size:1.07em;margin-top:13px;}.op-yaohao-msg-container .op-yaohao-msg.op-yaohao-msg-searching{color:#666;}.op-yaohao-sms{color:#666;}.op-yaohao-sms-switch-btn{color:#00c;text-decoration:underline;cursor:pointer;}.c-border .op-yaohao-code-input{width:235px;}.c-border .op-yaohao-vcode-input,.c-border .op-yaohao-phone-input{width:122px;margin-right:4px;}.c-border .op-yaohao-sms-label{width:66px;height:26px;line-height:26px;}.op-yaohao-sms-form{color:#666;}.op-yaohao-sms-row{padding-top:2px;padding-bottom:2px;}.op-yaohao-code-tip{padding-left:65px;}.op-yaohao-sms-commit{padding-left:65px;}.op-yaohao-sms-code-error,.op-yaohao-sms-phone-error,.op-yaohao-sms-vcode-error,.op-yaohao-sms-error{color:#c00;position:relative;top:2px;*display:inline-block;*height:24px;*line-height:24px;}.op-yaohao-phone-btn-disabled{color:#666;cursor:default;}.op-yaohao-phone-btn-disabled:hover{border-color:#d8d8d8;}.op-yaohao-phone-btn-disabled:active{border-color:#d8d8d8;background-color:#f9f9f9;box-shadow:none;-webkit-box-shadow:none;-moz-box-shadow:none;-o-box-shadow:none;}.op-yaohao-sms-result-success,.op-yaohao-sms-result-fail{height:46px;padding-top:28px;background-color:#fbfbfb;text-align:center;}.op-yaohao-sms-result-success span,.op-yaohao-sms-result-fail span{margin-top:28px;height:18px;line-height:18px;}.op-yaohao-sms-result-success i,.op-yaohao-sms-result-fail i{_vertical-align:middle;}.op-yaohao-sms-login-btn{display:none;}.op-yaohao-sms-showlogin .op-yaohao-sms-login-btn{display:inline;}.op-yaohao-sms-showlogin .op-yaohao-sms-switch-btn{display:none;}';  // css字串，不含<style>和</style>标签
      private static $jsStr  = 'A.merge("yaohao",function(){A.setup(function(){var d=this,a=d.data.inputtip,G=d.find(".op-yaohao-input"),t=d.find(".op-yaohao-search-btn"),E=d.find(".op-yaohao-list"),X=d.find(".op-yaohao-list-box"),B=d.data.moretext,R=d.find(".op-yaohao-list-more"),y=d.find(".op-yaohao-list-more-text-box"),z=d.find(".op-yaohao-list-less-text-box"),s=d.find(".op-yaohao-sms-switch-btn"),b=d.find(".op-yaohao-sms-switch-btn-icon"),aa=d.find(".op-yaohao-sms-login-btn"),e=d.find(".op-yaohao-sms-commit-btn"),Z=d.find(".op-yaohao-sms-content"),v=d.find(".op-yaohao-sms-form"),H=d.find(".op-yaohao-sms-result-success"),l=d.find(".op-yaohao-sms-result-fail"),q=d.find(".op-yaohao-phone-btn"),F=d.find(".op-yaohao-sms"),j=d.find(".op-yaohao-code-input"),S=d.find(".op-yaohao-phone-input"),r=d.find(".op-yaohao-vcode-input"),Q={code:d.find(".op-yaohao-sms-code-error").get(0),phone:d.find(".op-yaohao-sms-phone-error").get(0),vcode:d.find(".op-yaohao-sms-vcode-error").get(0),sms:d.find(".op-yaohao-sms-error").get(0)},u=false,M=new RegExp("[a-zA-Z`~!@#$^&*()=|{}\':;\',\\\\[\\\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“\'。，、？]"),K=/^(1(([35][0-9])|(47)|[8][01256789]))\\d{8}$/,h=d.find(".op-yaohao-msg-searching"),w=d.find(".op-yaohao-time-dropdown"),Y=null,N=null,L="op-yaohao-msg",f=[],o="",ab=null,O=false;for(var U=0;U<7;U++){f.push(L+"-"+U)}A.use("dropdown21",function(){Y=A.ui.dropdown21(w.get(0));t.click(function(){W(Y.getValue())});G.keyup(function(i){if(i.keyCode==13){W(Y.getValue())}})});function k(i){h.css("display","none");if(N){N.style.display="none"}if(i!==4){E.css("display","none")}var ac=d.find("."+f[i]).get(0);if(ac){ac.style.display="block";N=ac}}function x(ac){if(N){N.style.display="none"}var i=true;if(ac===""||ac===a){k(0);i=false}else{if((/^\\d+$/.test(ac)&&ac.length!=13)||M.test(ac)){k(1);i=false}}return i}function J(){return !!bds.comm.user}function m(ag){var ae=\'<table class="op-yaohao-list-table" cellspacing="0" cellpadding="0">\';for(var ad=0,af;af=ag[ad];ad++){if(ad==0||ad==5){var ac=(ad==5)?\'style="display:none;"\':"";ae+=\'<tbody class="op-yaohao-list-table-tbody\'+ad+\'" \'+ac+">"}ae+="<tr><td>"+af.name+\'</td><td class="op-yaohao-list-table-td-number">\'+af.tid+"</td></tr>";if(ad==4||(ag.length>5&&ad==ag.length-1)){ae+="</tbody>"}}ae+="</table>";R.css("display","none");if(ag.length>5){R.css("display","inline-block");n("fold")}X.html(ae);E.css("display","block")}function W(i){c();var ae=$.trim(G.val());if(!i){return}if(!x(ae)){o="";return}if(u){return}u=true;h.css("display","block");var ad=encodeURIComponent(d.data.city+"__"+i);var af=(/^\\d{13}$/.test(ae));o=af?ae:"";var ac="http://opendata.baidu.com/api.php?query="+ad+"&name="+encodeURIComponent(ae)+"&resource_id=6722&ie=utf-8&oe=utf-8&format=json&tn=baidu&from_mid=1&t="+new Date().getTime();$.ajax({url:ac,dataType:"jsonp",scriptCharset:"utf-8",timeout:6000,jsonp:"cb",error:function(){k(6);u=false},success:function(ag){if(O){return}u=false;if(!d.data.disablesms){F.css("display","")}if(ag&&ag.status==0&&ag.data&&ag.data[0]&&ag.data[0].disp_data){ag=ag.data[0].disp_data;if(af){if(ag.length==1){k(5);return}else{k(3);return}}else{if(ag.length===0){k(2);return}else{k(4);m(ag)}}}else{k(6);return}}})}function n(i){if(i==="unfold"){y.css("display","none");z.css("display","")}else{y.css("display","");z.css("display","none")}}R.click(function(){var i=d.find(".op-yaohao-list-table-tbody5");if(i.length>0){if(i.css("display")=="none"){n("unfold");i.css("display","")}else{n("fold");i.css("display","none")}}});s.click(function(){Z.css("display",Z.css("display")==="none"?"":"none");j.val(o||"");if(b.hasClass("c-icon-triangle-down")){b.removeClass("c-icon-triangle-down").addClass("c-icon-triangle-up")}else{b.removeClass("c-icon-triangle-up").addClass("c-icon-triangle-down")}});aa.on("click",function(i){i.preventDefault();bds.se.login.open(function(ad,ac){if(ad==1){F.removeClass("op-yaohao-sms-showlogin");s.trigger("click")}})});q.on("click",function(){Q.code.style.display="none";Q.phone.style.display="none";if(!p()){return}if(!g()){return}var i=60;q.html((i--)+"秒后重新获取校验码");S.get(0).disabled=true;q.get(0).disabled=true;q.addClass("op-yaohao-phone-btn-disabled");$.ajax({url:"http://opendata.baidu.com/yaohao_vcode.php?phone="+encodeURIComponent(S.val())+"&t="+new Date().getTime(),dataType:"jsonp",jsonp:"cb",timeout:6000,success:function(ac){if(O){return}if(ab){clearInterval(ab)}ab=setInterval(function(){q.html((i--)+"秒后重新获取校验码");if(i===0){clearInterval(ab);S.get(0).disabled=false;q.get(0).disabled=false;q.removeClass("op-yaohao-phone-btn-disabled");q.html("重新获取校验码")}},1000)}})});function P(){$.each({code:j,phone:S,vcode:r},function(ac,i){$(i).on("focus",function(){Q[ac].style.display="none"})})}P();e.click(function(){V()});function V(){if(!D()){return}$.ajax({url:"http://opendata.baidu.com/yaohao_dingyue.php?location="+encodeURIComponent(d.data.city)+"&apiuid="+encodeURIComponent($.getCookie("BAIDUID"))+"&tid="+encodeURIComponent(j.val())+"&phone="+encodeURIComponent(S.val())+"&vcode="+encodeURIComponent(r.val())+"&t="+new Date().getTime(),dataType:"jsonp",jsonp:"cb",timeout:6000,success:function(ac){if(O){return}var i=4;if(ac){i=ac.status}switch(i){case"0":v.css("display","none");H.css("display","");break;case"5":C("vcode",d.data.sms.status5);break;case"8":v.css("display","none");l.css("display","");break;default:C("sms",d.data.sms.error);break}}})}function g(){var i=true;if(!S.val()){C("phone","请输入手机号码");i=false}else{if(!K.test(S.val())){C("phone","手机号码有误，请重新输入");i=false}}return i}function I(){var i=true;if(!r.val()){C("vcode","请输入校验码");i=false}if(!/^\\d{4}$/.test(r.val())){C("vcode","校验码错误");i=false}return i}function p(){var i=true;if(!j.val()){C("code","请输入申请编码");i=false}else{if(!/^\\d{13}$/.test(j.val())){C("code","申请编码有误，请重新输入");i=false}}return i}function T(){Q.code.style.display="none";Q.phone.style.display="none";Q.vcode.style.display="none";Q.sms.style.display="none"}function D(){T();var i=p();if(i){i=g();if(i){i=I()}}return i}function C(i,ac){Q[i].innerHTML=ac;Q[i].style.display=""}function c(){Z.css("display","none");v.css("display","");H.css("display","none");l.css("display","none");b.removeClass("c-icon-triangle-up").addClass("c-icon-triangle-down");F.toggleClass("op-yaohao-sms-showlogin",!J());T();r.val("");if(ab){clearInterval(ab)}S.get(0).disabled=false;q.get(0).disabled=false;q.removeClass("op-yaohao-phone-btn-disabled");q.html("获取校验码")}G.val(a);G.css("color","#666");G.focus(function(){if(G.val()==a){G.val("");G.css("color","#000")}});G.blur(function(){if($.trim(G.val())==""){G.val(a);G.css("color","#666")}});this.dispose=function(){clearInterval(ab);if(!O){O=true}Y&&Y.dispose&&Y.dispose()}})});';   // js字串，不含<script标签
      private static $uiList = 'btn,input,dropdown2';   // 包含的组件，以','分割的字符串，比如'input,text,button'这样
      
      public static function getHeadCss()
      {
         if (!is_string(self::$cssStr))
         {
            return '';
         }
         return self::$cssStr;
      }
      
      public static function getFootJs()
      {
         if (!is_string(self::$jsStr))
         {
            return '';
         }
         return self::$jsStr;
      }
      
      // 返回数组
      public static function getCssUI()
      {
		 if ( empty(self::$uiList) ) return array();

         $arr = @explode(',', self::$uiList);
         if (!is_array($arr))
         {
            $arr = array();
         }
         return $arr;
      }
   }