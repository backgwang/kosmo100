$(document).ready(function() {
	$('#summernote').summernote({
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR',
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('upfile', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : 'image_chk',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$(el).summernote('editor.insertImage', url);

			}
		});
	}

});
function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.writer.value;
	var content = frm.content.value;

	if (title.trim() == '') {
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == '') {
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == '') {
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}