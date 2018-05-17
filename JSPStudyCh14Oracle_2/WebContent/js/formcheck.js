function formCheck() {
	
	if(document.writeForm.writer.value == "") {
		alert("작성자가 입력되지않았습니다.\n작성자를 입력해 주세요");
		document.writeForm.writer.focus();
		return false;
	}
	
	if(document.writeForm.title.value == "") {
		alert("글 제목이 입력되지 않았습니다..\n글 제목을 입력해 주세요");
		document.writeForm.title.focus();
		return false;
	}
	
	if(document.writeForm.content.value == "") {
		alert("글 내용이 입력되지 않았습니다..\n글 내용을 입력해 주세요");
		document.writeForm.content.focus();
		return false;
	}
}