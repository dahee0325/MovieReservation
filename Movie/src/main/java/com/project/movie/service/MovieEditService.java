package com.project.movie.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.RequestMovieEdit;

@Service("movieEditService")
public class MovieEditService {
	// 자동 메퍼를 이용해서 생성할 dao 
			private MovieDao dao;
			// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
			@Autowired
			private SqlSessionTemplate template;
	
	public MovieInfo getEditFormData(int midx) {
				
				dao = template.getMapper(MovieDao.class);
				
				MovieInfo movieInfo = dao.selectMovieMidx(midx);
				

				return movieInfo;
			}
			
	public int edit(RequestMovieEdit edit, HttpServletRequest request) {

				System.out.println("2");
				// SqlSessionTemplate getMapper 를 이용해 dao 생성
				dao = template.getMapper(MovieDao.class);
				
				int rCnt = 0;
				MovieInfo movieInfo = edit.toMovieInfo();
				
				String path = "/uploadfile";
				String dir = request.getSession().getServletContext().getRealPath(path);
				System.out.println("3");
				// 신규 파일 체크
				if (edit.getmPhoto() != null && !edit.getmPhoto().isEmpty() && edit.getmPhoto().getSize() > 0) {

					String newFileName = edit.getMidx() + "_" + edit.getmPhoto().getOriginalFilename();

					try {
						// 신규파일 저장
						edit.getmPhoto().transferTo(new File(dir, newFileName));
						// 데이터 베이스 저장을 위한 새로운 파일 이름
						movieInfo.setmPhoto(newFileName);
						// 이전 파일 삭제
						//new File(dir, oldFile).delete();

					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else {
					// 신규파일이 없으면 이전 파일 이름을 그대로 업데이트
					//movieInfo.setmPhoto(oldFile); 
					System.out.println("4");
				}
				System.out.println("5");
				System.out.println(movieInfo);
				rCnt = dao.MovieEdit(movieInfo);

				return rCnt;
			}
			
			
}
