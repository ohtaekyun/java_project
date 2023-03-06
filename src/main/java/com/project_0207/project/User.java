package com.project_0207.project;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(collection = "users") // DB안에 users라는 콜렉션에 저장(table 개념)
public class User {

    @Id
    private String id; // 여기서 id는 mongoDB에서 객체를 식별하기 위한 id
    private String userid; // 유저 id
    private String password;
    private String nickname;
    private String realName; // 이름
    private String phoneNumber; // 핸드폰 번호
    private String email; // 핸드폰 번호
    // private boolean admin;
    // private int sort;

}