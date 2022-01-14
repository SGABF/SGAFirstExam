package kr.green.search.vo;

public class SearchVO<Stirng> {
	private String result;
	
	public SearchVO(String result) {
		this.result= result;
		
	
	}
	public String getNaver(String a) {
		
		result = ("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=") + a;
		return result;
	}
	public String getDaum(String a) {
			
		result = ("https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=") + a;
		return result;
	}
	public String getGoogle(String a) {
		
		result = ("https://www.google.com/search?q=") + a;
		return result;
	}
	
	

}
