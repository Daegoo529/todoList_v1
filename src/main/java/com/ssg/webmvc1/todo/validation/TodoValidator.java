package com.ssg.webmvc1.todo.validation;

import com.ssg.webmvc1.todo.dto.TodoDTO;

import java.time.LocalDate;

public class TodoValidator{

    public static void validate(TodoDTO dto) throws Exception {
        if(dto.getTitle() == null || dto.getTitle().trim().isEmpty()){
            throw new Exception("제목은 필수 입력입니다.");
        }
        if(dto.getDueDate() == null) {
            throw new Exception("날짜는 필수 입력입니다.");
        }
    }
}


//private Long tno;   //할일 고유값 pk
//private String title;    //할일 제목
//private LocalDate dueDate;  //등록시간
//private boolean finished;   // 할일 체크