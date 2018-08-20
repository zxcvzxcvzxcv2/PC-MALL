package mail;

import java.sql.Date;

import oracle.sql.DATE;

public class EvaluationDTO {
	
	String M_UID;
	String M_PWD;
	String M_NAME;
	String M_SSN;
	String M_EMAIL;
	String MPHONE;
	String M_JOB;
	DATE M_REGDATE;
	int M_VISIT;
	DATE M_LASTVISIT;
	String M_ZIP;
	String M_ADDRESS;
	
	
	public String getM_UID() {
		return M_UID;
	}
	public void setM_UID(String m_UID) {
		this.M_UID = m_UID;
	}
	public String getM_PWD() {
		return M_PWD;
	}
	public void setM_PWD(String m_PWD) {
		this.M_PWD = m_PWD;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		this.M_NAME = m_NAME;
	}
	public String getM_SSN() {
		return M_SSN;
	}
	public void setM_SSN(String m_SSN) {
		this.M_SSN = m_SSN;
	}
	public String getM_EMAIL() {
		return M_EMAIL;
	}
	public void setM_EMAIL(String m_EMAIL) {
		this.M_EMAIL = m_EMAIL;
	}
	public String getMPHONE() {
		return MPHONE;
	}
	public void setMPHONE(String mPHONE) {
		this.MPHONE = mPHONE;
	}
	public String getM_JOB() {
		return M_JOB;
	}
	public void setM_JOB(String m_JOB) {
		this.M_JOB = m_JOB;
	}
	public DATE getM_REGDATE() {
		return M_REGDATE;
	}
	public void setM_REGDATE(DATE m_REGDATE) {
		this.M_REGDATE = m_REGDATE;
	}
	public int getM_VISIT() {
		return M_VISIT;
	}
	public void setM_VISIT(int m_VISIT) {
		this.M_VISIT = m_VISIT;
	}
	public DATE getM_LASTVISIT() {
		return M_LASTVISIT;
	}
	public void setM_LASTVISIT(DATE m_LASTVISIT) {
		this.M_LASTVISIT = m_LASTVISIT;
	}
	public String getM_ZIP() {
		return M_ZIP;
	}
	public void setM_ZIP(String m_ZIP) {
		this.M_ZIP = m_ZIP;
	}
	public String getM_ADDRESS() {
		return M_ADDRESS;
	}
	public void setM_ADDRESS(String m_ADDRESS) {
		this.M_ADDRESS = m_ADDRESS;
	}
	
	
	
	public EvaluationDTO(String m_UID, String m_PWD, String m_NAME, String m_SSN, String m_EMAIL, String mPHONE,
			String m_JOB, DATE m_REGDATE, int m_VISIT, DATE m_LASTVISIT, String m_ZIP, String m_ADDRESS) {
		super();
		this.M_UID = m_UID;
		this.M_PWD = m_PWD;
		this.M_NAME = m_NAME;
		this.M_SSN = m_SSN;
		this.M_EMAIL = m_EMAIL;
		this.MPHONE = mPHONE;
		this.M_JOB = m_JOB;
		this.M_REGDATE = m_REGDATE;
		this.M_VISIT = m_VISIT;
		this.M_LASTVISIT = m_LASTVISIT;
		this.M_ZIP = m_ZIP;
		this.M_ADDRESS = m_ADDRESS;
	}
	

}
