package reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao replyDao;
	
	@Override
	public int count(ReplyVo vo) {
		return replyDao.count(vo);
	}
	
	@Override
	   public List<ReplyVo> selectList(ReplyVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
	      return replyDao.selectList(vo);
	   }
	
	@Override
	public int insert(ReplyVo vo) { // 재정의 
		int r = replyDao.insert(vo);
		if (r > 0) {
			replyDao.updateGno(vo.getReplyno());
		}
		return r;
	}

	@Override
	public ReplyVo view(int boardno) {
		replyDao.updateReadcount(boardno);
		return replyDao.selectOne(boardno);
	}
	
	@Override
	public ReplyVo edit(int boardno) {
		return replyDao.selectOne(boardno);
	}
	
	@Override
	public int update(ReplyVo vo) {
		return replyDao.update(vo);
	}
	
	@Override
	public int delete(ReplyVo vo) {
		return replyDao.delete(vo);
	}

	@Override
	public int reply(ReplyVo vo) {
		replyDao.updateOno(vo);
		vo.setOno(vo.getOno()+1);
		vo.setNested(vo.getNested()+1);
		return replyDao.insertReply(vo);
	}
	
}
