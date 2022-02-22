package user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo {
	private int userno;
	private String email;
	private String pwd;
	private String name;
	private int gender;
	private String birthday;
	private String tel;
	private Timestamp regdate;
	private Timestamp moddate;
	private String zipcode;
	private String addr1;
	private String addr2;
	
}
