package com.project.movie.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.RequestMovieWrite;

@Service("movieWriteService")
public class MovieWriteService {
	// 자동 메퍼를 이용해서 생성할 dao 
		private MovieDao dao;
		// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
		@Autowired
		private SqlSessionTemplate template;
		
		public int write(HttpServletRequest request, 
				RequestMovieWrite regist) {
			
			System.out.println("3  "+ regist);
			
			dao = template.getMapper(MovieDao.class);
			// 서버 경로
			String path = "/uploadfile"; // 리소스 매핑 필요
			// 절대 경로 
			String dir = request.getSession().getServletContext().getRealPath(path);
			
			System.out.println("4  "+dir);
			
			MovieInfo movieInfo = regist.toMovieInfo();
			
			int resultCnt = 0;
			
			String newFileName = "";
			
			if(regist.getmPhoto()!= null) {
				// 새로운 파일 이름 생성
				//String newFileName = memberInfo.getuId()+System.nanoTime();				
				newFileName = movieInfo.getMidx()+"_"+regist.getmPhoto().getOriginalFilename();
				System.out.println(newFileName);
				// 파일을 서버의 지정 경로에 저장
				try {
					regist.getmPhoto().transferTo(new File(dir, newFileName));
					System.out.println(newFileName);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// 데이터베이스 저장을 하기위한 파일 이름 set
				movieInfo.setmPhoto(newFileName);
			}
			resultCnt = dao.MovieWrite(movieInfo);
			
			System.out.println("6  "+resultCnt);
			return resultCnt;
		}
		

}
