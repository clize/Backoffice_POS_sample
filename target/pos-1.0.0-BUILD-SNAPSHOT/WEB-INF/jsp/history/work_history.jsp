<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<title>pos</title>
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
		/. ROW 
		
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



			Modal Footer
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
				Advanced Tables
				<div class="panel panel-default">
					<div class="panel-heading panel-table-heading-custom">
						<h3 class="panel-title">업무이력</h3>
					</div>
					<div class="panel-body">
						 Table 
						<div class="col-md-4 table-responsive">
							<div id="dtServerList_wrapper"
								class="dataTables_wrapper form-inline content-loader"
								role="grid">
								table view
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
						INESRT UPDATE
						
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
							  </select>
							</div>	

							<div class="col-md-1 content-loader">
							<input type="text" class="form-control"  id="sWork_no" />
 								<input type="text" class="form-control"  id="sWork_no" style="visibility:hidden;" />
							  </select>
							</div>	
									
								</div>
								
							<div class="col-md-12">
							<label class="col-md-1 control-label" for="textinput" >Title</label>
									<div class="col-md-6 content-loader">
											<input type="text" class="form-control"  id="sWork_title" placeholder="제목을 입력하세요"/>
									</div>	

							</div>			
															
							<div class="col-md-12">
								<textarea class="form-control" rows="30" id="sWork_memo" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="col-md-12">
									<input type="text" class="form-control"  id="sWork_keyword" />
							</div>
						</div>
						
						
					<div class="form-group">
						<label class="col-sm-1 control-label" for="textinput">테스트</label>
						<div class="col-sm-1">
								<input type="text" class="form-control"  id="test_date" />
						</div>
						
						<label class="col-sm-1 control-label" for="textinput">Title</label>
						<div class="col-sm-6 content-loader">
							<div id="from-date-container" style="width: 60%;">
								<input type="text" class="form-control"  id="text_no" placeholder="검색어를 입력하세요"/>
							</div>
						</div>						
					</div>	
					
						
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="onClickInit()" id="btn_new" name="btn_new">
                 신규
              </button>
		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="onClickRegister()" id="btn_save" name="btn_save">
                 저장
              </button>
		<button type="button" class="btn btn-primary" onclick="getWorkHistoryDetail()" id="btn_del" name="btn_del">
                 삭제
              </button>
		<button type="button" class="btn btn-primary" id="btn_test" name="btn_test">
                 test
              </button>
	</div>

	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.WORK_NO }</td>
			</tr>

			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.WORK_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.WORK_MEMO }</td>
			</tr>
		</tbody>
	</table>
	
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">NO</th>
					<td><input type="text" id="IDX" name="IDX" class="wdp_50">1</input></td>
				</tr>
				<tr>
					<th scope="row">DATE</th>
					<td><input type="text" id="WORK_DATE" name="WORK_DATE" class="wdp_50">20181207</input></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
		
		<%-- 제목 : <input type="text" size=50 value=${map. } name=title placeholder="제목을 입력해주세요" /> --%>
		 <%-- <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map.WORK_TITLE }</textarea> --%>
		
	</form>

</div>

<script>


$(document).ready(function(){

	var formObj = $("form[name='readForm']");
	
	$("#btn_test").on("click", function(e){ //글쓰기 버튼
		getWorkHistoryDetail($(this));
		//formObj.attr("action", "/history/getWorkHistoryListSub.do");
		//formObj.attr("method", "get");
		//formObj.submit();	
		
	});	
	
	$("a[name='title']").on("click", function(e){ //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});


function fn_openBoardWrite(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
	comSubmit.submit();
}

/* function fn_openBoardDetail(obj){

	var idx = "${map.IDX}";
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/history/getWorkHistoryListSub.do' />");
	comSubmit.addParam("IDX", $("#IDX").val());
	comSubmit.submit();
	
} */

function getWorkHistoryDetail() {
	
	/* requestURL = baseURL + "/api/history_detail"; */
	showAlert("test");
//	 $("#btn_save").click(function(){
	
	ressult = "";
		 
		 $.ajax({
                url: "<c:url value='/history/getWorkHistoryListSub.do' />",
                type: "POST", // To protect sensitive data
                data: {
                    ajax: true,
                    IDX:$('#IDX').val(),
                    WORK_DATE:$('#WORK_DATE').val()
                },

                success: function(data){

                   	 showAlert("ressult, ", data.result);
                       // alert('worktitle ' + item.work_title);

                },
                error: function (jqXHR, msg, erro) {
                	showAlert("getWorkHistoryDetail Error");
                	$('#dtServerList').DataTable().ajax.reload();
                }
            });
//	 }); 

}	


</script>
	
</body>
</html>