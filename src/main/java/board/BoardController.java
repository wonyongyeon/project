package board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import comment.CommentService;
import comment.CommentVo;
import user.UserVo;
import util.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	CommentService cService;

	@GetMapping("/board/index.do")
	public String index(Model model, HttpServletRequest req, BoardVo vo) {
		
		int totCount = boardService.count(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<BoardVo> list = boardService.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));		
		return "board/index";
	}
	@RequestMapping("/board/write.do")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/board/insert.do")
	public String insert(BoardVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		//파일저장 
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = boardService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "write.do");
		}
		
		return "include/return";
		}

	@GetMapping("/board/view.do")
	public String view(Model model, @RequestParam int boardno) {
		model.addAttribute("data", boardService.view(boardno));
		CommentVo cv = new CommentVo();
		cv.setBoardno(boardno);
		cv.setTablename("board");
		model.addAttribute("cList", cService.selectList(cv));
		return "board/view";
	}
	
	@GetMapping("/board/edit.do")
	public String edit(Model model, @RequestParam int boardno) {
		model.addAttribute("data", boardService.edit(boardno));
		return "board/edit";
	}
	
	@PostMapping("/board/update.do")
	public String update(Model model, BoardVo vo, MultipartFile file, HttpServletRequest req) {
		// 사용자가 체크박스를 체크했는지 여부
		if ("1".equals(req.getParameter("delCheck"))) {
			BoardVo bv = boardService.edit(vo.getBoardno());
			File f = new File(req.getRealPath("/upload/")+bv.getFilename_real());
			f.delete();
			vo.setFilename_org("");
			vo.setFilename_real("");
		}
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = boardService.update(vo);
		if(r > 0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","view.do?boardno="+vo.getBoardno()); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","수정오류");
			model.addAttribute("url","edit.do?boardno="+vo.getBoardno()); //실패했을때 수정페이지 이동 
		}
		return "include/return";
	}
	
	@GetMapping("/board/delete.do")
	public String delete(Model model, BoardVo vo) {
		int r = boardService.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?boardno="+vo.getBoardno()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
	@GetMapping("/board/deleteAjax.do")
	public String deleteAjax(Model model, BoardVo vo) {
		model.addAttribute("result",boardService.delete(vo));
		return "include/result";
	}
}
