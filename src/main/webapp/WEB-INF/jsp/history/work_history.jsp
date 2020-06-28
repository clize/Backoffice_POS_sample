<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<title>이력 관리</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../include/header.jsp"%>
<%@include file="../include/menu.jsp"%>

</head>
<body>
	
 <!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>업무이력</h2>
			</div>
		</div>
		<!-- /. ROW  -->
		
			<div class="modal-body">

				<form class="form-horizontal" role="form" name="create_schedule">

					<div class="form-group">
						<div class="row">
							<label class="col-sm-1 control-label" for="textinput">담당자</label>
							<div class="col-md-2">
								<div id="from-date-container">
									<input type="text" class="form-control"  id="worker_nm"/>
								</div>
							</div>	
							
							<label class="col-md-1 control-label" for="textinput">업무구분</label>

							  <select  id='work_gcode' class="col-md-1">
							    <option value="">- 대분류 -</option>
							  </select>							  

							  <select  id='work_mcode' class="col-md-1">
							    <option value="">- 중분류 -</option>
							  </select>	

							  <select  id='work_dcode' class="col-md-1">
							    <option value="">- 소분류 -</option>
							  </select>	

							<label class="col-md-1 control-label" for="textinput" style="visibility:hidden;">처리상태 </label>

							  <select  id='work_status' class="col-md-1" style="visibility:hidden;">
							    <option value="">- Nothing Selected -</option>
								<option value="00" >처리중</option>
								<option value="01" >처리완료</option>
							  </select>
							
						</div>
					</div>
					

					<div class="form-group">
						<label class="col-sm-1 control-label" for="textinput">조회기간</label>
						<div class="col-sm-1">
								<input type="text" class="form-control"  id="start_date" />
						</div>
						<div class="col-sm-1">
								<input type="text" class="form-control"  id="end_date" />
						</div>

						<label class="col-sm-1 control-label" for="textinput">Title</label>
						<div class="col-sm-6 content-loader">
							<div id="from-date-container" style="width: 60%;">
								<input type="text" class="form-control"  id="title" placeholder="검색어를 입력하세요"/>
							</div>
						</div>						
					</div>			
				</form>
			</div>		



			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="onClickClear()" data-dismiss="modal" id="btn_clear" name="btn_clear">
                   Clear
                </button>
				<button type="button" class="btn btn-primary" onclick="onClickSearch()" id="btn_select" name="btn_select">
                    조회
                </button>
			</div>
		<hr />
		
		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-heading panel-table-heading-custom">
						<h3 class="panel-title">업무이력</h3>
					</div>
					<div class="panel-body">
						<!--  Table  -->
						<div class="col-md-4 table-responsive">
							<div id="dtServerList_wrapper"
								class="dataTables_wrapper form-inline content-loader"
								role="grid">
								<!-- table view -->
								<table
									class="table table-striped table-bordered table-hover dataTable no-footer"
									id="dtServerList"
									aria-describedby="dtServerList_info">
									<thead>
										<tr>
										    <th>번호 </th>
                                            <th>등록일자   </th>
                                            <th>제목   </th>

        								</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
						<!-- INESRT UPDATE -->
						
						<form class="form-horizontal" role="form" action="./history_insert" method="post" enctype="multipart/form-data" name=insert_history_form">
						<div class="col-md-8">
							<div class="col-md-12">
								<label class="col-sm-1 control-label" for="textinput">담당자</label>
								<div class="col-sm-2">
									<div id="from-date-container" style="width: 100%;">
										<input type="text" class="form-control"  id="sWorker_nm" disabled />
									</div>
								</div>
								
								<label class="col-md-2 control-label" for="textinput">업무구분</label>
	
								  <select  id='sWork_gcode' class="col-md-2" >
									<option value="">- 대분류 -</option>
								  </select>	
	
								  <select  id='sWork_mcode' class="col-md-2">
								    <option value="">- 중분류 -</option>
								  </select>	
	
								  <select  id='sWork_dcode' class="col-md-2">
								    <option value="">- 소분류 -</option>
								  </select>	
								
							</div>
							
								<div class="col-md-12">
									<label class="col-sm-1 control-label" for="textinput">등록일자</label>
									<div class="col-sm-2">
											<input type="text" class="form-control"  id="sWork_date" disabled />
									</div>
									
							<label class="col-md-1 control-label" for="textinput" style="visibility:hidden;">처리상태</label>
							  <select  id='sWork_status' class="col-md-1" style="visibility:hidden;">
							    <option value="">- Nothing Selected -</option>
								<option value="00" >처리중</option>
								<option value="01" >처리완료</option>
							  </select>
							
							<label class="col-md-2 control-label" for="textinput" style="visibility:hidden;">중요도</label>
							<div class="col-md-2 content-loader">
								<input type="text" class="form-control"  id="sWork_level"  value= "1" style="visibility:hidden;" />
							  <!-- </select> -->
							</div>	

							<div class="col-md-1 content-loader">
							    <input type="text" class="form-control"  id="sWork_no" disabled/> 
 								<!-- <input type="text" class="form-control"  id="sWork_no" style="visibility:hidden;" /> -->
							  <!-- </select> -->
							</div>	
									
								</div>
								
							<div class="col-md-12">
							<label class="col-md-1 control-label" for="textinput" >Title</label>
									<div class="col-md-6 content-loader">
											<input type="text" class="form-control"  id="sWork_title" placeholder="제목을 입력하세요"/>
									</div>	
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="onClickInit()" id="btn_new" name="btn_new">
					                   신규
					                </button>
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="onClickRegister()" id="btn_save" name="btn_save">
					                   저장
					                </button>
									<button type="button" class="btn btn-primary" onclick="onClickDelete()" id="btn_del" name="btn_del">
					                   삭제
					                </button>
								</div>
							</div>			
															
							<div class="col-md-12">
								<textarea class="form-control" rows="30" id="sWork_memo" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="col-md-12">
									<input type="text" class="form-control"  id="sWork_keyword" />
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>


<script>


var selectedBasketCode = "";
var baseURL = "${baseURL}";	    
var now = new Date();

var year= now.getFullYear();
var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();	              
var chan_val = year + mon + day;

var gcodeVal = "";
var mcodeVal = "";
var dcodeVal = "";
var user_nm = "";
var user_no = '${user}';

/* 사용자 이름 호출 */
getWorkerNm();

$('#start_date').datepicker({
    format: 'yyyymmdd'
});

$('#end_date').datepicker({
    format: 'yyyymmdd'
});
  	$('#end_date').val(chan_val);

$('#sWork_date').datepicker({
    format: 'yyyymmdd'
}); 


$('#end_date').val(chan_val);
$('#sWork_date').val(chan_val);
$('#worker_nm').val('');


/*  검색 시 Enter Key 처리 */
$("#worker_nm").keyup(function(e){if(e.keyCode == 13) onClickSearch(); });
$("#title").keyup(function(e){if(e.keyCode == 13) onClickSearch(); });



function onLoad() {
	getList();
	
	loadCodeCombo('#sWork_gcode');
	loadCodeCombo('#sWork_mcode');
	loadCodeCombo('#sWork_dcode');
	
	loadCodeCombo('#work_gcode');
/* 			loadCodeCombo('#work_mcode');
	loadCodeCombo('#work_dcode'); 
*/			

	var table = $('#dtServerList').DataTable();

	$('#dtServerList tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        window.showUpdateDialog(data);
        
    } );
				
}

function onClickSearch() {
	$('#dtServerList').DataTable().ajax.reload();
	onClickInit();
}

function replaceAll(str, searchStr, replaceStr) {

	return str.split(searchStr).join(replaceStr);
}


function onClickClear() {
	
	$('#start_date').val('');
	$('#end_date').val(chan_val);
    $('#worker_nm').val('');
    $('#work_status').val('');
    $('#title').val(''); 
    
	loadCodeCombo('#work_gcode');
	loadCodeCombo('#work_mcode');
	loadCodeCombo('#work_dcode');

}

function onClickInit() {
				
	$('#sWorker_nm').val(user_nm);
	
	$('#sWork_date').val(chan_val);
    $('#sWork_no').val('');

    $('#sWork_status').val('');
    $('#sWork_level').val(''); 
	$('#sWork_title').val('');
    $('#sWork_memo').val('');
    $('#sWork_keyword').val('');
    
	gcodeVal = "";
	mcodeVal = "";
    dcodeVal = "";
    
	loadCodeCombo('#sWork_gcode');
		loadCodeCombo('#sWork_mcode');
	loadCodeCombo('#sWork_dcode');
    
    
}



function sel_g_item(vals) 
{ 
	var i = sWork_gcode.length; 
	
	for(var j=0; j < i; j++) { 
		
		if (sWork_gcode.options[j].value == vals) 
		{ 
		/* 	alert("sWork_gcode.options[j].value, "+sWork_gcode.options[j].value); */
			sWork_gcode.options[j].selected = true;
		} 
	}
	
	loadCodeCombo('#sWork_mcode');

}

function sel_m_item(vals) 
{ 
	var i = sWork_mcode.length; 

	for(var j=0; j < i; j++) { 
		
		if (sWork_mcode.options[j].value == vals) 
		{ 
//			alert("sWork_mcode.options[j].value, "+sWork_mcode.options[j].value);
			sWork_mcode.options[j].selected = true;
		} 
	}
	
	loadCodeCombo('#sWork_dcode');

}

function sel_d_item(vals) 
{ 
	var i = sWork_dcode.length; 

	for(var j=0; j < i; j++) { 
		
		if (sWork_dcode.options[j].value == vals) 
		{ 
//			alert("sWork_dcode.options[j].value, "+sWork_dcode.options[j].value);
			sWork_dcode.options[j].selected = true;
		} 
	}
	
	//loadCodeCombo('#sWork_mcode');

}

	
function getList() {

	
	var urlData = baseURL+"/history/getWorkHistoryList.do";
	
	dataTable = $('#dtServerList').dataTable({
		"processing": true,
		"lengthChange": false,
		"searching": false,
		"paging": true,
		"scrollY":  600,
        "scrollX": true,
		"pageLength":50,
		"info": true,
		"language": {
			  "info": "_START_- _END_(_TOTAL_)",
			  "paginate": {
				  "previous": "이전",
				  "next": "이후"
		      }
		 },
		"serverSide":false,
		  "ajax": {
	        "url": urlData,
	        "type":"POST",
	        "dataType": "JSON",
	            "data": function(d) {

	            	 d.mStartDate = $("#start_date").val();
	            	 d.mEndDate = $("#end_date").val();
	            	 d.mWorkTitle = $("#title").val();
	            	 d.mWorkerNm = $("#worker_nm").val();
	            	 d.mWorkStatus = $("#work_status").val();
	            	 d.mWorkGcode = $("#work_gcode option:selected").val();
	            	 d.mWorkMcode = $("#work_mcode option:selected").val();
	            	 d.mWorkDcode = $("#work_dcode option:selected").val();
		            
		            },
	     //   "success" : function() {  },  
			"error" :  function() {  alert('Data Loading Error'); }
	     },
	     
	     "autoWidth": false,
		 "columns": [				
			 
			 { "data": "WORK_NO" , "class": "alignCenter"},
			 { "data": "WORK_DATE" , "class": "alignCenter"}, 
			 { "data": "WORK_TITLE" , "class": "alignCenter"}
	
		         ],
	     "order": [[ 1,2, "desc" ]],
         "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
            }]
	});
	
}


function showUpdateDialog(data) {

	requestURL = baseURL + "/history/getWorkHistoryListSub.do";
    
	gcodeVal = "";
	mcodeVal = "";
    dcodeVal = "";

	//onClickInit();
//	 $("#btn_save").click(function(){
		 
		 $.ajax({
                url: requestURL,
                datatype : 'JSON',
                type: "POST", // To protect sensitive data
                data: {
                    ajax: true,
                    /* IDX:$('#IDX').val(), */
                    IDX:data['WORK_NO'],
                    WORK_DATE:data['WORK_DATE']
                },

                success: function(data){
                    $.each(data, function (i, item) {

                        $('#sWork_date').val(item.WORK_DATE);
                        $('#sWork_no').val(item.WORK_NO);
                        $('#sWorker_nm').val(item.WORKER_NO);
                        $('#sWork_gcode').val(item.G_CODE);
                        $('#sWork_mcode').val(item.M_CODE);
                        $('#sWork_dcode').val(item.D_CODE);
                        $('#sWork_status').val(item.WORK_STATUS);
                        $('#sWork_level').val(item.WORK_LEVEL); 
                        $('#sWork_title').val(item.WORK_TITLE);
                        $('#sWork_memo').val(item.WORK_MEMO);
                        $('#sWork_keyword').val(item.WORK_KEYWORD);
                        
                        gcodeVal = item.G_CODE;
                        mcodeVal = item.M_CODE;
    				 	dcodeVal = item.D_CODE;
    				 	
    				 	loadCodeCombo('#sWork_gcode');
                        
    				 	
                    })
                },
                error: function (jqXHR, msg, erro) {
                	showAlert("showUpdateDialog Error");
                //	$('#dtServerList').DataTable().ajax.reload();
                }
            });
}

function onClickRegister() {

	if ( null  == $('#sWork_no').val()  || $('#sWork_no').val() == "") {
		requestURL = baseURL + "/history/insertWorkHistory.do";
	 }
	else {
		/* alert(requestURL); */
		requestURL = baseURL + "/history/updateWorkHistory.do";
	}
	
	//alert(requestURL);
	
// $("#btn_save").click(function(){

	 if ( null  == $('#sWork_title').val()  || $('#sWork_title').val() == "")
	 {
	 	alert("TITLE을 입력하세요..");
	 	return ;
	 }
	 
	 if ( null  == $('#sWork_memo').val()  || $('#sWork_memo').val() == "")
	 {
	 	alert("MEMO를 입력하세요.");
	 	return ;
	 }
	 
	 if ( null  == $('#sWork_date').val()  || $('#sWork_date').val() == "")
	 {
	 	alert("작업일자를 입력하세요..");
	 	return ;
	 }
	 
	 $.ajax({
            url: requestURL,
            type: "POST", // To protect sensitive data
            datatype : "JSON",
            data: {
                ajax: true,
                mWorkDate:escape($('#sWork_date').val()),
                mWorkNo:$('#sWork_no').val(),
                mWorkerNo:"김성우",//$('#sWorker_nm').val(),
                mGcode:$('#sWork_gcode').val(),
                mMcode:$('#sWork_mcode').val(),
                mDcode:$('#sWork_dcode').val(),
                mWorkStatus:$('#sWork_status').val(),  
                mWorkLevel:$('#sWork_level').val(),
                mWorkTitle:$('#sWork_title').val(),
                mWorkMemo:$('#sWork_memo').val(),
                mWorkKeyword:$('#sWork_keyword').val()
            },
            
            success: function (response) {
            	if(response.result_code == "00") {
            		alert("입력 완료");
            		onClickInit();
            		onClickClear();
            		$('#dtServerList').DataTable().ajax.reload();
            	}
            	else if(response.result_code == "10") {
            		alert("수정 완료");
            		onClickInit();
            		onClickClear();
            		$('#dtServerList').DataTable().ajax.reload();
            	}
            	else {
            		showAlert(response.result_code);
            	}
            },
            error: function (jqXHR, msg, erro) {
            	showAlert("onClickRegister Error");
            	showAlert(jqXHR+"msg:"+msg+", erro:"+erro);
            	$('#dtServerList').DataTable().ajax.reload();
            }
        });
// }); 

}		


function onClickDelete() {
	

	if ( null  == $('#sWork_no').val()  || $('#sWork_no').val() == "") {
	 	alert("삭제 대상이 없습니다.");
	 	return ;
	 }
	
	if ( null  == $('#sWork_date').val()  || $('#sWork_date').val() == "") {
	 	alert("삭제 대상이 없습니다.");
	 	return ;
	 }
	
	requestURL = baseURL + "/history/deleteWorkHistory.do";
//	 $("#btn_save").click(function(){
		 
	 $.ajax({
            url: requestURL,
            type: "POST", // To protect sensitive data
            datatype : "JSON",
            data: {
                ajax: true,
                mWorkDate:escape($('#sWork_date').val()),
                mWorkNo:$('#sWork_no').val()
            },

                success: function (response) {
                	if(response.result_code == "00") {
                		showAlert("삭제 되었습니다.");
                		$('#dtServerList').DataTable().ajax.reload();
                		onClickInit();
                	}
                	else {
                		showAlert(response.msg);
                	}
                	 //$('#myUpdateModalHorizontal').modal('toggle');
                },
                error: function (jqXHR, msg, erro) {
                	showAlert("deleteWorkHistory Error");
                	$('#dtServerList').DataTable().ajax.reload();
                }
            });
//	 }); 

}	

function getWorkerNm() {

	requestURL = baseURL + "/history/getWorkerNm.do";

	 $.ajax({
         url: requestURL,
         datatype : 'JSON',
         type: "POST", // To protect sensitive data
         data: {
             ajax: true,
             mWorkerNo:"170005"//'${user}'
         },
 
                success: function(data){
                    $.each(data, function (i, item) {
                        $('#sWorker_nm').val(item.USER_NM);
                        user_nm = item.worker_nm;
    				 	
                    })
                },
                error: function (jqXHR, msg, erro) {
                	showAlert("get_worker_nm Error");
                }
            });
}



function loadCodeCombo(value)
{
	var urlData = baseURL+"/history/getHistoryComCode.do";
	var deVal  = '';
	var deText = '- Select -';
	var deCode = 'C0010';
	
	if ( value  == '#sWork_gcode' || value  == '#work_gcode')
	 {
		deText = '- 대분류 -';
		deCode = 'C0010';
		
		if (value  == '#sWork_gcode') deVal  = '#sWork_gcode';
		else deVal  = '#work_gcode';
	 	
	 }
	else if ( value  == '#sWork_mcode' || value  == '#work_mcode')
	 {
		deText = '- 중분류 -';
		deCode = 'C0011';
		
		if (value  == '#sWork_mcode') deVal  = '#sWork_gcode';
		else deVal  = '#work_gcode';
	 	
	 }
	else if ( value  == '#sWork_dcode' || value  == '#work_dcode')
	 {
		deText = '- 소분류 -';
		deCode = 'C0012';
		
		if (value  == '#sWork_dcode') deVal  = '#sWork_mcode';
		else deVal  = '#work_mcode';
	 	
	 }
	
    $.ajax({
        url: urlData,
        type: 'POST',
        dataType: 'json',
        data: {
            ajax: true,
            mWorkCode:deCode,
            mWorkValue:$(deVal).val()
        },
        success:function(response){

            var len = response.data.length;

            $(value).empty();
            $(value).append("<option value=''>"+deText+"</option>");
            
            for( var i = 0; i<len; i++){
                var id = response.data[i]['MEDCD'];
                var name = response.data[i]['MEDCD_NM'];
                
                $(value).append("<option value='"+id+"'>"+name+"</option>");

            }
            
            if ( value  == '#sWork_gcode' ) 
            {
            	sel_g_item(gcodeVal);
            } else if ( value  == '#sWork_mcode' ) 
            {
            	sel_m_item(mcodeVal);
            } else if ( value  == '#sWork_dcode' ) 
            {
            	sel_d_item(dcodeVal);
            } 
            
        },
        error: function (jqXHR, msg, erro) {
        	showAlert("loadCodeCombo Error");
        }
    });
}










function getWorkHistoryDetail() {
	
	/* requestURL = baseURL + "/api/history_detail"; */
	showAlert("test");
//	 $("#btn_save").click(function(){
	
	ressult = "";
		 
		 $.ajax({
                url: "<c:url value='/history/getWorkHistoryListSub.do' />",
                datatype : 'JSON',
                type: "POST", // To protect sensitive data
                data: {
                    ajax: true,
                    IDX:$('#IDX').val(),
                    WORK_DATE:$('#WORK_DATE').val()
                },

                success: function(data){
                    $.each(data, function (i, item) {

                    	
                    		$('#TITLE').append(item.WORK_TITLE);
                    		$('#CONTENTS').append(item.WORK_MEMO);

	                        $('#sWork_date').val(item.WORK_DATE);
	                        $('#sWorker_nm').val(item.WORKER_NO);
	                        $('#sWork_gcode').val(item.G_CODE);
	                        $('#sWork_mcode').val(item.M_CODE);
	                        $('#sWork_dcode').val(item.D_CODE);
	                        $('#sWork_status').val(item.WORK_STATUS);
	                        $('#sWork_level').val(item.WORK_LEVEL); 
	                        $('#sWork_title').val(item.WORK_TITLE);
	                        $('#sWork_memo').val(item.WORK_MEMO);
	                        $('#sWork_keyword').val(item.WORK_KEYWORD);
                    	 
		                    })

                },
                error: function (jqXHR, msg, erro) {
                	showAlert("getWorkHistoryDetail Error");
                	/* $('#dtServerList').DataTable().ajax.reload(); */
                }
            });
//	 }); 

}	

$("#sWork_gcode").change(function(){
		loadCodeCombo('#sWork_mcode');
		loadCodeCombo('#sWork_dcode');
});

$("#sWork_mcode").change(function(){
		loadCodeCombo('#sWork_dcode');
});

	$("#work_gcode").change(function(){
		loadCodeCombo('#work_mcode');
		loadCodeCombo('#work_dcode');
});

$("#work_mcode").change(function(){
		loadCodeCombo('#work_dcode');
});


</script>
	
</body>
</html>