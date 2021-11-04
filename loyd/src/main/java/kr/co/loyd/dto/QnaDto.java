package kr.co.loyd.dto;

public class QnaDto {

	private int id;
	private int secret;
	private String title;
	private String content;
	private String email;
	private boolean emailChk;
	private String pwd;
	private String qnatype;
	private String writeday;
	private int watch_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
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
	public int getWatch_id() {
		return watch_id;
	}
	public void setWatch_id(int watch_id) {
		this.watch_id = watch_id;
	}
	public boolean isEmailChk() {
		return emailChk;
	}
	public void setEmailChk(boolean emailChk) {
		this.emailChk = emailChk;
	}
	
	
	
	
}
