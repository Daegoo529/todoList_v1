package com.ssg.webmvc1.todo.controller;

import com.ssg.webmvc1.todo.dto.TodoDTO;
import com.ssg.webmvc1.todo.service.TodoService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "todoModifyController", value = "/todo/modify")
@Log4j2
public class TodoModifyController  extends HttpServlet {

    private TodoService todoService = TodoService.INSTANCE;
    private final DateTimeFormatter DATEFORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long tno = Long.parseLong(req.getParameter("tno"));
            TodoDTO todoDTO = todoService.get(tno);
            //모델 담기
            req.setAttribute("dto", todoDTO);
            req.getRequestDispatcher("/WEB-INF/todo/modify.jsp").forward(req, resp);

        }catch(Exception e){
            log.error(e.getMessage());
            throw new ServletException("modify get... error");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dueDateStr = req.getParameter("dueDate");

        LocalDate dueDate = null;

        if (dueDateStr != null && !dueDateStr.trim().isEmpty()) {
            dueDate = LocalDate.parse(dueDateStr, DATEFORMATTER);
        }

        String finishedStr = req.getParameter("finished");

        TodoDTO todoDTO = TodoDTO.builder()
                .tno(Long.parseLong(req.getParameter("tno")))
                .title(req.getParameter("title"))
                .dueDate(dueDate)
                .finished( finishedStr !=null && finishedStr.equals("on")  )
                .build();

        log.info("/todo/modify POST...");
        log.info(todoDTO);
        try {
            todoService.modify(todoDTO);
        } catch (Exception e) {
            resp.setContentType("text/html;charset=UTF-8");

            PrintWriter out = resp.getWriter();

            out.println("<script>");
            out.println("alert('" + e.getMessage() + "');");
            out.println("history.back();");
            out.println("</script>");

            return;
        }
        resp.sendRedirect("/todo/list");

    }


}


