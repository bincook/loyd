package kr.co.loyd.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewsMultipartDto extends ReviewsDto{
	
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	

}
