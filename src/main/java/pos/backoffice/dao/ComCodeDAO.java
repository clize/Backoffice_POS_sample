package pos.backoffice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pos.common.dao.AbstractDAO;

@Repository("comcodeDAO")
public class ComCodeDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getComCodeList(Map<String, Object> map) throws Exception{
		log.debug("getComCodeList"+map);
		return (List<Map<String, Object>>)selectList("comcode.selectComCodeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getComCodeListSub(Map<String, Object> map) throws Exception{
		log.debug("selectComCodeListSub"+map);
		return (List<Map<String, Object>>)selectList("comcode.selectComCodeListSub", map);
	}

}
