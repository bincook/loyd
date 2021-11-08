package kr.co.loyd.dto;

import java.sql.Date;

public class MemberDto {

    private Long id;
    private String name;
    private String email;
    private String pwd;
    private String phone;
    private Date register_date;
    
    
    private Long tot;
    

  

	public Long getTot() {
		return tot;
	}

	public void setTot(Long tot) {
		this.tot = tot;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Date register_date) {
        this.register_date = register_date;
    }
}
