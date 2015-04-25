package com.ita.bdicdm.DAO;
import java.sql.*;

public class HiveConnector {
	static String connectionURL = "jdbc:hive://192.168.56.101:10000/default;AuthMec=0";
	
	public static void main(String[] args) {
		String hiveClassName = "com.cloudera.hive.jdbc41.HS1Driver";
		
		try {
			// Loading connection
			Class.forName(hiveClassName);
			Connection hiveConnection = DriverManager.getConnection(connectionURL);
			Statement data2Sql = hiveConnection.createStatement();
			// regular hive query
		    String sql = "select aleID from alecdsilTest";
		    System.out.println("Running: " + sql);
		    ResultSet res  = data2Sql.executeQuery(sql);
		    while (res.next()) {
		      System.out.println(res.getString(1));
		    }
		    res.close();
		    data2Sql.close();
		    hiveConnection.close();
		    
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
