package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public int count(BoardVo vo) {
		return boardDao.count(vo);
	}
	
	@Override
	   public List<BoardVo> selectList(BoardVo vo) {
//		  Map map = new HashMap();
//		  map.put("searchWord", searchWord);
//		  map.put("searchType", searchType);
	      return boardDao.selectList(vo);
	   }
	
	@Override
	public int insert(BoardVo vo) { // 재정의 
		return boardDao.insert(vo);
	}

	@Override
	public BoardVo view(int boardno) {
		boardDao.updateReadcount(boardno);
		return boardDao.selectOne(boardno);
	}
	
	@Override
	public BoardVo edit(int boardno) {
		return boardDao.selectOne(boardno);
	}
	
	@Override
	public int update(BoardVo vo) {
		return boardDao.update(vo);
	}
	
	@Override
	public int delete(BoardVo vo) {
		return boardDao.delete(vo);
	}
	
}
