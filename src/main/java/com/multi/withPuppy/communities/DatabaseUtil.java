package com.multi.withPuppy.communities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/withpuppy?serverTimezone=UTC"; // 데이터베이스 URL
    private static final String DB_USER = "root"; // 데이터베이스 사용자명
    private static final String DB_PASSWORD = "1234"; // 데이터베이스 비밀번호

    public static Connection getConnection() {
        Connection conn = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");

            // 데이터베이스에 연결
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }
}
