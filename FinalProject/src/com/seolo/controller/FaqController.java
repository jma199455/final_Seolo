/*==========================
   FaqController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seolo.admin.INoticeDAO;
import com.seolo.admin.NoticeDTO;
import com.seolo.dto.AdminDTO;
import com.seolo.dto.FaqRunDTO;
import com.seolo.dto.ReportRunDTO;
import com.seolo.idao.IAccountListDAO;
import com.seolo.idao.IFaqRunDAO;
import com.seolo.idao.IFaqviewDAO;
import com.seolo.idao.IReportRunDAO;
import com.seolo.idao.IReportviewDAO;
import com.seolo.idao.IWithdrawalAccountListDAO;
import com.seolo.personal.PersonalDTO;

@Controller
public class FaqController
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	
	// 자주 묻는 게시판 처리 게시판 조회
	@RequestMapping(value = "/faqlist.action", method = RequestMethod.GET)
	public String reportList(Model model)
	{
		IFaqviewDAO dao = sqlSession.getMapper(IFaqviewDAO.class);
		
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/view/FaqListNode.jsp";
	}
	
	// 생성
	// 1. 입력 버튼을 누르면 작성 폼으로 가는 것
	/*
	 // 생성하는 생성폼페이지로 보내기
	@RequestMapping(value = "/writenotice.action", method = RequestMethod.GET)
	public String writeNotice(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		return "WEB-INF/view/WriteNotice.jsp";
	}
	 */
	
	// 자주 묻는 게시판 생성 페이지로 보내기
	@RequestMapping(value = "/faqinsertform.action", method = RequestMethod.GET)
	public String FaqRunInsertform(Model model)
	{
		IFaqRunDAO dao = sqlSession.getMapper(IFaqRunDAO.class);
		
		return "WEB-INF/view/WriteFAQ.jsp";
	}

	// 자주 묻는 게시판 입력 기능 수행
	// 로그인 세션에서 관리자 아이디 받아와서, 추가하기 수정
	@RequestMapping(value= "/faqinsert.action", method = RequestMethod.POST)
	public String FaqInsert(FaqRunDTO n, HttpSession session)
	{
		/*
		// 관리자 아이디 세션에서 받아와서 추가
		AdminDTO admin = (AdminDTO)session.getAttribute("adminLogin");
		String ad_id = admin.getAd_Id();
		n.setAd_id(ad_id);
		*/
		
		// 관리자 아이디 세션에서 받아와서 추가
		AdminDTO admin = (AdminDTO)session.getAttribute("adminLogin");
		String ad_id = admin.getAd_Id();
		n.setAd_id(ad_id);
		
		
		IFaqRunDAO dao = sqlSession.getMapper(IFaqRunDAO.class);
		
		dao.add(n);
		
		return "redirect:faqlist.action";
	}
	
	// 자주 묻는 질문 게시판 수정 페이지로 보내기
	@RequestMapping(value = "/faqupdateform.action", method = RequestMethod.GET)
	public String faqUpdateform(@RequestParam("faq_no") int faq_no, Model model)
	{
		IFaqviewDAO dao = sqlSession.getMapper(IFaqviewDAO.class);
		
		model.addAttribute("view", dao.view(faq_no));
		
		return "WEB-INF/view/UpdateFAQ.jsp";
	}
	
	// 자주 묻는 질문 게시물 수정하기
	@RequestMapping(value = "/faqupdate.action", method = RequestMethod.POST)
	public String faqUpdate(FaqRunDTO n)
	{
		IFaqRunDAO dao = sqlSession.getMapper(IFaqRunDAO.class);
		
		dao.modify(n);
		
		return "redirect:faqlist.action";
	}
	
	
	// 자주 묻는 질문 게시물 삭제하기
	@RequestMapping(value = "/faqdelete.action", method = RequestMethod.GET)
	public String faqDelete(FaqRunDTO n)
	{
		IFaqRunDAO dao = sqlSession.getMapper(IFaqRunDAO.class);
		
		dao.remove(n);
		
		return "redirect:faqlist.action";
	}
	
}













