package study2.mapping;

public class HoewonVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private int age;
	private String gender;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	@Override
	public String toString() {
		return "HoewonVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", age=" + age
				+ ", gender=" + gender + ", address=" + address + ", getIdx()=" + getIdx() + ", getMid()=" + getMid()
				+ ", getPwd()=" + getPwd() + ", getName()=" + getName() + ", getAge()=" + getAge() + ", getGender()="
				+ getGender() + ", getAddress()=" + getAddress() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String address;
}
