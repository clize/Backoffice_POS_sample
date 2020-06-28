package pos.backoffice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface HistoryService {
	

	List<Map<String, Object>> getWorkHistoryList(Map<String, Object> commandMap) throws Exception;
	
	Map<String, Object> getWorkHistoryListSub(Map<String, Object> map) throws Exception;

	int insertWorkHistory(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	int updateWorkHistory(Map<String, Object> map) throws Exception;
	
	int deleteWorkHistory(Map<String, Object> map) throws Exception;

	Map<String, Object> getWorkerNm(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getHistoryComCode(Map<String, Object> commandMap) throws Exception;

}
