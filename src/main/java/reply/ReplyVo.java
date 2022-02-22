package reply;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class ReplyVo extends CommonVo {
	private int replyno;
	private String title;
	private String content;
	private Timestamp regdate;
	private int userno;
	private int readcount;
	private String filename_org;
	private String filename_real;
	private String name;
	private int c_count;
	private int gno;
	private int ono;
	private int nested;
	
	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.regdate);
	}
}
