package pos.backoffice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import pos.backoffice.dao.HistoryDAO;
import pos.common.logger.LoggerInterceptor;


@Service("historyService")
public class HistoryServiceImpl implements HistoryService{
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	
	@Resource(name="historyDAO")
	private HistoryDAO historyDAO;
	
	@Override
	public List<Map<String, Object>> getWorkHistoryList(Map<String, Object> map) throws Exception {
		return historyDAO.getWorkHistoryList(map);
		
	}
	
	@Override
	public Map<String, Object> getWorkHistoryListSub(Map<String, Object> map) throws Exception {
		log.debug("getWorkHistoryListSubService,"+map);
		Map<String, Object> resultMap = historyDAO.getWorkHistoryListSub(map); 
		
		return resultMap;
		
	}
	
	@Override
	public int insertWorkHistory(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return historyDAO.insertWorkHistory(map);
	
	}

	@Override
	public int updateWorkHistory(Map<String, Object> map) throws Exception {
		return historyDAO.updateWorkHistory(map);
	
	}
	
	@Override
	public int deleteWorkHistory(Map<String, Object> map) throws Exception {
		return historyDAO.deleteWorkHistory(map);
	
	}
	
	@Override
	public Map<String, Object> getWorkerNm(Map<String, Object> map) throws Exception {
		log.debug("getWorkerNm,"+map);
		Map<String, Object> resultMap = historyDAO.getWorkerNm(map); 
		
		return resultMap;
		
	}
	
	@Override
	public List<Map<String, Object>> getHistoryComCode(Map<String, Object> map) throws Exception {
		log.debug("getHistoryComCode,"+map);
		return historyDAO.getHistoryComCode(map);
		
	}
	
}
