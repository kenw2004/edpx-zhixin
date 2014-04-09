{%extends 'c_base.tpl'%} {%block name='title'%}{%/block%}{%block name='foot'%}{%/block%}{%block name='data_modifier'%} {%**********数据预处理开始**********%} {%*单实体标题*%} {%if count($tplData.result) == 1%} {%$tplData.SingleTitle = []%} {%if $tplData.search_property%} {%$tplData.SingleTitle.entity = $tplData.result[0].ename%} {%$tplData.SingleTitle.append = $tplData.result[0].appendinfo%} {%$tplData.SingleTitle.attr = $tplData.result[0].searchp%} {%/if%} {%if $tplData.trace.level && count(end($tplData.trace.level)) == 1%} {%$endLevel = end($tplData.trace.level)%} {%$tplData.SingleTitle.entity = ($tplData.SingleTitle.entity) ? $tplData.SingleTitle.entity : $tplData.hash[$endLevel[0].sign].ename%} {%$tplData.SingleTitle.append = ($tplData.SingleTitle.append) ? $tplData.SingleTitle.append : $tplData.hash[$endLevel[0].sign].appendinfo%} {%$tplData.SingleTitle.attr = ($tplData.SingleTitle.attr) ? $tplData.SingleTitle.attr : $endLevel[0].property%} {%/if%} {%/if%} {%**********数据预处理结束**********%} {%*****判断家庭称谓展现样式*****%} {%$ProcessView = '0'%} {%if $tplData.result[0].ename && $tplData.trace.level_num > 1%} {%$ProcessView = '1'%} {%foreach $tplData.trace.level as $level%} {%if count($level) > 1%} {%$ProcessView = '2'%} {%foreach $level as $item%} {%if $item.available == 'false'%} {%$ProcessView = '0'%} {%break%} {%/if%} {%/foreach%} {%break%} {%/if%} {%/foreach%} {%/if%} {%if $ProcessView == '1'%} {%$FamilyTree_TEXT_H = 22%}  {%$FamilyTree_LINE_H = 24%}  {%$FamilyTree = []%}  {%$FamilyTreeLevelMax = 0%}  {%$FamilyTreeLevelMin = 0%}  {%foreach $tplData.trace.level as $level%} {%if $level[0].path%} {%$level[0].path = json_decode($level[0].path, true)%} {%$level[0].path = array_slice($level[0].path, 1, count($level[0].path)-2)%} {%foreach $level[0].path as $path%} {%$FamilyTreeLeaf = []%} {%$FamilyTreeLeaf.level = $path.level%} {%$FamilyTreeLeaf.text = [$path.name]%} {%$FamilyTreeLevelMax = ($FamilyTreeLeaf.level > $FamilyTreeLevelMax) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMax%} {%$FamilyTreeLevelMin = ($FamilyTreeLeaf.level < $FamilyTreeLevelMin) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMin%} {%$arr = array_push($FamilyTree, $FamilyTreeLeaf)%} {%/foreach%} {%/if%} {%$FamilyTreeLeaf = []%} {%$FamilyTreeLeaf.level = $tplData.hash[$level[0].sign].jiatingchengwei_level%} {%$FamilyTreeLeaf.text = [$tplData.hash[$level[0].sign].ename]%} {%$FamilyTreeLevelMax = ($FamilyTreeLeaf.level > $FamilyTreeLevelMax) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMax%} {%$FamilyTreeLevelMin = ($FamilyTreeLeaf.level < $FamilyTreeLevelMin) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMin%} {%$arr = array_push($FamilyTree, $FamilyTreeLeaf)%} {%/foreach%} {%if $tplData.result[0].path%} {%$FamilyTreeLength = count($FamilyTree)%} {%$tplData.result[0].path = json_decode($tplData.result[0].path, true)%} {%$tplData.result[0].path = array_slice($tplData.result[0].path, 1, count($tplData.result[0].path)-2)%} {%foreach $tplData.result[0].path as $path%} {%$FamilyTreeLeaf = []%} {%$FamilyTreeLeaf.level = $path.level%} {%$FamilyTreeLeaf.text = [$path.name]%} {%$FamilyTreeLevelMax = ($FamilyTreeLeaf.level > $FamilyTreeLevelMax) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMax%} {%$FamilyTreeLevelMin = ($FamilyTreeLeaf.level < $FamilyTreeLevelMin) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMin%} {%$arr = array_push($FamilyTree, $FamilyTreeLeaf)%} {%/foreach%} {%foreach array_slice($tplData.result, 1) as $result%} {%$result.path = json_decode($result.path, true)%} {%$result.path = array_slice($result.path, 1, count($result.path)-2)%} {%foreach $result.path as $path%} {%if $path.name != $FamilyTree[$FamilyTreeLength + $path@index].text[0]%} {%$ProcessView = '2'%} {%/if%} {%/foreach%} {%/foreach%} {%/if%} {%$FamilyTreeLeaf = []%} {%$FamilyTreeLeaf.level = $tplData.result[0].jiatingchengwei_level%} {%$FamilyTreeLeaf.text = []%} {%$FamilyTreeLevelMax = ($FamilyTreeLeaf.level > $FamilyTreeLevelMax) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMax%} {%$FamilyTreeLevelMin = ($FamilyTreeLeaf.level < $FamilyTreeLevelMin) ? $FamilyTreeLeaf.level : $FamilyTreeLevelMin%} {%foreach $tplData.result as $item%} {%$FamilyTreeLeaf.text[$item@index] = $item.ename%} {%/foreach%} {%$arr = array_push($FamilyTree, $FamilyTreeLeaf)%} {%if $FamilyTree[0].level < $FamilyTree[1].level%} {%$preLevel = 0%} {%$changeKey = '+'%} {%$changeNum = 0%} {%foreach array_slice($FamilyTree, 1) as $tree%} {%if $tree.level > $preLevel%} {%if $changeKey == '-'%} {%$changeNum = $changeNum + 1%} {%$changeKey = '+'%} {%/if%} {%elseif $tree.level < $preLevel%} {%if $changeKey == '+'%} {%$changeNum = $changeNum + 1%} {%$changeKey = '-'%} {%/if%} {%/if%} {%if $tree.level == $preLevel || $changeNum > 1%} {%$ProcessView = '2'%} {%break%} {%/if%} {%$preLevel = $tree.level%} {%/foreach%} {%elseif $FamilyTree[0].level > $FamilyTree[1].level%} {%$preLevel = 0%} {%foreach array_slice($FamilyTree, 1) as $tree%} {%if $tree.level >= $preLevel%} {%$ProcessView = '2'%} {%break%} {%else%} {%$preLevel = $tree.level%} {%/if%} {%/foreach%} {%else%} {%$ProcessView = '2'%} {%/if%} {%/if%} {%if $ProcessView == '2' && $tplData.trace.level_num <= 2%} {%$ProcessView = '0'%} {%/if%} {%*****判断家庭称谓展现样式结束*****%} {%*跳转链接方法 优先级jumpquery>jumplink>ename*%} {%$EndParams = "&rsv_cq={%$extData.OriginQuery%}&rsv_dl=0_left_exactqa_{%$extData.resourceid%}"%} {%function op_exactqa_family_get_href jumpquery='' jumplink='' ename=''%}{%strip%} {%if $jumpquery%} {%$escaped_jumpquery = $jumpquery%} {%build_search_url params="wd={%$escaped_jumpquery%}"%}{%$EndParams|escape:'html'%} {%elseif $jumplink%} {%$jumplink|escape:'html'%} {%else%} {%$escaped_ename = $ename%} {%build_search_url params="wd={%$escaped_ename%}"%}{%$EndParams|escape:'html'%} {%/if%} {%/strip%}{%/function%}{%/block%}{%block name='content'%}<style data-merge>.op_exactqa_family_main a,.op_exactqa_family_tools a{text-decoration:none}.op_exactqa_family_main a:hover,.op_exactqa_family_tools a:hover{text-decoration:underline}.op_exactqa_family_tools{color:#999;font-size:.92em;text-align:right;margin:-15px 0 -3px 0}.op_exactqa_family_tools a{color:#999}.op_exactqa_family_tools_sep{color:#ccc;margin:0 8px}.op_exactqa_family_s_item{overflow:auto}.op_exactqa_family_s_area{padding-bottom:20px}.op_exactqa_family_s_prop{font-size:1.07em;font-w{%*i*%}eight:bold;color:#999}.op_exactqa_family_s_prop a,.op_exactqa_family_s_prop a:hover{color:#999}.op_exactqa_family_s_answer{font-family:"Microsoft YaHei",SimHei;font-size:1.69em}.op_exactqa_family_s_answer_more{white-space:nowrap}.op_exactqa_family_s_abstract_more{font-family:SimSun;white-space:nowrap;color:#00c}.op_exactqa_family_s_abstract_more a{color:#00c}.op_exactqa_family_process_ext{border-top:1px solid #f0f0f0}.op_exactqa_family_process_ext_title{color:#666;font-weight:bold}.op_exactqa_fa{%*i*%}mily_process_family{position:relative}.op_exactqa_family_process_canvas_text{position:absolute;z-index:10;text-align:center;text-decoration:none;display:block}.op_exactqa_family_process_ext_body ul{*display:inline-block}.op_exactqa_family_process_ext_text li{padding-left:20px}.op_exactqa_family_process_ext_text .op_exactqa_family_process_ext_icon{background:url(http://www.baidu.com/aladdin/img/exactqa/exactqa_process_icon.png) -175px -14px no-repeat}.op_exactqa_family_process_ext_text .op_exactq{%*i*%}a_family_process_ext_firsticon{background:url(http://www.baidu.com/aladdin/img/exactqa/exactqa_process_icon.png) -197px 6px no-repeat}.op_exactqa_family_process_ext_text a{color:#333;text-decoration:none}.op_exactqa_family_process_ext_text a:hover{text-decoration:underline}</style><div class="c-border">  <div class="op_exactqa_family_main"> <div class="op_exactqa_family_s_item c-row"> <div class="op_exactqa_family_s_area c-span24 c-span-last"> <p class="op_exactqa_family_s_prop c-gap-bottom-smal{%*i*%}l"> {%if $tplData.SingleTitle.entity && $tplData.SingleTitle.attr && $tplData.trace.level_num == 1%} <a href='{%op_exactqa_family_get_href ename=$tplData.SingleTitle.entity%}' target="_blank">{%$tplData.SingleTitle.entity|escape:'html'%}</a>{%if $tplData.SingleTitle.append%}<span>({%$tplData.SingleTitle.append|escape:'html'%})</span>{%/if%}{%$tplData.SingleTitle.attr|escape:'html'%}： {%else%} {%$extData.OriginQuery%}： {%/if%} </p> <p class="op_exactqa_family_s_answer"> {%$attrqueryArr = []%} {%foreach $tplData.result as $item%} {%$item.attrquery = ($item.ename) ? $item.ename : $item.property%} {%if !in_array($item.attrquery, $attrqueryArr)%} {%$arr = array_push($attrqueryArr, $item.attrquery)%} {%if !$item@first%}、{%/if%}<a href='{%op_exactqa_family_get_href jumpquery=$item.jumpquery jumplink=$item.jumplink ename=$item.attrquery%}' target="_blank">{%$item.attrquery|escape:'html'%}</a>{%if $item.basic_aliasname%}({%$item.basic_aliasname|escape:'html'%}){%/if%} {%/if%} {%/foreach%} </p> </div> </div> </div>   <div class="op_exactqa_family_tools"> 来自<a href="http://baike.baidu.com/view/31064.htm" target="_blank">百度百科</a><span class="op_exactqa_family_tools_sep">|</span><span class="op_exactqa_family_tools_fb_area"><a class="op_exactqa_family_tools_fb OP_LOG_BTN" href="javascript:;" data-click="{info:'报错'}">报错</a></span> </div>   {%if $ProcessView != '0'%} <div class="op_exactqa_family_process_ext c-gap-top"> <p class="c-gap-top-small c-gap-bottom-small op_exactqa_family_process_ext_title">推理过程：</p> <div class="op_exactqa_family_process_ext_body"> {%if $ProcessView == '1'%} {%$FamilyTreeLevelNum = $FamilyTreeLevelMax - $FamilyTreeLevelMin%} <div class="op_exactqa_family_process_family" style="height:{%($FamilyTree_TEXT_H+$FamilyTree_LINE_H)*$FamilyTreeLevelNum+$FamilyTree_TEXT_H%}px"> <!--[if IE]><script>document.createElement('canvas');</script><![endif]--> <canvas class="op_exactqa_family_process_canvas" width="500" height="{%($FamilyTree_TEXT_H+$FamilyTree_LINE_H)*$FamilyTreeLevelNum+$FamilyTree_TEXT_H%}"></canvas> </div> {%elseif $ProcessView == '2'%} {%function op_exactqa_family_level levelitem='' itemindex='' levelindex=''%} {%$result = array()%} {%foreach $tplData.trace.level[$levelindex+1] as $item%} {%$uftArr = array_keys(str_split(strrev(decbin($item.uft))),"1")%} {%if in_array($itemindex, $uftArr)%} {%$result[$item@index] = $item%} {%/if%} {%/foreach%} {%***************************************************源码带换行**********************************************
                <a href='{%op_exactqa_family_get_href ename=$tplData.hash[$levelitem.sign].ename%}' target="_blank">{%$tplData.hash[$levelitem.sign].ename|escape:'html'%}</a>的{%$levelitem.property|escape:'html'%}是
                {%if count($result) == 0%}
                    {%if count($tplData.result) > 1%}
                        {%$firstIf = true%}
                        {%foreach $tplData.result as $item%}
                            {%$uftArr = array_keys(str_split(strrev(decbin($item.uft))),"1")%}
                            {%if in_array($itemindex, $uftArr)%}
                                {%if !$firstIf%}、{%/if%}<a href='{%op_exactqa_family_get_href ename=$item.ename%}' target="_blank">{%$item.ename|escape:'html'%}</a>
                                {%$firstIf = false%}
                            {%/if%}
                        {%/foreach%}
                    {%else%}
                        <a href='{%op_exactqa_family_get_href ename=$tplData.result[0].ename%}' target="_blank">{%$tplData.result[0].ename|escape:'html'%}</a>
                    {%/if%}
                    。</li>
                {%elseif count($result) == 1%}
                    {%foreach $result as $item%}
                        <a href='{%op_exactqa_family_get_href ename=$tplData.hash[$item.sign].ename%}' target="_blank">{%$tplData.hash[$item.sign].ename|escape:'html'%}</a>，
                    {%/foreach%}
                    {%foreach $result as $item%}
                        {%op_exactqa_family_level levelitem=$item itemindex=$item@key levelindex=$levelindex+1%}
                    {%/foreach%}
                {%else%}
                    {%foreach $result as $item%}
                        <a href='{%op_exactqa_family_get_href ename=$tplData.hash[$item.sign].ename%}' target="_blank">{%$tplData.hash[$item.sign].ename|escape:'html'%}</a>{%if !$item@last%}、{%/if%}
                    {%/foreach%}。</li><li><ul>
                    {%foreach $result as $item%}
                        <li class="op_exactqa_family_process_ext_icon">{%op_exactqa_family_level levelitem=$item itemindex=$item@key levelindex=$levelindex+1%}
                    {%/foreach%}</ul></li>
                {%/if%}
                *************************************************************************************************************%} {%*****以上内容压缩到一行以防止fis压缩出空格*****%} <a href='{%op_exactqa_family_get_href ename=$tplData.hash[$levelitem.sign].ename%}' target="_blank">{%$tplData.hash[$levelitem.sign].ename|escape:'html'%}</a>的{%$levelitem.property|escape:'html'%}是{%if count($result) == 0%}{%if count($tplData.result) > 1%}{%$firstIf = true%}{%foreach $tplData.result as $item%}{%$uftArr = array_keys(str_split(strrev(decbin($item.uft))),"1")%}{%if in_array($itemindex, $uftArr)%}{%if !$firstIf%}、{%/if%}<a href='{%op_exactqa_family_get_href ename=$item.ename%}' target="_blank">{%$item.ename|escape:'html'%}</a>{%$firstIf = false%}{%/if%}{%/foreach%}{%else%}<a href='{%op_exactqa_family_get_href ename=$tplData.result[0].ename%}' target="_blank">{%$tplData.result[0].ename|escape:'html'%}</a>{%/if%}。</li>{%elseif count($result) == 1%}{%foreach $result as $item%}<a href='{%op_exactqa_family_get_href ename=$tplData.hash[$item.sign].ename%}' target="_blank">{%$tplData.hash[$item.sign].ename|escape:'html'%}</a>，{%/foreach%}{%foreach $result as $item%}{%op_exactqa_family_level levelitem=$item itemindex=$item@key levelindex=$levelindex+1%}{%/foreach%}{%else%}{%foreach $result as $item%}<a href='{%op_exactqa_family_get_href ename=$tplData.hash[$item.sign].ename%}' target="_blank">{%$tplData.hash[$item.sign].ename|escape:'html'%}</a>{%if !$item@last%}、{%/if%}{%/foreach%}。</li><li><ul>{%foreach $result as $item%}<li class="op_exactqa_family_process_ext_icon">{%op_exactqa_family_level levelitem=$item itemindex=$item@key levelindex=$levelindex+1%}{%/foreach%}</ul></li>{%/if%} {%/function%} <ul class="op_exactqa_family_process_ext_text"> {%foreach $tplData.trace.level[1] as $item%} <li class="op_exactqa_family_process_ext_firsticon">{%op_exactqa_family_level levelitem=$item itemindex=$item@index levelindex=1%} {%/foreach%} </ul> {%/if%} </div> </div> {%/if%} </div><script type="text/javascript" >
    A.setup({
        EndParams: '{%$EndParams|escape:"javascript"%}',
        FamilyTree_TEXT_H: '{%$FamilyTree_TEXT_H|escape:"javascript"%}',
        FamilyTree_LINE_H: '{%$FamilyTree_LINE_H|escape:"javascript"%}',
        FamilyTreeLevelMax: '{%$FamilyTreeLevelMax|escape:"javascript"%}',
        FamilyTree: '{%json_encode($FamilyTree)%}'
    });
</script><script data-merge>A.setup(function(){var Ala = this;var canvasContainer = Ala.find('.op_exactqa_family_process_family')[0],canvas = Ala.find('.op_exactqa_family_process_canvas')[0];Ala.find('.op_exactqa_family_tools_fb').on('click', function(){$(this).replaceWith('<span>感谢反馈</span>');});var supportCanvas = !!document.createElement('canvas').getContext;if (!supportCanvas && canvas) {A.use('canvas', function(){A.ui.canvas.init(canvas);DrawFamilyTree();});} else if (canvas) {DrawFamilyTre{%*i*%}e();};function DrawFamilyTree(){var ctx = canvas.getContext('2d');var endParams = Ala.data.EndParams,TEXT_H = Number(Ala.data.FamilyTree_TEXT_H), LINE_H = Number(Ala.data.FamilyTree_LINE_H), FAMILY_LEVEL_MAX = Number(Ala.data.FamilyTreeLevelMax), FamilyTreeData = JSON.parse(Ala.data.FamilyTree), TEXT_W = 60, LEFT_X = 70, RIGHT_X = 300; var myDraw = {line : function(sx, sy, ex, ey, color){ctx.beginPath();ctx.strokeStyle = color || '#ccc';ctx.lineWidth = 2;ctx.lineCap = 'round';ctx.moveTo(sx, sy);{%*i*%}ctx.lineTo(ex, ey);ctx.stroke();},text : function(text, x, y, color, ulc){ var txt_dom = document.createElement('a');var txt_node = document.createTextNode(text);txt_dom.appendChild(txt_node);txt_dom.href = 'http://www.baidu.com/s?wd=' + text + endParams;txt_dom.target = '_blank';txt_dom.className = 'op_exactqa_family_process_canvas_text';txt_dom.style.color = color || '#333';txt_dom.style.top = y + 'px';canvasContainer.appendChild(txt_dom);var txtWidth = txt_dom.offsetWidth; txt_dom.style.left {%*i*%}= x - txtWidth/2 + 'px';if (ulc) {myDraw.line(x-txtWidth/2, y+TEXT_H-2, x+txtWidth/2, y+TEXT_H-2, ulc);};},family : function(level, textarr, xcl, txtc, ulc){ var count = textarr.length; var yPos = (TEXT_H + LINE_H) * (FAMILY_LEVEL_MAX - level);for (var i = 0; i < count; i++) {var xPos = xcl + (2 * i + 1 - count) * TEXT_W / 2; myDraw.text(textarr[i], xPos, yPos, txtc, ulc);if (level != FAMILY_LEVEL_MAX) {myDraw.line(xPos, yPos, xPos, yPos-LINE_H/2); if (count > 1 && i != count - 1) {myDraw.line(x{%*i*%}Pos, yPos-LINE_H/2, xPos+TEXT_W, yPos-LINE_H/2); }; };};if (level == FAMILY_LEVEL_MAX) { myDraw.line(xcl, TEXT_H, xcl, TEXT_H+LINE_H/2); if (xcl != LEFT_X) {myDraw.line(LEFT_X, TEXT_H+LINE_H/2, RIGHT_X, TEXT_H+LINE_H/2); };} else if (level + 1 != FAMILY_LEVEL_MAX) {myDraw.line(xcl, yPos-LINE_H/2, xcl, yPos-LINE_H); };}};var _pos = LEFT_X; for (var i = 0; i < FamilyTreeData.length; i++) {var _color = '#333', _ulc = undefined, thisData = FamilyTreeData[i];thisData.level = Number(thisData.level);if{%*i*%} ((_pos == LEFT_X && thisData.level < FAMILY_LEVEL_MAX) || (thisData.level == FAMILY_LEVEL_MAX && (i == 0 || i == FamilyTreeData.length - 1))) {_pos = LEFT_X;} else if (thisData.level == FAMILY_LEVEL_MAX && i + 1 != FamilyTreeData.length) {_pos = (LEFT_X+RIGHT_X)/2;} else if (_pos != LEFT_X) {_pos = RIGHT_X;};if (i == 0 || i + 1 == FamilyTreeData.length) {_color = '#000';};if (i == 0) {_ulc = '#f54545';} else if (i == FamilyTreeData.length - 1) {_ulc = '#389cff';};myDraw.family(thisData.level, t{%*i*%}hisData.text, _pos, _color, _ulc);};}});</script>{%/block%}