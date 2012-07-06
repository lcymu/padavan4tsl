<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title>Rename Folder</title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">

<script type="text/javascript" src="../state.js"></script>
<script type="text/javascript">
var selectedPool = parent.getSelectedPool();
var selectedFolder = parent.getSelectedFolder();
var folderlist = parent.get_sharedfolder_in_pool(selectedPool);

function initial(){
	showtext($("selected_Pool"), selectedPool);
	showtext($("selected_Folder"), showhtmlspace(showhtmland(selectedFolder)));
	
	clickevent();
}

function clickevent(){
	$("Submit").onclick = function(){
			if(validForm()){
				$("pool").value = selectedPool;
				$("folder").value = selectedFolder;
				
				parent.showLoading();
				document.modifyFolderForm.submit();
				parent.hidePop("apply");
			}
		};
}

function validForm(){
	$("new_folder").value = trim($("new_folder").value);
	
	// share name
	if($("new_folder").value.length == 0){
		alert("<#File_content_alert_desc6#>");
		$("new_folder").focus();
		return false;
	}
	
	var re = new RegExp("[^a-zA-Z0-9 _-]+","gi");
	if(re.test($("new_folder").value)){
		alert("<#File_content_alert_desc7#>");
		$("new_folder").focus();
		return false;
	}
	
	if(parent.checkDuplicateName($("new_folder").value, folderlist)){
		alert("<#File_content_alert_desc8#>");
		$("new_folder").focus();
		return false;
	}
	
	if(trim($("new_folder").value).length > 12)
		if (!(confirm("<#File_content_alert_desc10#>")))
			return false;
	
	return true;
}
</script>
</head>

<body style="background: 0 none;" onLoad="initial();">
<form method="post" name="modifyFolderForm" action="modify_sharedfolder.asp" target="hidden_frame">
<input type="hidden" name="pool" id="pool" value="">
<input type="hidden" name="folder" id="folder" value="">
	<table class="table well aidisk_table" cellpadding="0" cellspacing="0">
	<thead>
      <tr>
          <td width="50%">
              <b><#ModFolderTitle#></b>
          </td>
          <td style="text-align: right">
              <a href="javascript:void(0)" onclick="parent.hidePop('OverlayMask');"><i class="icon icon-remove"></i></a>
          </td>
        </tr>
	</thead>	  
	<tbody>
      <tr>
        <td  colspan="2" height="30"><#ModFolderAlert#></td>
      </tr>
      <tr>
        <th width="50%"><#PoolName#>: </th>
        <td colspan="3"><span id="selected_Pool"></span></td>
	  </tr>
      <tr>
        <th><#FolderName#>: </th>
        <td colspan="3"><span id="selected_Folder"></span></td>
      </tr>
      <tr>
        <th><#NewFolderName#>: </th>
        <td><input class="input" type="text" name="new_folder" id="new_folder"></td>
      </tr>
      <tr>
        <th colspan="2" style="text-align: center;"><input id="Submit" type="button" class="btn btn-primary" style="width: 170px;" value="<#CTL_modify#>"></th>
      </tr>
	</tbody>	  
    </table>
</form>
</body>
</html>
