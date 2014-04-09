{%extends 'c_base.tpl'%} {%block name='data_modifier'%}{%$extData.feData.hasBorder=true%}{%/block%}{%block name='content'%}<div class="op_guahaokv_container"><div class="op_guahaokv_questions"> {%if $tplData.question[0]%} <div class="op_guahaokv_questiontip"> <span class="op_guahaokv_goon">回答1-</span><span class="op_guahaokv_questionover">{%$tplData.question[0].over%}</span>个问题，就能获得就诊建议 </div> {%/if%} <div class="op_guahaokv_line"></div> {%if $tplData.question[0].num && $tplData.ans[0].pre%} <div class="c-gap-top-small op_guahaokv_question op_guahaokv_question1"> <span class="op_guahaokv_qutip">问题<span class="op_guahaokv_qunum">{%$tplData.question[0].num%}</span>：</span><span class="op_guahaokv_qutext">{%$tplData.ans[0].pre%}</span> <div style="clear:both; height:0; font-size:0px; overflow:hidden;"></div> </div> {%/if%} <div class="c-row c-gap-top op_guahaokv_setup"> {%if $tplData.yesid%} <input type="hidden" value="{%$tplData.yesid%}" class="op_guahaokv_yesid" /> {%/if%} {%if $tplData.noid%} <input type="hidden" value="{%$tplData.noid%}" class="op_guahaokv_noid" /> {%/if%} <input type="hidden" value="" class="op_guahaokv_backtext" /> <input type="hidden" value="" class="op_guahaokv_backtext2" /> <span class="op_guahaokv_yes c-gap-right c-btn c-btn-primary" data-click="{'fm':'beha'}">是</span><span class="op_guahaokv_no c-gap-right c-btn c-btn-primary" data-click="{'fm':'beha'}">否</span><span class="op_guahaokv_back op_guahaokv_back1 OP_LOG_BTN" data-click="{'fm':'beha'}"></span> </div> <div class="c-gap-top op_guahaokv_standardtip1"> {%if $tplData.standardtip%} {%$tplData.standardtip%} {%/if%} </div> </div> <div class="op_guahaokv_answers"> <div class="op_guahaokv_questiontip">根据你的回答，就诊建议如下：</div> <div class="op_guahaokv_line"></div> <div class="c-gap-top-small op_guahaokv_question op_guahaokv_question2"> <div class="op_guahaokv_question_text"></div> <span class="op_guahaokv_back op_guahaokv_back2 OP_LOG_BTN" data-click="{'fm':'beha','rsv_gtype':'last'}"></span> </div> <div class="c-gap-top op_guahaokv_recom">推荐科室</div> <div class="c-gap-top-small op_guahaokv_office"></div> <div clas{%*i*%}s="c-gap-top op_guahaokv_standardtip2"></div> </div></div><script >
    A.setup({
        query:'{%$extData.OriginQuery%}',
      	srcid:'20282'
    });
</script>{%/block%}