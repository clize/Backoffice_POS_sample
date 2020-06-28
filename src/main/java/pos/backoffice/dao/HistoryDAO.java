package pos.backoffice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pos.common.dao.AbstractDAO;


@Repository("historyDAO")
public class HistoryDAO extends AbstractDAO{
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getWorkHistoryList(Map<String, Object> map) throws Exception{
		log.debug("getWorkHistoryListDAO"+map);
		return (List<Map<String, Object>>)selectList("history.getWorkHistoryList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getWorkHistoryListSub(Map<String, Object> map) throws Exception{
		log.debug("getWorkHistoryListSubDAO"+map);
		return (Map<String, Object>)selectOne("history.getWorkHistoryListSub", map);
	}
	
	public int insertWorkHistory(Map<String, Object> map) throws Exception{
		insert("history.insertWorkHistory", map);
		int workNo =  Integer.parseInt(map.get("mWorkNo").toString());
		log.debug("DAO insertWorkHistory mWorkNo"+ workNo);
		return workNo;
	}
	
	public int updateWorkHistory(Map<String, Object> map) throws Exception{
		update("history.updateWorkHistory", map);
		int workNo =  Integer.parseInt(map.get("mWorkNo").toString());
		log.debug("DAO update mWorkNo"+ workNo);
		return workNo;
	}
	
	public int deleteWorkHistory(Map<String, Object> map) throws Exception{
		delete("history.deleteWorkHistory", map);
		int workNo =  Integer.parseInt(map.get("mWorkNo").toString());
		log.debug("DAO update mWorkNo"+ workNo);
		return workNo;
	}
	

	@SuppressWarnings("unchecked")
	public Map<String, Object> getWorkerNm(Map<String, Object> map) throws Exception{
		log.debug("getWorkerNm"+map);
		return (Map<String, Object>)selectOne("history.getWorkerNm", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getHistoryComCode(Map<String, Object> map) throws Exception{
		log.debug("getWorkHistoryListTestDAO"+map);
		return (List<Map<String, Object>>)selectList("history.getHistoryComCode", map);
	}



}
