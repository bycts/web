package ccit.byc.tamall.admain;

public class User {
	// 对应数据库表
	private String uid;// 主键
	private String loginname;// 登录名
	private String loginpass;// 登录密码
	private int status;// 状态，true表示已激活，或者未激活
	private String activationCode;// 激活码，它是唯一值！即每个用户的激活码是不同的！

	// 注册表单
	private String reloginpass;// 确认密码

	// 修改密码表单
	private String newpass;// 新密码

	@Override
	public String toString() {
		return "User [uid=" + uid + ", loginname=" + loginname + ", loginpass=" + loginpass + ", status=" + status
				+ ", activationCode=" + activationCode + ", reloginpass=" + reloginpass + ", newpass=" + newpass + "]";
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpass() {
		return loginpass;
	}

	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getReloginpass() {
		return reloginpass;
	}

	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

}
