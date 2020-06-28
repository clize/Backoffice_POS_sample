package pos.backoffice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import pos.backoffice.dao.ComCodeDAO;
import pos.common.logger.LoggerInterceptor;

@Service("comcodeService")
public class ComCodeServiceImpl implements ComCodeService {

	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	
	@Resource(name="comcodeDAO")
	private ComCodeDAO comcodeDAO;
	
	@Override
	public List<Map<String, Object>> getComCodeList(Map<String, Object> map) throws Exception {
		return comcodeDAO.getComCodeList(map);
		
	}
	
	@Override
	public List<Map<String, Object>> getComCodeListSub(Map<String, Object> map) throws Exception {
		return comcodeDAO.getComCodeListSub(map);
		
	}
	
	
}
