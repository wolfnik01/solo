package com.itwillbs.Board;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
 
import lombok.Data;
 
@Entity
@Data
public class Article {
    
    @Id
    @GeneratedValue
    int id;
    String subject;
    
    @Column(length = 100000000)
    String content;
    
    Date regDate;
}


출처: https://devofhwb.tistory.com/90 [이든의 생활코딩]
