<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day03.*, java.util.ArrayList" %>
<%
	Handler hd = (Handler)application.getAttribute("handler");
	if(hd == null) {		// 없으면
		hd = new Handler();	// 새로 생성하여
	}
	application.setAttribute("handler", hd);	// application에 넣어둔다
	
	
	ArrayList<Book> list = (ArrayList<Book>)application.getAttribute("list");
	if(list == null) {
		list = hd.getList();
	}
	application.setAttribute("list", list);
	
	// index.jsp 와 동일한 handler, list를 불러오는데 성공
	
	
	request.setCharacterEncoding("UTF-8");	
	
%>
<jsp:useBean id="user" class="day03.Book" />
<jsp:setProperty property="*" name="user" />
<%
	hd.insert(user);					// 객체를 리스트에 추가하고
	response.sendRedirect("index.jsp");	// index.jsp로 이동하도록 만든다
	
	// add-result.jsp 에서는 목록을 출력하지 않기 때문에
	// 직접 list를 참조할 이유가 없어서, list를 불러오지 않아도 된다.
%>





