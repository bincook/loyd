package kr.co.loyd.dto;

public class LoydDto {

    private int id;
    private String pwd;
    private String email;

    public LoydDto() {
    }

    public LoydDto(int id, String pwd, String email) {
        this.id = id;
        this.pwd = pwd;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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


}
