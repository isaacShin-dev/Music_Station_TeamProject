/*chkSubmit(유효성 체크 대상, 메시지 내용)
출력영역 : alert(v_msg)
예시 : if(!chkSubmit("#Keyword","검색어를")) return;
*/


function chkData(v_item, v_msg){
	if($(v_item).val().replace(/\s/g,"")==""){
		alert(v_msg+" 입력해 주세요.");
		$(v_item).val("");
		$(v_item).focus();
		return false;
	}else{
		return true;
	}
}