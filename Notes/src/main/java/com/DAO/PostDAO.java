package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDAO {
	private Connection conn;
	public PostDAO(Connection conn) {
		
		super();
		
		this.conn=conn;
	}
	public boolean AddNotes(String ti, String co, int ui) {
		boolean f=false;
		try {
			String query = "insert into post (title, content, uid) Values (?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
//start code To get all post from post table
	public List<Post> getData(int id) 
	{
		List<Post> list=new ArrayList<Post>();
		Post po;
		try {
			String query = "Select * from post where uid=?";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				po=new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				
				list.add(po);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//End Code	
	
	// Code to get all the post by a particular User
		public Post getDataByID(int nodeId) {

			Post p = null;
			try {
				String query = "select * from post where id=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, nodeId);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					p = new Post();
					p.setId(rs.getInt(1));
					p.setTitle(rs.getString(2));
					p.setContent(rs.getString(3));

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return p;
		}

		// Code to update post by a particular User
		public boolean UpdateNotes(int nid, String ti, String con) {

			boolean f = false;
			try {
				String query = "update post set title=?, content=? where id=?";
				PreparedStatement pstmt = conn.prepareStatement(query);

				pstmt.setString(1, ti);
				pstmt.setString(2, con);
				pstmt.setInt(3, nid);

				int i = pstmt.executeUpdate();
				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}

		// Code to delete post by a particular User
		public boolean DeleteNotes(int nid) {

			boolean f = false;
			try {
				String query = "delete post from post where id=?";
				PreparedStatement pstmt = conn.prepareStatement(query);

				pstmt.setInt(1, nid);

				int i = pstmt.executeUpdate();
				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}
	
}
