package pos.sample.controller;

import java.util.List;
import java.util.Map;

//import javax.activation.CommandMap;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pos.common.logger.LoggerInterceptor;
import pos.sample.service.SampleService;

@Controller
public class SampleController {
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Autowired
	private SampleService sampleService;
	
	@RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openBoardList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardList");
    	
    	List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
    	mv.addObject("list", list);
    	
    	return mv;
    }

}
