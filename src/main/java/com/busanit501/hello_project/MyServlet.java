package com.busanit501.hello_project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "myServlet", urlPatterns = "/my")

public class MyServlet extends HttpServlet{

    @Override
    //트라이 캐치처럼 실험을 하다가 캐치블럭에 던지고 예외처리 했던 것처럼 처리해도 되지만, 쓰로우로 던져서 서블릿 익셉션에 두고, 인풋 아웃풋 익셉션으로 던져주기.
    protected void doGet(HttpServletRequest req,  HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=UTF-8");
              PrintWriter out = resp.getWriter();   //파일에 쓰거나 읽을 때 인풋 아우풋 스트림 이런 거 나왔는데, 얘는 웹 페이지라는 화면에 쓰는 도구
                out.println("<html><body>");
                out.println("<h1>Hello World! 마이서블릿! 이상록 것 입니다</h1>");
                out.println("</body></html>");
    }



}
