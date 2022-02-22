package board;

import java.util.List;

public interface BoardService {
	
	List<BoardVo> selectList(BoardVo vo);
	int count(BoardVo vo);
	int insert(BoardVo vo); // 추상메서드 // BoardServiceImpl에서 재정의 
	BoardVo view(int boardno);
	BoardVo edit(int boardno);
	int update(BoardVo vo);
	int delete(BoardVo vo);
}
