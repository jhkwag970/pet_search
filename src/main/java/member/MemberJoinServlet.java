package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class MemberJoinServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=UTF-8");
						
						//parameter�� ���޹ޱ�
		String mem_id = request.getParameter("mem_id");
		String mem_pw1 = request.getParameter("mem_pw1");
		String mem_pw2 = request.getParameter("mem_pw2");
		String mem_name = request.getParameter("mem_name");
		String mem_tel = request.getParameter("mem_tel");
		String mem_email = request.getParameter("mem_email");

	
		//���� �Էµ��� �ʾҴٸ� ��µǴ� ���� -> �̰� ��� �׳� required�� �ذᰡ��
		if (mem_id == null || mem_id.equals("") || mem_pw1==null || mem_pw1.equals("") 
				|| mem_pw2==null || mem_pw2.equals("") || mem_name==null || mem_name.equals("") 
				|| mem_tel==null || mem_tel.equals("") || mem_email==null || mem_email.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
	         request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
			response.sendRedirect("join.jsp");
			return;
		}
		if (!mem_pw1.equals(mem_pw2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
	         request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다");
			response.sendRedirect("join.jsp");
			return;
		}
		int result;
		try {
			result = new MemberDAO().join(mem_id,mem_pw1,mem_name,mem_tel,mem_email);
			if(result==1 ) {
				request.getSession().setAttribute("messageType", "성공 메시지");
	            request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다");
				response.sendRedirect("login.jsp");
				return;
			}
			else {
				request.getSession().setAttribute("messageType", "오류 메시지");
	            request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다");
				response.sendRedirect("join.jsp");
				return;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
