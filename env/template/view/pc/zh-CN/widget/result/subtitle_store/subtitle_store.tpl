{%fis_widget%}{%$enableStore = true%}{%if array_key_exists("commendnum",$tplData.store) && $tplData.store.commendnum<10%}{%$enableStore = false%}{%/if%}{%if $enableStore%}{%$totalScore = ($tplData.store.totalscore)?$tplData.store.totalscore:5%}{%if isset($tplData.store.score) && $tplData.store.score > 0 && $totalScore > 0%}<style>.score {margin-top:4px;line-height:14px;font-size:13px;vertical-align:middle;margin-top:0\9}</style><div class="score" id="score_{%$resIndex%}"><span class="m"><span class="c-icon c-icon-star-gray"><span class="c-icon c-icon-star" style="width:{%round(($tplData.store.score/$totalScore)*100)%}%;"></span></span>&nbsp;评分:{%$tplData.store.score|escape%}/{%$totalScore|escape%}</span></div>{%/if%}{%/if%}{%/fis_widget%}