package kr.co.loyd.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewsMultipartDto extends ReviewsDto{
	
	private MultipartFile file;
	private int file_id;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	
	
	

}
