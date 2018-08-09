package shopdb.product;

import java.sql.*;
import java.util.*;
import shopdb.dbpool.*;

public class category{
	
	private Vector name = null; 
	private Vector company_id = null;
	private Vector expression = null;
	private Vector photo = null;
	private Vector category = null;
	private Vector c_name =  null;
	private Vector id =  null;
	private Vector price =  null;
	private Vector c_namers =  null;

		
  private int newnum =0;
  
	public  void setC(int c){
		this.newnum = c;
	}

	public Vector getName(){
		return this.name;
	}
	public Vector getCompany_id(){
		return this.company_id;
	}
	public Vector getExpression(){
		return this.expression;
	}
	public Vector getPhoto(){
		return this.photo;
	}
	public Vector getCategory(){
		return this.category;
	}
	public Vector getC_name(){
		return this.c_name;
	}
	public Vector getId(){
		return this.id;
	}
	public Vector getPrice(){
		return this.price;
	}
	public Vector getC_namers(){
		return this.c_namers;
	}

	public void List(){
		name = new Vector();  // ��ǰ �̸�
		company_id = new Vector(); // ȸ�� �̸�
		expression = new Vector();// ����
		photo = new Vector(); // �̹���
		category =  new Vector();// ī�װ�
		c_name =  new Vector();// ī�װ� �̸�
		id =  new Vector();// ��ǰ ���̵�
		price =  new Vector();// ��ǰ ����
		c_namers =  new Vector();

		ResultSet rs=null;
		//JDBC����̹��� �ε��Ѵ�.
		try { 
			 //DBǮ �޴��� ��ü ���� ���
			DBConnectionManager pool = DBConnectionManager.getInstance();
			Connection con = pool.getConnection("shop");//���ڰ� shop

			Statement stmt=con.createStatement();
			rs=stmt.executeQuery("select a.id,a.name,a.price,a.company_id,a.expression,a.photo,a.category,b.name from product a , category b where  a.category=b.id and category="+ newnum);
 
			while(rs.next()) {
				id.addElement(new Integer(rs.getInt(1)));
				name.addElement(rs.getString(2));
				price.addElement(new Integer(rs.getInt(3)));
				company_id.addElement(rs.getString(4));
     			expression.addElement(rs.getString(5));
				photo.addElement(rs.getString(6));
				category.addElement(new Integer(rs.getInt(7)));
				c_name.addElement(rs.getString(8));
			}
			stmt.close();
			rs.close();
			pool.freeConnection("shop", con); 

		} catch (Exception e)	{	}
	}
}