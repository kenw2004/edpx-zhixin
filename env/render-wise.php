<?php
// error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE );
error_reporting(0);
require_once(dirname(__FILE__) . '/CJSON.php');

$platform = getenv('OS');
if(stripos($platform, 'window') !== false) {
    $file = $_SERVER['APPDATA'] . '\\.edpx-zhixin\\data-wise.json';
} else {
    $file = $_SERVER['HOME'] . '/.edpx-zhixin/data-wise.json';
}

$config = file_get_contents($file);
// $config = CJSON::decode($config);
$config = json_decode($config, TRUE);

// 测试时，打印出所有的信息
// error_reporting(E_ALL);
date_default_timezone_set('Asia/Shanghai');

$GLOBALS['globalConf'] = array(
    'compileCheck' => true
);
$GLOBALS['TplLOG'] = array(
    'log_file' => 'tpl.log',
    'log_switch' => 0
);

$GLOBALS['ALADDIN_TEMPLATE_TYPE'] = 'aladdin';
$GLOBALS['STRUCT_TEMPLATE_TYPE'] = 'result';
$GLOBALS['ECOM_TEMPLATE_TYPE'] = 'ecom';

//定义全局变量
define('VUI_APP_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR. "app" . DIRECTORY_SEPARATOR . "view-ui" . DIRECTORY_SEPARATOR);
define('VUI_TEMPLATE_PATH', $config['templatePath'] . DIRECTORY_SEPARATOR . "template" . DIRECTORY_SEPARATOR);
define('VUI_LOG_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR . "log" . DIRECTORY_SEPARATOR);
define('VUI_TEMPLATE_PLUGIN_PATH', VUI_APP_PATH . DIRECTORY_SEPARATOR . "plugins");
define('VUI_TEMPLATE_ALADDIN_TEMPLATE_TYPE', "aladdin");

$GLOBALS['ECOM_TEMPLATE_TYPE'] = 'ecom';

require (VUI_APP_PATH . '/libs/Smarty/Smarty.class.php');
require (VUI_APP_PATH . '/utils/CSmarty.class.php');
require (VUI_APP_PATH . '/plugins/modifier.common_render.php');
require (VUI_APP_PATH . '/libs/log/CLog.class.php');
require (VUI_APP_PATH . '/utils/Util.php');
// require (dirname(__FILE__) . '/phplib/bd/Conf.php');
require (VUI_APP_PATH . '/libs/log/TplLog.php');
// require (VUI_APP_PATH . '/utils/base.php');
require (VUI_APP_PATH . '/utils/Volatile.php');

$smartyConf = array(
    'language' => 'zh-CN',
    'type' => 'ecom',
    'platform' => 'wise'
);
$smarty = CSmarty::getInstance($smartyConf);

$res = array(
    'wise' => array()
);

function render($tplName, $tplItem) {
    global $smarty;
    global $smartyConf;

    CSmarty::clearError();

    // 这里，$data有三种数据格式，第一种是我定义的最原始的数据格式，第二种是有的同学在display里面进行了细分，加了extData，第三种是平台的数据格式
    // 所以，在这里先进行一次处理
    // $data = preprocess(CJSON::decode(file_get_contents($tplItem['data'])));
    $data = preprocess(json_decode(file_get_contents($tplItem['data']), TRUE), $tplName);

    $result = $smarty->do_render($data, $tplName);

    // 有错误发生
    $errors = CSmarty::getError();

    if(count($errors) > 0) {
        return $errors[0];
    }

    return $result;
}

function preprocess($data, $tplName) {

    $result = array(
        'resultData' => array(),
        'strategy' => array()
    );
    if($data['document']) {
        // 第三种格式
        $result['resultData']['tplData'] = $data['document'][0]['item']['display'];
        $result['resultData']['extData'] = array(
            'OriginQuery' => $data['document'][0]['item']['key']
        );
        $result['strategy']['hilightWord'] = $data['document'][0]['item']['key'];

    } elseif($data['item'] && $data['item']['display'] && $data['item']['display']['tplData']) {
        // 第二种格式
        $result['resultData']['tplData'] = $data['item']['display']['tplData'];
        $result['resultData']['extData'] = $data['item']['display']['extData'];
        $result['resultData']['extData'] = $data['item']['display']['extData'];
        $result['strategy']['hilightWord'] = $data['item']['key'];
        if(isset($data['item']['display']['alaData'])) {
            $result['resultData']['alaData'] = $data['item']['display']['alaData'];
        }
    } else {
        // 第一种格式
        $result['resultData']['tplData'] = $data['item']['display'];
        $result['resultData']['extData'] = array(
            'OriginQuery' => $data['item']['key']
        );
        $result['strategy']['hilightWord'] = $data['item']['key'];
    }

    //添加tpl
    if(!isset($result['resultData']['alaData'])) {
        $result['resultData']['alaData'] = array();
    }

    $result['resultData']['alaData']['srcid'] = $tplName;
    $result['resultData']['alaData']['resourceid']= $tplName;

    return $result;
}

$wise = $config['wise'];
if($wise) {
    // 渲染左侧模板
    foreach($wise as $tplName => $tplItem) {
        $res['wise'][$tplName] = render($tplName, $tplItem);
    }
}

echo CJSON::encode($res);
?>
