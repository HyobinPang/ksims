<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
var categoryContentBasic = [
	{ category: 'South America', title: 'Brazil' },
	{ category: 'South America', title: 'Peru' },
	{ category: 'North America', title: 'Canada' },
	{ category: 'North America', title: 'America' },
	{ category: 'Asia', title: 'South Korea' },
	{ category: 'Asia', title: 'Japan' },
	{ category: 'Asia', title: 'China' },
	{ category: 'Europe', title: 'Denmark' },
	{ category: 'Europe', title: 'England' },
	{ category: 'Europe', title: 'France' },
	{ category: 'Europe', title: 'Germany' },
	{ category: 'Africa', title: 'Ethiopia' },
	{ category: 'Africa', title: 'Nigeria' },
	{ category: 'Africa', title: 'Zimbabwe' },
];

$(document).ready(function () {
	fileCheck();
	//協力会社の場合チェック状態
	$('#partnerCompFlgCkb').checkbox({ onChange: function abc() {
	    if ($(this).is(':checked')) {
	    	$('.font').empty();
	    	$('.CheckedCss').css('background-color','#afffb9');
	    	    	
	    	var partnerId = ${curRegistId.partnerId};
	    	$('#empId').val(partnerId);
	    	$('#empIdHdn').val(partnerId);
	    	$('#empName').val("");
	    	
	    	$('#careerFlgCkb').checkbox('uncheck');
	    	$('#careerPoint').attr("readonly",true).attr("disabled",true);

	    	$('#pst_select option[value=90]').prop('selected', 'selected').change();
        	$("#pst_select").attr("readonly",true).attr("disabled", true);
        	
        	$("#empAge").val("");
	    	$("#empAge").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#dependentCountDd option[value=0]').prop('selected', 'selected').change();
	    	$("#dependentCountDd").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#empGenderDd option[value=P]').prop('selected', 'selected').change();
	    	$("#empGenderDd").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#departmentCodeDd option[value=99]').prop('selected', 'selected').change();
	    	$("#departmentCodeDd").attr("readonly",true).attr("disabled",true);
	    	$("#stayExpirationDate").attr("readonly",true).attr("disabled",true);
	    	$("#dormInDate").attr("readonly",true).attr("disabled",true);
	    	$("#dormOutDate").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#healthInsuranceFlgCkb').checkbox('uncheck');
	    	$("#healthInsuranceFlg").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#pensionFlgCkb').checkbox('uncheck');
	    	$("#pensionFlg").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#empInsuranceFlgCkb').checkbox('uncheck');
	    	$("#empInsuranceFlg").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#careerFlgCkb').checkbox('uncheck');
	    	$("#careerFlg").attr("readonly",true).attr("disabled",true);
        	
        	$("#stayExpirationNumber").val("");
	    	$("#stayExpirationNumber").attr("readonly",true).attr("disabled",true);
	    	
	    	$('#empSpouseFlgCkb').checkbox('uncheck');
	    	$("#empSpouseFlg").attr("readonly",true).attr("disabled",true);
	    	
	    	$("#residentRegistrationNumber").val("");
	    	$("#residentRegistrationNumber").attr("readonly",true).attr("disabled",true);
	    	
	    	$("#myNumber").val("");
	    	$("#myNumber").attr("readonly",true).attr("disabled",true);
	    	
	    	$("#empAddr").val("");
	    	$("#empAddr").attr("readonly",true).attr("disabled",true);
	    	$("#empPost").val("");
	    	$("#empPost").attr("readonly",true).attr("disabled",true);
	    	
	    	$("#pensionNumber").val("");
	    	$("#pensionNumber").attr("readonly",true).attr("disabled",true);
	    	
 	    	$("#bankBookNumber").val("");
	    	$("#bankBookNumber").attr("readonly",true).attr("disabled",true); 
 	    	$("#bankName").val("");
	    	$("#bankName").attr("readonly",true).attr("disabled",true); 
 	    	$("#bankBran").val("");
	    	$("#bankBran").attr("readonly",true).attr("disabled",true); 
 	    	$("#bankNumGubun").val("");
	    	$("#bankNumGubun").attr("readonly",true).attr("disabled",true); 

 	    	$("#payLevel").val("");
	    	$("#payLevel").attr("readonly",true).attr("disabled",true); 
 	    	$("#empSectionName").val("");
	    	$("#empSectionName").attr("readonly",true).attr("disabled",true); 
	    	
	    	$('#partnerCompFlg').val(true);
	    } else {
	    	//css 変更
	    	$('.font').append('＊');
	    	$('.CheckedCss').css('background-color','');
	    	
	    	var empId = ${curRegistId.empId};
	    	$('#empId').val(empId);
	    	$('#empIdHdn').val(empId);
	    	$('#empName').val("");
	    	
	    	$('#pst_select option[value=-1]').prop('selected', 'selected').change();
	    	$("#pst_select").attr("readonly",false).attr("disabled", false);
        	
        	$("#empAge").val("1994-01-01");
	    	$("#empAge").attr("readonly",false).attr("disabled",false);
	    	
	    	$('#dependentCountDd option[value=-1]').prop('selected', 'selected').change();
	    	$("#dependentCountDd").attr("readonly",false).attr("disabled",false);
	    	
	    	$('#empGenderDd option[value=-1]').prop('selected', 'selected').change();
	    	$("#empGenderDd").attr("readonly",false).attr("disabled",false);
	    	
	    	$('#departmentCodeDd option[value=-1]').prop('selected', 'selected').change();
	    	$("#departmentCodeDd").attr("readonly",false).attr("disabled",false);
	    	$("#stayExpirationDate").attr("readonly",false).attr("disabled",false);
	    	$("#dormInDate").attr("readonly",false).attr("disabled",false);
	    	$("#dormOutDate").attr("readonly",false).attr("disabled",false);
	    	$("#healthInsuranceFlg").attr("readonly",false).attr("disabled",false);
	    	$("#pensionFlg").attr("readonly",false).attr("disabled",false);
	    	$("#empInsuranceFlg").attr("readonly",false).attr("disabled",false);
	    	$("#careerFlg").attr("readonly",false).attr("disabled",false);

	    	$("#stayExpirationNumber").attr("readonly",false).attr("disabled",false);
	    	$("#empSpouseFlg").attr("readonly",false).attr("disabled",false);
	    	$("#residentRegistrationNumber").attr("readonly",false).attr("disabled",false);
	    	$("#myNumber").attr("readonly",false).attr("disabled",false);
	    	$("#empAddr").attr("readonly",false).attr("disabled",false);
	    	$("#empPost").attr("readonly",false).attr("disabled",false);
	    	$("#pensionNumber").attr("readonly",false).attr("disabled",false);

	    	$("#bankName").attr("readonly",false).attr("disabled",false);
	    	$("#bankBran").attr("readonly",false).attr("disabled",false);
	    	$("#bankNumGubun").attr("readonly",false).attr("disabled",false);
	    	$("#bankBookNumber").attr("readonly",false).attr("disabled",false);

	    	$("#payLevel").attr("readonly",false).attr("disabled",false);
	    	$("#empSectionName").attr("readonly",false).attr("disabled",false);
	    	
	    	$('#partnerCompFlg').val(false);
	    }
	}
	});

    $(function() {   
        var x = new Date(1994, 0, 1, 0, 0, 0, 0);
        $("#empAge").datepicker("setDate", x);
    }); 
	
	$('.emp.checkbox').checkbox();
	
	careerFlgResult();
	empInsuranceFlgResult();
	pensionFlgResult();
	healthInsuranceFlgResult();
	//toggle状態
	function healthInsuranceFlgResult() {
		var healthInsuranceFlg = document.getElementById("healthInsuranceFlg").value;
		if(healthInsuranceFlg=="true"){
			$('#healthInsuranceFlgCkb').checkbox('check');
		}else{
			$('#healthInsuranceFlgCkb').checkbox('uncheck');
		}
	};
	
	$('#healthInsuranceFlgCkb').checkbox({ onChange: function() {
	    if ($(this).is(':checked')) {
	    	$('#healthInsuranceFlg').val(true);
	    } else {
	    	$('#healthInsuranceFlg').val(false);
	    }
	}
	});

	function pensionFlgResult() {
		var pensionFlg = document.getElementById("pensionFlg").value;
		if(pensionFlg=="true"){
			$('#pensionFlgCkb').checkbox('check');
		}else{
			$('#pensionFlgCkb').checkbox('uncheck');
		}
	};
	
	$('#pensionFlgCkb').checkbox({ onChange: function() {
	    if ($(this).is(':checked')) {
	    	$('#pensionFlg').val(true);
	    } else {
	    	$('#pensionFlg').val(false);
	    }
	}
	});

	function empInsuranceFlgResult() {
		var empInsuranceFlg = document.getElementById("empInsuranceFlg").value;
		if(empInsuranceFlg=="true"){
			$('#empInsuranceFlgCkb').checkbox('check');
		}else{
			$('#empInsuranceFlgCkb').checkbox('uncheck');
		}
	};
		
	$('#empInsuranceFlgCkb').checkbox({ onChange: function() {
	    if ($(this).is(':checked')) {
	    	$('#empInsuranceFlg').val(true);
	    } else {
	    	$('#empInsuranceFlg').val(false);
	    }
	}
	});

	function careerFlgResult() {
		var careerFlg = document.getElementById("careerFlg").value;
		if(careerFlg=="true"){
			$('#careerFlgCkb').checkbox('check');
		}else{
			$('#careerFlgCkb').checkbox('uncheck');
		}
	};
	
	$('#careerFlgCkb').checkbox({ onChange: function() {
	    if ($(this).is(':checked')) {
	    	$('#careerPoint').attr("readonly",false).attr("disabled",false);
	    	$('#careerFlg').val(true);
	    } else {
	    	$('#careerPoint').attr("readonly",true).attr("disabled",true);
	    	$('#careerFlg').val(false);
	    }
	}
	});	
	
	//カレンダー
	 $("#stayExpirationDate, #dormInDate, #dormOutDate, #hiredDate, #empAge").datepicker({
			closeText: '閉じる',
			prevText: '先月',
			nextText: '来月',
			currentText: '今日',
			monthNames: ['1月(JAN)','2月(FEB)','3月(MAR)','4月(APR)','5月(MAY)','6月(JUN)',
			'7月(JUL)','8月(AUG)','9月(SEP)','10月(OCT)','11月(NOV)','12月(DEC)'],
			monthNamesShort: ['1月','2月','3月','4月','5月','6月',
			'7月','8月','9月','10月','11月','12月'],
			dayNames: ['日','月','火','水','木','金','土'],
			dayNamesShort: ['日','月','火','水','木','金','土'],
			dayNamesMin: ['日','月','火','水','木','金','土'],		
			dateFormat : 'yy-mm-dd',
			yearRange: 'c-50:c+50',
			changeYear: true
     });
	
	$('#countrySearch').search({
		type: 'category',
		source: categoryContentBasic
	});
 });

//確認メッセージ及び情報 submit
function empRegist() {
	var checked = $('#partnerCompFlgCkb').is(':checked');
	if(!checked){
		if($("#pst_select option:selected").val()=="-1"){
			alert("職位を選択してください。")
			$("#pst_select").focus();
			$("#pst_select option:selected").val()
			return false;
		}
		if($("#dependentCountDd option:selected").val()=="-1"){
			alert("扶養家族数を選択してください。")
			$("#dependentCountDd").focus();
			return false;
		}
		if($("#empGenderDd option:selected").val()=="-1"){
			alert("性別を選択してください。")
			$("#empGenderDd").focus();
			return false;
		}
		if($("#departmentCodeDd option:selected").val()=="-1"){
			alert("所属部署を選択してください。")
			$("#departmentCodeDd").focus();
			return false;
		}
	}
	if($("#empName").val()==""){
		alert("社員名を入力してください");
		$("#empName").focus();
		return false;
	}
	if($("#careerFlg").val()=="true"){
		if($("#careerPoint").val()==""){
			alert("経歴点数を入力してください");
			$("#careerPoint").focus();
			return false;
		}
	}
	if($("#hiredDate").val()==""){
		alert("入社日を入力してください");
		$("#hiredDate").focus();
		return false;
	}
	if($("#nationality").val()==""){
		alert("国籍を入力してください");
		$("#nationality").focus();
		return false;
	}
	if($("#empNameKana").val()==""){
		alert("社員名（カナ）を入力してください");
		$("#empNameKana").focus();
		return false;
	}
	if($("#empNameEng").val()==""){
		alert("社員名（英字）を入力してください");
		$("#empNameEng").focus();
		return false;
	}
	if($("#companyMail").val()==""){
		alert("会社メールを入力してください");
		$("#companyMail").focus();
		return false;
	}
	if($("#emergencyPhoneNumber").val()==""){
		alert("緊急連絡先（母国）を入力してください");
		$("#emergencyPhoneNumber").focus();
		return false;
	}
	if($("#bankName").val()==""){
		alert("銀行名を入力してください");
		$("#bankName").focus();
		return false;
	}
	if($("#bankBran").val()==""){
		alert("支店名を入力してください");
		$("#bankBran").focus();
		return false;
	}
	if($("#bankNumGubun").val()==""){
		alert("区分を入力してください");
		$("#bankNumGubun").focus();
		return false;
	}
	if($("#bankBookNumber").val()==""){
		alert("口座番号を入力してください");
		$("#bankBookNumber").focus();
		return false;
	}
	if (confirm("登録しますか？") == true) {
		document.getElementById("employees").action="EmployeesWriteController"
		document.getElementById('employees').submit();
	} else {
		return false;
	}
}

function changeDropdown(id, value) {
	$(id).val(value);
	
	if(id == "#positionCode" && value == "90") {
		$('#partnerCompFlgCkb').checkbox('check');
	}
}
//在留期限 , 社員寮退去日,社員寮入居日 check
function stayDateDormCheck(obj){
	var str = obj.value;
	if(str!==""){
		if(!str.match(/^(20|21|22|23|24|25|26|27|28|29)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/)){
			alert("正しい日付を入力してください　例）YYYY-MM-DD");
			obj.value = "";
			return false;	
		}
	}
};
//生年月日 check
function empAgeCheck(obj){
	var str = obj.value;
	if(str!==""){
		if(!str.match(/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/)){
			alert("正しい日付を入力してください　例）YYYY-MM-DD");
			obj.value = "";
			return false;	
		}
	}
};
//入社日 check
function hiredDateCheck(obj){
	var str = obj.value;
	if(!str.match(/^(20|21|22|23|24|25|26|27|28|29)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/)){
		alert("正しい日付を入力してください　例）YYYY-MM-DD");
		obj.value = "";
		return false;	
	}
};
//社員名 check
function empNameCheck(obj){
	var str = obj.value;
	var id  = obj.id;
	var partnerCompFlg = $('#partnerCompFlg').val();
	//漢字 check
	if(str !== ""){
		if(id=="empName"){
			if(!str.match(/^[\u30a0-\u30ff\u3040-\u309f\u3005-\u3006\u30e0-\u9fcf　]+$/)){
				alert("正しい名前を入力してください");
				obj.value = "";
				return false;	
			}
		}else if(id=="empNameKana"){
			if(!isZenkakuKana(str)){
				alert("正しい名前（全角カナ）を入力してください");
				obj.value = "";
				return false;	
			}
		}else if(id=="empNameEng"){
			if(!isEnglish(str)){
				alert("正しい名前（英字）を入力してください");
				obj.value = "";
				return false;	
			}
		}		
	}
};
function isZenkakuKana(s) {
    return !!s.match(/^[ァ-ヶー　]*$/);
}
function isEnglish(s) {
    return !!s.match(/^[a-zA-Z ]*$/);
}
//電話番号check
function phoneNumberCheck(obj){
	var str = obj.value;
	if(str!==""){
		if(!str.match(/\d{2,3}[-](\d{3}|\d{4})[-](\d{4}$)/g)){
		    alert("正しい電話番号を入力してください 例）000-0000-0000");
		    obj.value = "";
			return false;
		}
	}
};
//経歴点数 check
function careerPointCheck(obj) {
	var str = obj.value;
	if(str.match(/[^0-9]/g)){
		alert("数字を入力してください");
		obj.value = "";
		return false;	
	}
}
//会社メール check
function companyMailCheck(obj) {
	var str = obj.value;
	var reg = /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/;
	if(!str.match(reg)){
		alert("正しいメールアドレスを入力してください　例）OOOOO@OOO.OOO");
		obj.value = "";
		return false;
	}
}
//住民登録番号check 
function juminCheck(obj){
	var str = obj.value;
	if(str!==""){
		if(!str.match(/\d{6}[-](\d{7}$)/g)){
		    alert("正しい住民登録番号を入力してください 例）000000-0000000");
		    obj.value = "";
			return false;
		}
		
		var yy = str.substring(0,2);
		var mm = str.substring(2,4);
		var dd = str.substring(4,6);
		var sex= str.charAt(7);
		var pre_yy = (sex=="1" || sex=="2") ? "19":"20";
		var totalyy  = pre_yy+yy;
		
		if(mm<01||mm>12){
			alert("住民登録番の月に該当する二桁が誤っています。");
			obj.focus();
		}
		
		if(dd<01){
			alert("住民登録番の日付が誤っています。");
			obj.focus();
		}
		var test_dd;
		if (mm==01 || mm==03 || mm==05 || mm==07 || mm==08 || mm==10 || mm==12) test_dd=31;
		if (mm==04 || mm==06 || mm==09 ||mm==11) test_dd=30;
		if (mm==02) {
		if (((totalyy % 4)==0) && ((totalyy % 100)!=0) || ((totalyy % 400)==0)) test_dd=29;
		else test_dd=28;
		}
		if (dd > test_dd) {
			alert("住民登録番の日付が誤っています。");
			obj.focus();
			return; 
		}
	}
};
//郵便番号check 
function empPostCheck(obj){
	var str = obj.value;
	if(str!==""){
		if(!str.match(/\d{3}[-](\d{4}$)/g)){
		    alert("正しい郵便番号を入力してください 例）000-0000");
		    obj.value = "";
			obj.focus();
			return false;
		}
	}
}

function backPage() {
	location.href='${pageContext.request.contextPath}/EmployeesListController.do?curPage=1';
}

/* HB~ */
		function fileCheck(){//다운로드 버튼 안눌리게
		$.each($('input[name=fileName]'), function(index, el){
			if($(this).val()==""){
				document.getElementById('btn_dn'+index).setAttribute('disabled', 'disabled');
			}
		});
	}

		function Download(e){ //다운로드
			var fileName= $('#fileName'+e).val();
			var path =$('#fileUrl'+e).val();
			fileName = encodeURIComponent(fileName);
			path = encodeURIComponent(path);
			
			if (path == "") {
				alert("登録されたファイルがありません。");
				return false;
			}
			
			location.href = "${pageContext.request.contextPath}/download?path=" + path + "&fileName=" + fileName;
		} 
		
		function getFileName(index) { //파일 업로드 버튼 문자 바뀌기
			var fileId = "#btn" + index;
			var fileName = $(fileId).prop('files')[0].name;
			
			var byteLength = 0;
			for (var inx = 0; inx < fileName.length; inx++) {
				var oneChar = escape(fileName.charAt(inx));
				if (oneChar.length == 1) {
					byteLength++;
				} else if (oneChar.indexOf("%u") != -1) {
					byteLength += 2;
				} else if (oneChar.indexOf("%") != -1) {
					byteLength += oneChar.length / 3;
				}
			}
			
			if(byteLength < 16){
				document.getElementById("btnUp" + index).innerHTML = fileName;	
			}else{
				var btnId = 'btnUp'+index;
				$('#' + btnId).attr('title', fileName); 

				fileName = fileName.substring(0,6) + "...";
				document.getElementById("btnUp" + index).innerHTML = fileName;	
			}
		}		
</script>
<style>
h1 {
  font-family: "Arial", "メイリオ";
  position: relative;
  color: #6495ed;
  line-height: 1.4;
  -webkit-box-reflect: below -20px -webkit-linear-gradient(top,rgba(0,0,0,0),rgba(0,0,0,0) 10%,rgba(0, 0, 0, 0.6));
}

.table td, .table th{
	padding: 0.3rem;
	vertical-align: middle;
}
label{ 
	margin: 0px !important;
}
th{
	vertical-align:middle; text-align: right; background:#bee5eb;
}
.prompt{
	border-radius: .25rem !important;
	padding: .375rem .75rem !important;
	border: 1px solid #ced4da !important;
	color: #495057 !important;
}

</style>
</head>
<body>

<div class="content_margin" style="height:500px;">
	<div style="position: absolute; left: 50%; transform:translate(-50%); width: 800px;">
	<form id="employees" name="employees" action="EmployeesWriteController" method="post" enctype="multipart/form-data">
	<h1 ><i class="caret square left icon"></i>社員情報登録</h1>
	<table class="table" >
	<tr>
	</tr>
	<tr>
		<table class="table-bordered table-hover" style="border-bottom:none; border-left:none;">
			<tr>
				<td colspan="4"><div class="ui checkbox" id="partnerCompFlgCkb"><input type="checkbox" id="partnerCompFlg" name="partnerCompFlg" value="false" /><label>協力会社を登録する。</label></div></td>
			</tr>
			<tr>
				<th style="width:150px"><label for="empId" >社員番号</label></th>
				<td ><input type="text" class="form-control" name="empId" id="empId" style="width:200px" "value="${curRegistId.empId}" disabled />
				<th class="CheckedCss"><label for="hiredDate"><font color="red" class="font">＊</font>入社日</label></th>
				<td><input type="text" class="form-control" name="hiredDate" id="hiredDate" value="" onchange="hiredDateCheck(this)" autocomplete="off"/></td>
			</tr>
			<tr>
				<th style="width:150px" class="CheckedCss"><label for="empName"><font color="red" class="font">＊</font>社員名</label></th>
				<td style="width:150px">（漢字）<input type="text" class="form-control" name="empName" id="empName" value=""  onblur="empNameCheck(this)" maxlength="50"/></td>
				<td style="width:150px">（カナ）<input type="text" class="form-control" name="empNameKana" id="empNameKana" value="" onblur="empNameCheck(this)" maxlength="50"/></td>
				<td style="width:150px">（英字）<input type="text" class="form-control" name="empNameEng" id="empNameEng" value="" onblur="empNameCheck(this)" maxlength="50"/></td>
			</tr>	
			<tr>	
				<th><label for="empAge">生年月日</label></th>
				<td><input type="text" class="form-control" name="empAge" id="empAge" value="" onchange="empAgeCheck(this)"></td>
				<th><label for="empGender"><font color="red" class="font">＊</font>性別</label></th>
				<td>
				<select name="empGenderDd" id="empGenderDd" onchange="changeDropdown('#empGender', this.value)" class="ui search selection dropdown" style="width: 70px; height: 40px !important; padding: 3px !important;">
					<option value="-1">選択</option>
					<option value="P">協力会社</option>
					<option value="M">男性</option>
					<option value="F">女性</option>
				</select>
				<input type="hidden" id="empGender" name="empGender" value="-1" />	
				</td>
			</tr>	
			<tr>
				<th><label for="empPost">郵便番号</label></th>
				<td colspan=3><input type="text" class="form-control" name="empPost" id="empPost" style="width:200px"  value=""  onchange="empPostCheck(this)" maxlength="8"/></td>
			<tr>
				<th><label for="empAddr">住所</label></th>
				<td colspan=3><input type="text" class="form-control" name="empAddr" id="empAddr" value=""  maxlength="100"/></td>
			</tr>
			<tr>
				<th class="CheckedCss"><label for="phoneNumber">電話番号</label></th>
				<td><input type="text" class="form-control" name="phoneNumber" id="phoneNumber" value="${empManage.phoneNumber}" onchange="phoneNumberCheck(this)" maxlength="15"/></td>
				<th class="CheckedCss"><label for="emergencyPhoneNumber"><font color="red" class="font">＊</font>緊急連絡先（母国）</label></th>
				<td><input type="text" class="form-control" name="emergencyPhoneNumber" id="emergencyPhoneNumber" value="${empManage.phoneNumber}" onchange="phoneNumberCheck(this)" maxlength="15"/></td>
			</tr>
			<tr>
				<th><label for="pst_select"><font color="red" class="font">＊</font>職位</label></th>
				<td >
				<select name="pst_select" id="pst_select" onchange="changeDropdown('#positionCode', this.value)"  class="ui search selection dropdown" style="width: 70px; height: 40px !important; padding: 3px !important;">
					<option value="-1">選択</option>
					<c:forEach items="${pstDropBox}" var="list" varStatus="vs">
						<option value="${list.positionCode}">${list.positionName}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="positionCode" name="positionCode" value="-1" />			
				</td>
				<th><label for="pst_select"><font color="red" class="font">＊</font>号俸</label></th>
				<td><input type="number" min='0' max='99' step='1' id="payLevel" name="payLevel" value="0"  class="form-control" style="text-align: right !important; width: 72px; float: left;"></td>
			<tr>
			<tr>
				<th><label for="departmentCode"><font color="red" class="font">＊</font>部署</label></th>
				<td>
				<select name="departmentCodeDd" id="departmentCodeDd" onchange="changeDropdown('#departmentCode', this.value)"  class="ui search selection dropdown" style="width: 70px; height: 40px !important; padding: 3px !important;">
					<option value="-1">選択</option>
					<c:forEach items="${dpDropBox}" var="list" varStatus="vs">
						<option value="${list.departmentCode}">${list.departmentName}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="departmentCode" name="departmentCode" value="-1" />					
				</td>
				<th><label for="sectionName">課</label></th>
				<td><input type="text" class="form-control" name="empSectionName" id="empSectionName" value=""  /></td>
			</tr>
			<tr>
				<th class="CheckedCss"><label for="companyMail"><font color="red" class="font">＊</font>会社メール</label></th>
				<td colspan=3><input type="text" class="form-control" name="companyMail" id="companyMail" value="" onchange="companyMailCheck(this)"  autocomplete="off"/></td>
			</tr>
			<tr>
				<th><label for="spouse"><font color="red" class="font">＊</font>配偶者有無</label></th>
				<td>
					<div id="empSpouseFlgCkb" class="ui emp toggle checkbox">
	 					<input type="checkbox" name="empSpouseFlg" id="empSpouseFlg" value="false">
					</div>
				</td>
				<th><label for="dependentCount"><font color="red" class="font">＊</font>扶養家族数</label></th>
				<td>
				<select name="dependentCountDd" id="dependentCountDd" onchange="changeDropdown('#dependentCount', this.value)" class="ui search selection dropdown" style="width: 70px; height: 40px !important; padding: 3px !important;">
					<option value="-1">選択</option>
					<option value="0">無し</option>
					<c:forEach begin="1" end="9" step="1" varStatus="vs">
						<option value="${vs.count}">${vs.count}名</option>
					</c:forEach>
				</select>
				<input type="hidden" id="dependentCount" name="dependentCount" value="-1" />	
				</td>
			</tr>
			<tr>
				<th><label ><font color="red" class="font">＊</font>口座情報</label></th>
				<td colspan=3>
						<table class="table-bordered" style="border-bottom:none; border-left:none;background-color:#eee;">
						<td>銀行<input type="text" class="form-control" name="bankName" id="bankName" value="" onchange="" /></td>
						<td>支店<input type="text" class="form-control" name="bankBran" id="bankBran" value="" onchange=""  style="width:120px"/></td>
						<td>区分<input type="text" class="form-control" name="bankNumGubun" id="bankNumGubun" value="" onchange="" style="width:100px"/></td>
						<td>口座番号<input type="text" class="form-control" name="bankBookNumber" id="bankBookNumber" value="" onchange="" style="width:120px"/></td>
				      </table>
				</td>
			</tr>	      
			<tr>
				<th><label for="stayExpirationNumber">在留カード番号</label></th>
				<td><input type="text" class="form-control" name="stayExpirationNumber" id="stayExpirationNumber" value="" onchange=""  autocomplete="off"/></td>
				<th><label for="stayExpirationDate">在留期限</label></th>
				<td><input type="text" class="form-control" name="stayExpirationDate" id="stayExpirationDate" value="" onchange="stayDateDormCheck(this)" autocomplete="off"  /></td>
				<input type="hidden" id="empIdHdn" name="empIdHdn" value="${curRegistId.empId}" /></td>
			</tr>
			<tr>
				<th><label for="myNumber">マイナンバー</label></th>
				<td><input type="text" class="form-control" name="myNumber" id="myNumber" value="" onchange=""  autocomplete="off"/></td>
				<th><label for="pensionNumber">年金番号</label></th>
				<td><input type="text" class="form-control" name="pensionNumber" id="pensionNumber" value="" onchange=""  autocomplete="off"/></td>
			</tr>
			<tr>
				<th class="CheckedCss"><label for="nationality"><font color="red" class="font">＊</font>国籍</label></th>
				<td>
					<div class="ui search Country icon field" id="countrySearch">
						<input type="text" class="prompt form-control" name="nationality" id="nationality" value="" onchange=""  autocomplete="off" />
						<div class="results"></div>
					</div>
				</td>
				<th><label for="residentRegistrationNumber">住民登録番号</label></th>
				<td><input type="text" class="form-control" name="residentRegistrationNumber" id="residentRegistrationNumber" value="" onchange="juminCheck(this)"  autocomplete="off"/></td>
			</tr>
			<tr>
				<th><label for="dormInDate">社員寮入居日</label></th>
				<td><input type="text" class="form-control" name="dormInDate" id="dormInDate" value="" onchange="stayDateDormCheck(this)"  autocomplete="off"/></td>
				<th><label for="dormOutDate">社員寮退去日</label></th>
				<td><input type="text" class="form-control" name="dormOutDate" id="dormOutDate" value="" onchange="stayDateDormCheck(this)"  autocomplete="off" /></td>			
			</tr>
			<tr>	
				<th><label for="healthInsuranceFlg">健康保険社納</label></th>
				<td>
					<div id="healthInsuranceFlgCkb" class="ui emp toggle checkbox">
	 					<input type="checkbox" id="healthInsuranceFlg" name="healthInsuranceFlg" value="false">
					</div>
				</td>
				<th><label for="empAge">厚生年金社納</label></th>
				<td>
					<div id="pensionFlgCkb" class="ui emp toggle checkbox">
	 					<input type="checkbox" name="pensionFlg" id="pensionFlg" value="false">
					</div>
				</td>
			</tr>
			<tr>	
				<th><label for="departmentCode">雇用保険社納</label></th>
				<td colspan=3>
					<div id="empInsuranceFlgCkb" class="ui emp toggle checkbox">
	 					<input type="checkbox" name="empInsuranceFlg" id="empInsuranceFlg" value="false">
					</div>
				</td>
			</tr>
			<tr>	
				<th><label for="careerFlg">経歴入社区分</label></th>
				<td>
					<div id="careerFlgCkb" class="ui emp toggle checkbox">
	 					<input type="checkbox" name="careerFlg" id="careerFlg" value="">
					</div>
				</td>
				<th><label for="careerPoint">経歴点数</label></th>
				<td><input type="text" class="form-control" id="careerPoint" name="careerPoint" disabled="disabled" readonly="readonly" onchange="careerPointCheck(this)" maxlength="2"/></td>
			</tr>
<!--          <tr>
            <th><label>FILE</label></th>
            <td colspan=3><input type="button" class="btTextW" value="업로드" name="fileName" onclick=document.all.file.click();></td>
            <input type="file" name="file" id="file" style="display: none;"/> 
         </tr> -->

<%-- <c:forEach items="${empManage}" var="empManage" varStatus="status"> --%>
                     <tr>
                     <td>
                     	<label>FILE</label>
                        <div id="btnUp${status.index}" class="tiny ui blue button" name="btnName" onclick="selectFile(${status.index})" title="アップロード">
                           <i class="ui cloud upload icon"></i>
                        </div>
                        </td>
                    	 <td style="width:150px" align="center">
								<div id="btn_dn${status.index}" class="tiny ui green button" name="btnDn" onclick="Download(${status.index})" title="ダウンロード">
									<i class="ui cloud download icon"></i>
									      <input type="file" class="btn btn-primary" id="btn${status.index}" name="btn${status.index}" onchange="getFileName(${status.index})" hidden/>
      <input type="hidden" id="fileName${status.index}" name="fileName" value="${empManage.empFile}" />
      <input type="hidden" id="fileUrl${status.index}" name="fileUrl" value="${empManage.empUrl}" />
      <input type="hidden" id="empIdx" name="empIdx" value="${empManage.empIdx}" />
								</div>
						</td>
                     </tr>


<%--       <input type="file" class="btn btn-primary" id="btn${status.index}" name="btn${status.index}" onchange="getFileName(${status.index})" hidden/>
      <input type="hidden" id="fileName${status.index}" name="fileName" value="${empManage.empFile}" />
      <input type="hidden" id="fileUrl${status.index}" name="fileUrl" value="${empManage.empUrl}" />
      <input type="hidden" id="empIdx" name="empIdx" value="${empManage.empIdx}" /> --%>
<%-- </c:forEach> --%>
      </table>

	<tr>
		<table >
		<!-- button box -->
			<td style="width:640px">
			<div class="ui button left floated"  onclick="backPage()"><i class="left chevron icon"></i>戻る</div>
			</td>
			<td >
			<div class="ui blue button right floated"  onClick="return empRegist()">登録</div>
			</td>
		</div>
		</table>
	</tr>
	</table>
			</form>	
	</div>
</div>
</body>
</html>
