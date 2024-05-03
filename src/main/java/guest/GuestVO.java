package guest;

public class GuestVO {
	private int idx;
	private String name;
	private String content;
	private String email;
	private String homePage;
	private String visitDate;
	private String guestIP;
	
	public int getIdx() {
		return idx;
	}
	@Override
	public String toString() {
		return "GuestVO [idx=" + idx + ", name=" + name + ", content=" + content + ", email=" + email + ", homePage="
				+ homePage + ", visitDate=" + visitDate + ", guestIP=" + guestIP + ", getIdx()=" + getIdx()
				+ ", getName()=" + getName() + ", getContent()=" + getContent() + ", getEmail()=" + getEmail()
				+ ", getHomePage()=" + getHomePage() + ", getVisitDate()=" + getVisitDate() + ", getGuestIP()="
				+ getGuestIP() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getGuestIP() {
		return guestIP;
	}
	public void setGuestIP(String guestIP) {
		this.guestIP = guestIP;
	}
}
