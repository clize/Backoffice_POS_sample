/*!
 * Datepicker for Bootstrap v1.5.0-dev (https://github.com/eternicode/bootstrap-datepicker)
 *
 * Copyright 2012 Stefan Petre
 * Improvements by Andrew Rowls
 * Licensed under the Apache License v2.0 (http://www.apache.org/licenses/LICENSE-2.0)
 */
(function($, undefined){
		
	var DPGlobal = {
		
	};
	
	DPGlobal.template = "<div class='input-group'>" + 
						 "<span class='input-group-btn'>" + 
						 "<span	class='btn btn-primary btn-file'>" +  
						  "</span>"+
						  "</span>" +
						  "<input type='text' class='form-control' readonly id='input_file_text'/>"+
						  "</div>";
	
	
	var importfile = function(option){
		
		this.importfile = $(DPGlobal.template);
		
		this.importfile.contaier = this.get(0);
		$(this.importfile.contaier).html(DPGlobal.template);
		
		var button = this.importfile.contaier.getElementsByClassName("btn btn-primary btn-file");
		$(button).html( option.btn_title + "&hellip;<input  id='upload_file' name = 'upload_file' type='file'/>" );
		
		defaults.import_url = option.import_url;
		defaults.msg_fail = option.msg_fail;
		defaults.msg_success = option.msg_success;
		defaults.reload_function = option.reload_function;
		
		$(this.importfile.contaier).on('change', '.btn-file :file', onChangeFile);
		
		return this;
	};
	
	var onChangeFile = function() {
		       var input = $(this),
		       numFiles = input.get(0).files ? input.get(0).files.length : 1,
		       label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		      
		        input = $(this).parents('.input-group').find(':text'),
	            log = numFiles > 1 ? numFiles + ' files selected' : label;
	        
		        /*if( input.length ) {
		            input.val(log);
		        } else {
		            if( log ) alert(log);
		        }*/
		        
		        onClickImport(log);
		 };
		 		
  
   function onClickImport() {
		waitingDialog.show();

		var requestURL = getBaseURL();
		requestURL = requestURL + '/configuration/upload_data_file'; 
		var fd = new FormData();    
		jQuery.each($('#upload_file')[0].files, function(i, file) {
			fd.append('upload_file', file);
		});
					 
		$.ajax({
           	url: requestURL,
		        data:fd,
		        type: 'POST',
		        processData:false,
		        contentType:false,
		        success : function (response) {
		            var code = response['result_code'];
		            if(code ==  -100) {
		                $('#input_file_text').val(response['result_data']['uploaded_url']);
		                var baseURL = getBaseURL()+"/";
		                var file_name = response['result_data']['uploaded_url'];
		                file_name = file_name.substring(baseURL.length);
						import_file(file_name);			                
		            }
		            else {
		            	waitingDialog.hide();
		            	showAlert(defaults.msg_fail);
		            }
		        },
			   error: function (jqXHR, msg, erro) {
				    waitingDialog.hide();
              		showAlert(defaults.msg_fail);
              }
		    })
		    ;	
	}

	function import_file(file_name) {
		var baseURL =  getBaseURL();
		requestURL = baseURL + '/configuration/'+defaults.import_url;
	
	   $.ajax({
           url: requestURL,
           type: "POST", // To protect sensitive data
           data: {
               ajax: true,
               file_path:file_name,
               import_date:$('#fromDate').val()
           },
           success: function (response) {
            	waitingDialog.hide();
           	if(response.result_code == -100) {
           		showAlert(defaults.msg_success);
           		defaults.reload_function();
           	}
           	else {
           		showAlert(msgErrArray[response.result_code]);
           	}	
           	
           },
           error: function (jqXHR, msg, erro) {
           	waitingDialog.hide();
           	showAlert(defaults.msg_fail);
           }
       }); 
	}
	
	$.fn.importfile = importfile;
	
	var defaults = $.fn.importfile.defaults = {
			btn_title: 'Import...',
			import_url: '',
			msg_fail:'Fail',
			msg_sucess:'Success',
			reload_function:function () {}
		};
}(window.jQuery));