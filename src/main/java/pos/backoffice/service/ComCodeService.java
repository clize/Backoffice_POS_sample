package pos.backoffice.service;

import java.util.List;
import java.util.Map;

public interface ComCodeService {
	
	List<Map<String, Object>> getComCodeList(Map<String, Object> commandMap) throws Exception;
	
	List<Map<String, Object>> getComCodeListSub(Map<String, Object> commandMap) throws Exception;

}
