package project.pj_cart.domain;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

	@NotBlank(message = "아이디를 입력해주세요!")
	@Size(min = 5, max = 15)
	@Pattern(regexp = "^[A-Za-z0-9]{5,15}$", message = "아이디는 5 ~ 15길이의 영문자 또는 숫자로 시작하는 ID이어야 됩니다.")
	private String id;
	
	@NotBlank(message = "비밀번호를 입력해주세요!")
	@Size(min = 8, max = 15)
	@Pattern(regexp = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$", message = "영문,숫자,특수문자를 포함해서 8~15자리로 입력해주세요.")
	private String pwd;
	
	@NotBlank(message = "이름을 입력해주세요!")
	private String name;
	
	@Email
	@Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")
	private String email;
	
	@NotBlank(message = "연락처를 입력해주세요!")
	@Pattern(regexp = "^[0-9]{10,11}$", message = "-를 제외하고 입력해주세요.")
	private String tel;
	
	private String postcode;
	private String addr;
	private String detailAddr;
	private int userStatus;
	private int mail_auth;
	private String mail_key;
	private Timestamp regDate;
	
}
