/* chkSubmit(유효성 체크 대상, 메세지 내용) */
function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}


/*checkForm(유효성 체크 대상,placeholder 메세지 )
*출력영역 : placeholder
*예시 : if(!checkForm("#Keyword","검색어를")) return;
*/
function checkForm(item, msg){
	var message = "";
	if($(item).val().replace(/\s/g,"")==""){
		message = msg + " 입력해 주세요.";
		$(item).attr("placeholder", message);
		return false;
	}else{
		return true;
	}
}