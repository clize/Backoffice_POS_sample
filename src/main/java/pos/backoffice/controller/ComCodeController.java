package pos.backoffice.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pos.backoffice.service.ComCodeService;
import pos.common.common.CommandMap;
import pos.common.logger.LoggerInterceptor;

@Controller
public class ComCodeController {
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Autowired
	private ComCodeService comcodeService;
	
	@RequestMapping(value="/comcode/comcode_manager.do")
    public ModelAndView getComCode(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/comcode/comcode_manager");

    	return mv;
    }
	
	@RequestMapping(value="/comcode/getComCodeList.do")
    public ModelAndView getComCodeList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
    	
    	List<Map<String,Object>> list = comcodeService.getComCodeList(commandMap.getMap());
    	
    	
    	mv.addObject("data", list);
    	
    	mv.setViewName("jsonView");
    	log.debug(mv);
    	log.debug("controller getComCodeList : "+commandMap);
    	
    	return mv;
    }
	
	@RequestMapping(value="/comcode/getComCodeListSub.do")
    public ModelAndView getComCodeListSub(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
    	
    	List<Map<String,Object>> list = comcodeService.getComCodeListSub(commandMap.getMap());
    	
    	
    	mv.addObject("data", list);
    	
    	mv.setViewName("jsonView");
    	log.debug(mv);
    	log.debug("controller getComCodeListSub : "+commandMap);
    	
    	return mv;
    }
	

}
