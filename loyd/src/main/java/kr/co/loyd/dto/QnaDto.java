package kr.co.loyd.dto;

public class QnaDto {

	private String id;
	private String secret;
	private String title;
	private String content;
	private String email;
	private boolean emailChk;
	private String pwd;
	private String qnatype;
	private String writeday;
	private String watch_id;
	
	private String totq;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}

	public String getTotq() {
		return totq;
	}

	public void setTotq(String totq) {
		this.totq = totq;
	}
	
	
		
	
}
