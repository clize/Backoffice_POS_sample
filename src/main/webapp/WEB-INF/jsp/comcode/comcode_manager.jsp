<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<title>공통코드 관리</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../include/header.jsp"%>
<%@include file="../include/menu.jsp"%>

<%@include file="comcode_mgr_sub.jsp"%>

</head>
<body>

<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>공통코드 관리</h2>
				<h5>공통코드 관리.....</h5>
			</div>
		</div>
		<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-heading panel-table-heading-custom">
						<h3 class="panel-title">그룹코드 조회</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-12 table-responsive">
							<div id="dtServerList_wrapper"
								class="dataTables_wrapper form-inline content-loader"
								role="grid">
								<form class="form-horizontal" role="form">
								<div class="col-md-9 form-group">
									<div id="from-date-container">
						                <table>
						                    <tbody>
						                    <tr>
												<td><label> 그룹코드 </label></td>
												<td><input type="text" class="form-control"  value="" id="medcode"  /></td>
						                        <td><button type="button" class="btn btn-default  btn-sm" onclick="onClickSearch()" style="margin-left: 5px;"> Search </button></td>
						                    </tr>
						                    </tbody>
						                </table>
						            </div>
								</div>
								</form>
								<div class="col-md-3">
								<button class="btn btn-primary" onclick="onClickRegister()">등록</button>
								</div>
								<!-- table view -->
								<table
									class="table table-striped table-bordered table-hover dataTable no-footer"
									id="dtComCodeList"
									aria-describedby="dtComCodeList_info">
									<thead>
										<tr>
											<th>그룹코드</th>
											<th>그룹명</th>
											<th>사용유무</th>
											<th>등록자</th>
											<th>등록일자</th>
											<th>수정자</th>
											<th>수정일자</th>										
									    </tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- </div>

</div> -->
<!-- /. PAGE INNER  -->


<script>
		var selectedBasketCode = "";
		var baseURL = "${baseURL}";

		/*  검색 시 Enter Key 처리 */
		$("#medcode").keyup(function(e){if(e.keyCode == 13) onClickSearch(); });
		
		
		function getList() {

			
			var urlData = baseURL+"/comcode/getComCodeList.do";
			
			dataTable = $('#dtComCodeList').dataTable({
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

			            	 d.mMedcd = $("#medcode").val();
				            
				            },
			     //   "success" : function() {  },  
					"error" :  function() {  alert('Data Loading Error'); }
			     },
			     
			     "autoWidth": false,
				 "columns": [				
					 
					 { "data": "MEDCD" , "class": "alignCenter"},
					 { "data": "MEDCD_NM" , "class": "alignCenter"}, 
					 { "data": "USE_YN" , "class": "alignCenter"},
					 { "data": "CHG_ID" , "class": "alignCenter"},
					 { "data": "CHG_DT" , "class": "alignCenter"},
					 { "data": "REG_ID" , "class": "alignCenter"},
					 { "data": "REG_DT" , "class": "alignCenter"},
				         ],
			     "order": [[ 1,2, "desc" ]],
		         "columnDefs": [
		            {
		                /* "targets": [ 0 ], */
		                "visible": false,
		            }]
			});
			
		}

		function getSubList(medcd_data) {

			
			var urlData = baseURL+"/comcode/getComCodeListSub.do";

			dataTable = $('#dtComCodeListSub').dataTable({
				"processing": true,
				"lengthChange": true,
				"searching": true,
				"paging": true,
				"scrollY":  400,
		        "scrollX": 400,
				"pageLength":50,
				"destroy": true,
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
			            "data": {
			            	ajax: true,
			            	mMedcd:medcd_data

			            	/*  d.mMedcd = $("#medcode").val(); */
				            
				            },
			     //   "success" : function() {  },  
					"error" :  function() {  alert('Data Loading Error'); }
			     },
			     
			     "autoWidth": true,
				 "columns": [				
					 
					 { "data": "MEDCD" , "class": "alignCenter"},
					 { "data": "MEDCD_NM" , "class": "alignCenter"}, 
					 { "data": "USE_YN" , "class": "alignCenter"},
					 { "data": "CHG_ID" , "class": "alignCenter"},
					 { "data": "CHG_DT" , "class": "alignCenter"},
					 { "data": "REG_ID" , "class": "alignCenter"},
					 { "data": "REG_DT" , "class": "alignCenter"}
				 /*     { data: 'vendor_name', name: 'vendors.vendor_name', mRender: function (data, type, row) {     
				         return '<label hidden>'+data+'</label> <input type="text" id="vendor_name" class="vendor_name" data-id="'+row.id+'" onClick="this.select();" value="'+data+'">'; 
				         }, */
					 
					/*  {"data": function(data, type, full) {
				    	    return '<a class="btn btn-info btn-sm" href=#/' + full[0] + '>' + 'Edit' + '</a>';
			    	  }
			    	  } */
				         ],
			     "order": [[ 1,2, "desc" ]],
		         "columnDefs": [
		            {
		                /* "targets": [ 0 ], */
		                "visible": false,
		            }]
			     
			});
			
		}



		
		function onLoad() {
			getList();
			var table = $('#dtComCodeList').DataTable();
			$('#dtComCodeList tbody').on('click', 'tr', function () {
		        var data = table.row( this ).data();
		        window.showUpdateDialog(data);
		       
		    } );
		}

		function onClickSearch() {
			 $('#dtComCodeList').DataTable().ajax.reload();
			 
		}
		

		function replaceAll(str, searchStr, replaceStr) {

			return str.split(searchStr).join(replaceStr);
		}

				
		function showUpdateDialog(data) {

			var medcd_data = data['MEDCD'];
			/* $('#dtServerListSub').DataTable().state.clear(); */
			$('#myCreateModalHorizontal').modal('show');
			getSubList(medcd_data);
			$('#window').trigger('resize');
			
			
			 
		}

		/* $('#dtComCodeList tbody').on('click', 'tr', function () {
			$('#myCreateModalHorizontal').modal('show');
	        $('#dtServerListSub').DataTable().ajax.reload();
	        
	       
	    } ); */

</script>


<%@include file="../include/footer.jsp"%>

</body>
</html>