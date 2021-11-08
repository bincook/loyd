package kr.co.loyd.dto;
import javax.validation.constraints.NotEmpty;
public class QnaDto {

	private long id;
	private String secret;
	private String title;
	private String content;
	private String email;
	@NotEmpty
	private boolean emailChk;
	private String pwd;
	private String qnatype;
	private String writeday;
	private long watch_id;
	
	
	private String totq;
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(long watch_id) {
		this.watch_id = watch_id;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEmailChk() {
		return emailChk;
	}

	public void setEmailChk(boolean emailChk) {
		this.emailChk = emailChk;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getQnatype() {
		return qnatype;
	}

	public void setQnatype(String qnatype) {
		this.qnatype = qnatype;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	

	public String getTotq() {
		return totq;
	}

	public void setTotq(String totq) {
		this.totq = totq;
	}
	
	
		
	
}
