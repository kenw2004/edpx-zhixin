{%extends file='sam_block_2/page.tpl'%}  {%block name="head_style_ext_block"%}.bds-list { border-bottom: 1px #F0F0F0 solid;}.bds-list { padding: 15px 0; margin: 0;}.bds-list:first-child { padding-top: 0;}{%block name="head_style_ext_block_tail"%}{%/block%}{%/block%}{%block name="foot_script_ext_tail_append"%}with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://img.baidu.com/hunter/m/psquery_h_6417.js?st='+~(new Date()/864e5)];
{%/block%}