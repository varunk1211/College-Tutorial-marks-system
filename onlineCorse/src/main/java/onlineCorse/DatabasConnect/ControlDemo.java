package onlineCorse.DatabasConnect;

public class ControlDemo {

	private int id;
	private String fname;
	private String lname;
	private String dob;
	private String gender;
	private int departmentid;
	private String dname;
	
	private String email;
	
	 public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ControlDemo(int id,String fname,String dob,String gender,String email,String dname){
		 this.id=id;
		 this.fname=fname;
		 this.dob=dob;
		 this.gender=gender;
		 this.email=email;
		 this.dname=dname;
		 
	 }
	private String cname1;
	private String date;
	
	public String getCname1() {
		return cname1;
	}

	public void setCname1(String cname1) {
		this.cname1 = cname1;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ControlDemo(int id, String fname, String date, String cname1) {
		super();
		this.id = id;
		this.fname = fname;
		this.date = date;
		this.cname1 = cname1;
	}


	
	//video
	private int vid;
	private String vtitle ;
	private String udate;
	private String url;
	
	public ControlDemo(int vid,int cid, String vtitle,String url,String udate) {
		super();
		this.vid = vid;
		this.vtitle = vtitle;
		this.udate = udate;
		this.url = url;
		this.cid = cid;
	}

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public String getVtitle() {
		return vtitle;
	}

	public void setVtitle(String vtitle) {
		this.vtitle = vtitle;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	private int cid;
	
	private String cname;
	public ControlDemo(int cid,String cname, int credits,int departmentid) {
		super();
		this.departmentid = departmentid;
		this.cid = cid;
		this.cname1 = cname;
		this.credits = credits;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname1;
	}

	public void setCname(String cname) {
		this.cname1 = cname;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	private int credits;
	
	
	
	
	public ControlDemo(int id, String fname, String lname, String dob, String gender, int departmentid) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.gender = gender;
		this.departmentid = departmentid;
	}

	public ControlDemo(int departmentid, String dname) {
		super();
		this.departmentid = departmentid;
		this.dname = dname;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public String getdname() {
		return dname;
	}
	
	public void setdname(String dname) {
		this.dname = dname;
	}
	
		
	
	
}
