package reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository  // MvcCinfig 에 스캔을 해서 @Repository 적기만해도 빈 객체 생성 
public class ReplyDao {
	
	@Autowired // 자동 주입 : 객체의 타입이 일치하는 객체를 자동으로 주입
	SqlSessionTemplate sqlSessionTemplate;
	
	public int count(ReplyVo vo) {
		return sqlSessionTemplate.selectOne("reply.count",vo);
	}
	
	public List<ReplyVo> selectList(ReplyVo vo) {
		return sqlSessionTemplate.selectList("reply.selectList",vo);
	}

	public int insert(ReplyVo vo) {
		//return sqlSessionTemplate.insert("reply.insert",vo);
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("reply.insert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int updateGno(int replyno) {
		return sqlSessionTemplate.update("reply.updateGno", replyno);
	}
	
	public int updateOno(ReplyVo vo) {
		return sqlSessionTemplate.update("reply.updateOno", vo);
	}
	
	public int insertReply(ReplyVo vo) {
		return sqlSessionTemplate.insert("reply.insertReply", vo);		
	}
	
	public ReplyVo selectOne(int boardno) {
		return sqlSessionTemplate.selectOne("reply.selectOne",boardno);
	}
	
	public int updateReadcount(int boardno) {
		return sqlSessionTemplate.update("reply.updateReadcount", boardno);
	}
	public int update(ReplyVo vo) {
		return sqlSessionTemplate.update("reply.update", vo);
	}
	
	public int delete(ReplyVo vo) {
		return sqlSessionTemplate.delete("reply.delete",vo.getReplyno());
	}
}


