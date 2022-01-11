

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertSales
 */
@WebServlet("/InsertSales")
public class InsertSales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSales() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Connection conn=null;
		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs=null;

		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String userid="orauser";
		String passcode="human123";
		String sql="insert into cafe_sales values(seq_cafe.nextval,?,?,?,?,to_char(sysdate,'mm/dd hh24:mi:ss'))";
		String result_flag="";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url,userid,passcode);
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select code from menu where name='"+request.getParameter("menuname")+"'");
			rs.next();
			int code=rs.getInt("code");
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1,request.getParameter("mobile"));
			pstmt.setInt(2,code);
			pstmt.setInt(3,Integer.parseInt(request.getParameter("qty")));
			pstmt.setInt(4,Integer.parseInt(request.getParameter("total")));
					
			pstmt.executeUpdate();
			result_flag="OK";
		} catch(Exception e){
			result_flag="FAIL";
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
