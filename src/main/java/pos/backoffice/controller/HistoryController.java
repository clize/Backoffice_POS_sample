package pos.backoffice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pos.backoffice.service.HistoryService;
import pos.common.common.CommandMap;
import pos.common.logger.LoggerInterceptor;

@Controller
public class HistoryController {
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping(value="/history/work_history.do")
    public ModelAndView getWorkHistory(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/history/work_history");
    	
//    	List<Map<String,Object>> list = historyService.getWorkHistoryList(commandMap);
//    	mv.addObject("data", list);
    	
//    	mv.setViewName("jsonView");
    	
    	return mv;
    }
	
	@RequestMapping(value="/history/getWorkHistoryList.do")
    public ModelAndView getHistoryList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
    	
    	List<Map<String,Object>> list = historyService.getWorkHistoryList(commandMap.getMap());
    	
    	
    	mv.addObject("data", list);
    	
    	mv.setViewName("jsonView");
    	log.debug(mv);
    	log.debug("controller getHistoryList : "+commandMap);
    	
    	return mv;
    }
	
	@RequestMapping(value="/history/getWorkHistoryListSub.do")
    public ModelAndView getWorkHistoryListSub(CommandMap commandMap) throws Exception{ 
    	
		ModelAndView mv = new ModelAndView();
    	
    	Map<String,Object> map = historyService.getWorkHistoryListSub(commandMap.getMap());
    	mv.addObject("map", map);
    	 
    	 mv.setViewName("jsonView");

    	log.debug(mv);
    	log.debug("controller getWorkHistoryListSub : "+commandMap);
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/history/insertWorkHistory.do")
	public ModelAndView insertWorkHistory(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int i = historyService.insertWorkHistory(commandMap.getMap(), request);
		log.debug("controller insertWorkHistory : "+commandMap.getMap()+"request :"+request);
	
		
		mv.addObject("result_code", "00");
		mv.setViewName("jsonView");
	
		log.debug("controller insertWorkHistory i : "+ i);		
		
		return mv;
		
	}	
	
	@RequestMapping(value="/history/updateWorkHistory.do")
	public ModelAndView updateWorkHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int i = historyService.updateWorkHistory(commandMap.getMap());
		log.debug("controller updateWorkHistory : "+commandMap.getMap());
			
		mv.addObject("result_code", "10");
		mv.setViewName("jsonView");
		log.debug("controller updateWorkHistory i : "+ i);	
		
		return mv;
		
	}

	@RequestMapping(value="/history/deleteWorkHistory.do")
	public ModelAndView deleteWorkHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int i = historyService.deleteWorkHistory(commandMap.getMap());
		log.debug("controller deleteWorkHistory : "+commandMap.getMap());
			
		mv.addObject("result_code", "00");
		mv.setViewName("jsonView");
		log.debug("controller deleteWorkHistory i : "+ i);	
		
		return mv;
		
	}
	
	@RequestMapping(value="/history/getWorkerNm.do")
    public ModelAndView getWorkerNm(CommandMap commandMap) throws Exception{ 
    	
		ModelAndView mv = new ModelAndView();
    	
    	Map<String,Object> map = historyService.getWorkerNm(commandMap.getMap());
    	mv.addObject("map", map);
    	 
    	 mv.setViewName("jsonView");

    	log.debug(mv);
    	log.debug("controller getWorkerNm : "+commandMap);
    	
    	return mv;
    }
	
	@RequestMapping(value="/history/getHistoryComCode.do")
    public ModelAndView getHistoryComCode(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
    	
    	List<Map<String,Object>> list = historyService.getHistoryComCode(commandMap.getMap());
    	
    	
    	mv.addObject("data", list);
    	
    	mv.setViewName("jsonView");
    	log.debug(mv);
    	log.debug("controller getHistoryListTest : "+commandMap);
    	
    	return mv;
    }

	
	
	
}
