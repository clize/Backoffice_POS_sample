<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="modal fade" id="myCreateModalHorizontal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">	
	<div class="modal-dialog" style="width: 100%; height: 100%; ">
		<div class="modal-content" style="min-height: 100%; height: auto;">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span> <span class="sr-only">과리 서버 및 사용자  추가</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
                    	관리 서버 추가 또는 사용자를 추가 합니다.
                </h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">

				<!-- <form class="form-horizontal" role="form" name="create_schedule"> -->
				
			<table class="table table-striped table-bordered table-hover dataTable no-footer"
				id="dtComCodeListSub" aria-describedby="dtComCodeListSub_info">
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

					
				<!-- </form> -->
			</div>

			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
                   Cancel
                </button>
				<button type="button" class="btn btn-primary" id="btn_add" name="btn_add">
                    Add
                </button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	    $('#svr_target_date').datepicker({
	        format: 'yyyymmdd'
	    });
</script>
    