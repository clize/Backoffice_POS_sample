package pos.sample.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
//import org.apache.log4j.Logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import pos.common.logger.LoggerInterceptor;
import pos.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
//	Logger log = Logger.getLogger(this.getClass());
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
		
	}


}
