{%extends 'c_right_base.tpl'%} {%block name='title'%}{%/block%}{%block name='foot'%}{%/block%}{%block name='content'%}<div class="op-chunjie2013-topbanner"></div><div class="op-chunjie2013-middle"> <span class="op-chunjie2013-title">{%$tplData.breadtitle|escape%}</span> <div class="op-chunjie2013-draop c-clearfix">  <div class="op-chunjie2013-downwidth"> <div class="c-dropdown2 op-chunjie2013-type1"> <div class="c-dropdown2-btn-group"> <div class="c-dropdown2-btn">&nbsp;</div> <div class="c-dropdown2-btn-icon"> <div class="c-dropdown2-btn-icon-border"> <i class="c-icon c-icon-triangle-down"></i> </div> </div> </div> <div class="c-dropdown2-menu"> <div class="c-dropdown2-menu-inner"> <ul class="c-dropdown2-menubox op-chunjie2013-menubox1"> </ul> </div> </d{%*i*%}iv> </div> </div> <div class="op-chunjie2013-deword">的</div>  <div class="op-chunjie2013-downwidth"> <div class="c-dropdown2 op-chunjie2013-type2"> <div class="c-dropdown2-btn-group"> <div class="c-dropdown2-btn">选择</div> <div class="c-dropdown2-btn-icon"> <div class="c-dropdown2-btn-icon-border"> <i class="c-icon c-icon-triangle-down"></i> </div> </div> </div> <div class="c-dropdown2-menu"> <div class="c-dropdown2-menu-inner"> <ul class="c-dropdown2-menubox op-chunjie2013-menubox2"> </ul> </div{%*i*%}> </div> </div> </div> <div class="op-chunjie2013-deword">的</div>  <div class="op-chunjie2013-downwidth"> <div class="c-dropdown2-btn-hidden"></div> <div class="c-dropdown2 op-chunjie2013-type3 op-chunjie2013-type"> <div class="c-dropdown2-btn-group"> <div class="c-dropdown2-btn">选择</div> <div class="c-dropdown2-btn-icon"> <div class="c-dropdown2-btn-icon-border"> <i class="c-icon c-icon-triangle-down"></i> </div> </div> </div> <div class="c-dropdown2-menu"> <div class="c-dropdown2-menu-inner"> {%*i*%}<ul class="c-dropdown2-menubox op-chunjie2013-menubox3"> </ul> </div> </div> </div> </div> </div> <div class="op-chunjie2013-btncon"> <a href="javascript:void(0);" target="_blank" data-nolog="ture" class="op-chunjie2013-btn">{%$tplData.btn|escape%}</a> </div> <div class="op-chunjie2013-errortip">请选择二个以上的称谓组合</div> <div class="op-chunjie2013-tipfoot"></div></div><script >
    A.setup({'data': '{%json_encode($tplData.data)%}','urlparameter':'{%$tplData.urlparameter%}'});
</script>{%/block%}