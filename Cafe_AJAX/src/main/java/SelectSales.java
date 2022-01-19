

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectSales
 */
@WebServlet("/SelectSales")
public class SelectSales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSales() {
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
		Statement stmt=null;
		ResultSet rs=null;

		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String userid="orauser";
		String passcode="human123";
		String sql="select nvl(b.mobile,'-') as mobile,a.name,b.qty,b.total,b.sold_time"
				+ " from menu a, cafe_sales b"
				+ " where a.code=b.menu_code"
				+ " order by b.sold_time";
		String strReturn="";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url,userid,passcode);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				String mobile=rs.getString("mobile");
				String name=rs.getString("name");
				int qty=rs.getInt("qty");
				int total=rs.getInt("total");
				String date=rs.getString("sold_time");
				
				
				if(!strReturn.equals("")) strReturn+=";";
				strReturn+=mobile+','+name+','+qty+','+total+','+date;
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.getWriter().print(strReturn);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
