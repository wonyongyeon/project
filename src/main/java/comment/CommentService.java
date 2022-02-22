package comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired
	CommentDao dao;
	
	public List<CommentVo> selectList(CommentVo vo) {
		return dao.selectList(vo);
	}
	
	public int insert(CommentVo vo) {
		return dao.insert(vo);
	}
	
	public int delete(int c_no) {
		return dao.delete(c_no);
	}
}
