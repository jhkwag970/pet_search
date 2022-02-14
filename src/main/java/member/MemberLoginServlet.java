package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      MemberDTO mem = null;
                  
      String mem_id = request.getParameter("mem_id");
      String mem_pw = request.getParameter("mem_pw");
      if (mem_id==null || mem_id.equals("") || mem_pw ==null ||mem_pw.equals("")) {
         
    	  request.getSession().setAttribute("messageType", "오류 메시지");
          request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요.");
         response.sendRedirect("login.jsp");
         return;
      }   
      try {         
    	  mem = new MemberDAO().login(mem_id,mem_pw);
    	  System.out.println(mem);
    	  if (mem == null) {
    		  request.getSession().setAttribute("messageType", "오류 메시지");
              request.getSession().setAttribute("messageContent", "입력 정보가 잘못됬습니다...");
              response.sendRedirect("login.jsp");
    	  }else {
    		  request.getSession().setAttribute("messageType", "성공 메시지");
              request.getSession().setAttribute("messageContent", "로그인에 성공했습니다.");
              request.getSession().setAttribute("user", mem.getMem_id());
              response.sendRedirect("index.jsp");
    	  }
      
      } catch (ClassNotFoundException | SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }   
}