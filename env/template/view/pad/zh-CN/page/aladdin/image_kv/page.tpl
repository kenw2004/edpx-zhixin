{%extends 'c_base.tpl'%} {%block name='data_modifier'%} {%if !$tplData.sublink%}{%$extData.feData.hasShowURLGap=true%}{%/if%} {%if $tplData.link&&$tplData.word%} {%$tplData.url=$tplData.link%} {%$tplData.title="`$tplData.word`的图片"%} {%/if%} {%if !$tplData.showurl%} {%$tplData.showurl='image.baidu.com'%} {%/if%} {%if !isset($tplData.imageDisplayHeight)%} {%$tplData.imageDisplayHeight=90%} {%/if%} {%if !isset($tplData.imageDisplayTotalMaxWidth)%} {%$tplData.imageDisplayTotalMaxWidth=607%} {%/if%}{%/block%}{%block name='title'%}{%fe_fn_c_title_prefix%}{%if $tplData.urlnohide%}<span style="line-height:1.08em; font-weight:bold; color:#999;">{%$tplData.title%}</span>{%else%}<a href="{%$tplData.url%}" target="_blank">{%$tplData.title|highlight:0%}</a>{%/if%}{%fe_fn_c_title_suffix%}{%/block%}{%block name='content'%}<style type="text/css">.op_image_kv_container{overflow:hidden}.op_image_kv_container a{display:block;float:left;overflow:hidden}.op_image_kv_container img{display:block}</style><div class="c-clearfix op_image_kv_container"></div>{%if $tplData.sublink%}<p class="c-gap-top-small">{%foreach $tplData.sublink as $item%} <a class="c-gap-right" target="_blank" href="{%$item.url%}">{%$item.test|escape%}</a>{%/foreach%}</p>{%/if%}<script >
    A.setup({
        imageDisplayHeight:parseInt('{%$tplData.imageDisplayHeight%}'),
        imageDisplayTotalMaxWidth:parseInt('{%$tplData.imageDisplayTotalMaxWidth%}'),
        imageData:'{%json_encode($tplData.list)%}'
    });
</script><script data-merge>A.setup(function(){var T=A.baidu,_this=this,imageDisplayContaienr=_this.find('.op_image_kv_container')[0];var imageDisplayHeight=_this.data.imageDisplayHeight,imageData=new Function('return '+_this.data.imageData)(),imageDisplayContaienrWidth=imageDisplayContaienr.offsetWidth;if(!imageDisplayContaienrWidth&&imageDisplayContaienrWidth<=0){imageDisplayContaienrWidth=_this.data.imageDisplayTotalMaxWidth;}var imageList=[],twidth=0;for(var i=0,item;item=imageData[i];i++){i{%*i*%}tem.width=parseInt(item.width);item.height=parseInt(item.height);if(item.height<imageDisplayHeight){continue;}item.rwidth=Math.round((item.width/item.height)*imageDisplayHeight);twidth+=item.rwidth;imageList.push(item);if(twidth>imageDisplayContaienrWidth){break;}}var html=document.createDocumentFragment(),a,img,width=0,lack=twidth-imageDisplayContaienrWidth,imageListLength=imageList.length,acut=Math.ceil(lack/imageListLength),imgcut=Math.round(acut/2);if(lack<0){lack=0;acut=0;imgcut=0;}for(var {%*i*%}i=0,item;item=imageList[i];i++){if((i===imageListLength-1)&&lack>0){item.awidth=imageDisplayContaienrWidth-width;if(item.awidth>item.rwidth){item.awidth=item.rwidth; }item.marginLeft=-Math.round((item.rwidth-item.awidth)/2);}else{item.awidth=item.rwidth-acut;item.marginLeft=-imgcut;}width+=item.awidth;a=document.createElement('a');img=document.createElement('img');a.appendChild(img);a.href=item.link;a.target='_blank';a.style.width=item.awidth+'px';a.style.height=img.style.height=imageDisplayHeig{%*i*%}ht+'px';img.src=item.src;img.style.width=item.rwidth+'px';img.style.marginLeft=item.marginLeft+'px';html.appendChild(a);}imageDisplayContaienr.appendChild(html);});</script>{%/block%}{%block name='foot'%}<div class="c-showurl{%if $extData.feData.hasBorder || $extData.feData.hasShowURLGap%} c-gap-top-small{%/if%}"><cite>{%$tplData.showurl|escape:'html'%}</cite> {%if $tplData.date%} <time>{%$tplData.date|escape:'html'%}</time> {%/if%} {%if $tplData.showlamp%} - <a target="_blank" href="http://open.baidu.com/" class="aladdin-LAMP"></a>{%/if%}&nbsp;-&nbsp;{%if $tplData.morelinkurl%}<a style="color:#666" target="_blank" href="{%$tplData.morelinkurl[0].moreurl%}">{%$tplData.morelinkurl[0].moretext|escape%}</a>{%else%}<a style="color:#666" target="_blank" href="{%$tplData.url%}">查看全部{%if $tplData.number%}{%$tplData.number%}张{%/if%}图片</a>{%/if%}</div>{%/block%}