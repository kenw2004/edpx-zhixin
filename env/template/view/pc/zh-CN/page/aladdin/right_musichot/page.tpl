{%extends 'c_right_base.tpl'%} {%block name='content'%}<div class="cr-title c-gap-bottom">{%$tplData.subtitle%}</div><div class="c-clearfix c-gap-bottom"> <div class="opr-musichot-l"> <a target="_blank" href="{%build_search_url params="`$tplData.photo[0].params`"%}"> <img class="c-img c-img4" src="{%if $tplData.photo[0].src%}{%$tplData.photo[0].src%}{%else%}http://www.baidu.com/aladdin/img/zxmusic/zx_muscover.jpg{%/if%}"/> </a> </div> <div class="opr-musichot-l c-gap-left c-gap-top"> <p><a {%if $tplData.singer[0].link%} target="_blank" href="{%$tplData.singer[0].link%}"{%/if%}>歌曲({%$tplData.singer[0].songnum%})</a><span class="c-gap-left c-gap-right opr-musichot-vline">|</span><a {%if $tplData.singer[0].albumlink%} target="_blank" href="{%$tplData.singer[0].albumlink%}"{%/if%}>专辑({%$tplData.singer[0].albumnum%})</a></p> <div class="c-gap-top opr-musichot-btn-p"><a class="c-btn opr-musichot-btn" href="javascript:;"><i class="c-icon c-icon-play-blue c-gap-icon-right-small"></i>播<strong>Ta</strong> 的热门歌曲</a></div> </div></div><table class="c-table"> {%foreach array_slice($tplData.bdlist, 0, 10) as $item%} <tr> <td> <span class="c-gap-icon-right-small opr-musichot-gray">{%if $item@index < 9%}0{%/if%}{%$item@index+1%}</span><a target="_blank" class="opr-musichot-song-a" href="{%build_search_url params="`$item.sparams`&zxmsap=1"%}" title="{%$item.song%}">{%$item.song|limitlen:16%}</a> {%if $item.isnew == '1'%} <span class="c-text c-text-danger">新</span> {%/if%} </td> <td> {%if $item.aparams%}<a target="_blank" href="{%build_search_url params="`$item.aparams`"%}" title="{%$item.album%}">{%if $item.album%}《{%$item.album|limitlen:12%}》{%/if%}</a>{%/if%} </td> </tr> {%/foreach%}</table><script >
    A.setup('hotsongs','{%$tplData.hotsongs%}');
</script>{%/block%}