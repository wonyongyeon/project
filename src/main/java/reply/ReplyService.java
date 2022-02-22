package reply;

import java.util.List;

public interface ReplyService {
	
	List<ReplyVo> selectList(ReplyVo vo);
	int count(ReplyVo vo);
	int insert(ReplyVo vo); // 추상메서드 // BoardServiceImpl에서 재정의 
	int reply(ReplyVo vo);
	ReplyVo view(int boardno);
	ReplyVo edit(int boardno);
	int update(ReplyVo vo);
	int delete(ReplyVo vo);
}
