<?php
//////////VARIABLES////////////
$max = 2;//defines how many links will be generated (-1 unlimited)
$folder = 'pages'; //folder of old files
$newfolder = 'newpages'; //folder to put new files
///////////////////////////////
function replace_bak($arr, $content){
    return str_replace(
        array_keys($arr),
        array_values($arr),
        $content
    );
}
function gen_replacements($arr, $key, $start=0){
    $rv = array();
    $h = "30e11a2462e87e5733b5956fb34cdcf1";
    foreach($arr as $a)
    {
        $rv["<!--{$h}-{$key}-{$start}-->"] = $a;
        $start++;
    }
    return $rv;
}
function replace($arr, $content){
    return str_replace(
        array_values($arr),
        array_keys($arr),
        $content
    );
}
function linker($content,$regex,$url,$max = -1){
	
    $link_replacements = array();
    $other_replacements = array();
    $title_replacements = array();
    preg_match_all('/<(img|input)(.*?) \/?>/iu', $content, $others);
    if(!empty($others[0]))
    {
        $other_replacements = gen_replacements($others[0], 'others');
        $content = replace($other_replacements, $content);
    }

    preg_match_all('/<title>(.+)<\/title>/', $content, $titles);
    if(!empty($titles[0]))
    {
        $title_replacements = gen_replacements($titles[0], 'others');
        $content = replace($title_replacements, $content);
    }

   
    preg_match_all(
        '/<a(.*?)href="(.*?)"(.*?)>(.*?)<\/a>/iu',
        $content,
        $links
    );
    if(!empty($links[0]))
    {
        $start = count($link_replacements);
        $tmp = gen_replacements($links[0], 'links', $start);
        $content = replace($tmp, $content);
        $link_replacements = array_merge(
            $link_replacements,
            $tmp
        );
    }

    $replace = sprintf(
        '$1<a href="%1$s" title="$2">$2</a>$3',
        $url
    );

    $content = preg_replace(
        $regex,
        $replace,
        $content,
        $max //-1 for forever
    );

    $content = replace_bak($link_replacements, $content);
    $content = replace_bak($title_replacements, $content);
    $content = replace_bak($other_replacements, $content);

	return $content;
}

function get_titles_and_content($folder){
    $filenames = scandir($folder);
    array_shift($filenames);
    array_shift($filenames);
    $items = array();
    $i = 0;
    foreach ($filenames as $title) {   
        $URL = $folder . '/' . $title;
        $contents = file_get_contents($URL);
        if (preg_match('/<title>(.+)<\/title>/', $contents, $matches) && isset($matches[1])){
           $items['files'][$i]['filename'] = $filenames[$i];
           $items['files'][$i]['contents'] = $contents;
           $items['titles'][$i]['regex'] = "/(\\b)(".$matches[1].")(\\b)/ui";
           $items['titles'][$i]['filename'] = $filenames[$i];
        }
        $i++;
    }
    return $items;
}
$files = get_titles_and_content($folder);
foreach($files['files'] as $file){
    foreach($files['titles'] as $title){
       $file['contents'] = linker($file['contents'],$title['regex'],$title['filename'],$max);
    }
    $newfile = fopen($newfolder."/".$file['filename'], 'w') or exit();
    fwrite($newfile, $file['contents']);
    fclose($newfile);

}
?>
Done!
