package com.project_0207.project;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, String> {
    User findByUserid(String userid);
    User findByNickname(String nickname);  
    default boolean checkDupId(String userid) {
        return findByUserid(userid) != null;
    }
    default boolean checkDupNick(String nickname) {
        return findByNickname(nickname) != null;
    }
}