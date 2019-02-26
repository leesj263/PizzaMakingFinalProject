package com.kh.pmfp.customer.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.pmfp.admin.model.exception.AdminInsertException;
import com.kh.pmfp.admin.model.vo.AdminBoard;
import com.kh.pmfp.common.model.vo.CommonUtils;
import com.kh.pmfp.common.model.vo.Member;
import com.kh.pmfp.common.model.vo.PageInfo;
import com.kh.pmfp.common.model.vo.Pagination;
import com.kh.pmfp.customer.model.exception.BoardException;
import com.kh.pmfp.customer.model.service.BoardService;
import com.kh.pmfp.customer.model.vo.Board;
import com.kh.pmfp.customer.model.vo.Image;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;

	// faq나타내기
	@RequestMapping("faqOrder.bo")
	public String faqOrder(HttpServletRequest request) {
		ArrayList<Board> faqOrder = new ArrayList<Board>();

		try {
			faqOrder = bs.selectfaqOrder();
			request.setAttribute("faqOrder", faqOrder);

			return "customer/faq/faqOrder";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}

	// qna작성
	@RequestMapping("qnaWrite.bo")
	public String noticeWrite(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response,
			String category) {
		System.out.println(qna);
		System.out.println(category);
		Integer.parseInt(category);
		// 세션에서 memberNo 가져와서 넣기qna.setMemberNo(1);
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		qna.setMemberNo(loginUser.getMemberNo());
		qna.setBoardCateg(Integer.parseInt(category));

		try {
			int result = bs.insertqna(qna);
			System.out.println("작성한 qna 개수: " + result);

			return "redirect:qnaList.bo";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}
	}
	//revie댓글작성
	@RequestMapping(value="bringreviewAnswer.bo", method=RequestMethod.POST)
	public void reviewAnswerWrite(/*@ModelAttribute*/  HttpServletRequest request, HttpServletResponse response
			)throws JsonIOException, IOException {
		int writer =Integer.parseInt(request.getParameter("writer")); 
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String content = request.getParameter("content");
		
				System.out.println("컨트롤러"+writer);
				System.out.println("컨트롤러bno"+boardNo);
				System.out.println("댓글내용"+content);
				
				Board review = new Board();
				review.setMemberNo(writer);
				review.setBoardRefNo(boardNo);
				review.setBoardContent(content);
				
				
				ArrayList<Board> replyList;
				try {
					replyList = bs.insertReply(review);
					response.setContentType("application/json");
					new Gson().toJson(replyList,response.getWriter());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
	}
	@RequestMapping("reviewWrite.bo")
	public String reviewWrite(@ModelAttribute Board review, HttpServletRequest request, HttpServletResponse response, 
			@RequestParam (value="boardFile", required=false) MultipartFile boardFile) {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		review.setMemberNo(loginUser.getMemberNo());
		

		/*System.out.println(board);*/
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\customer\\images\\review";
	
		String originFileName= boardFile.getOriginalFilename();
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName= CommonUtils.getRandomString();
		
		Image image= new Image();
		image.setImgOriginname(originFileName);
		image.setImgFilepath(filePath);
		image.setImgChangename(changeName);
		System.out.println(image);
		
		try {
			boardFile.transferTo(new File(filePath+"\\"+changeName+ext));
			int result = bs.insertReview(review, image);
				if(result>0) {
					return "redirect:reviewList.bo";
				}else {
					new File(filePath+"\\"+changeName+ext).delete();	
					return "common/errorPage";
				}
			
		} catch (Exception e) {
			new File(filePath+"\\"+changeName+ext).delete();
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		} 
		
		
		
	}
	//댓글 작성
	
	/*//이미지 파일 생성
		@RequestMapping(value="/reviewImgUpload.bo")
		public @ResponseBody String reviewImgUpload(HttpServletRequest request,
				@RequestParam String img) {
	//이미지 파일 생성
			String base64Image = img.split(",")[1];//파일이름
			byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\customer\\images\\myPizza";
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String randomNum = String.format("%07d",(int)(Math.random() * 1000000));
			String fileName = ft.format(new java.util.Date(currentTime)) + randomNum + ".png";
			
			File file = new File(filePath, fileName);
			BufferedOutputStream bos = null;
			try {
				bos = new BufferedOutputStream(new FileOutputStream(file));
				
				bos.write(imageBytes);
				bos.flush();
			} catch (IOException e) {
				e.printStackTrace();
				if(file.exists()) file.delete();
				return "fileError";
			} finally {
				try {
					if(bos != null) bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			return "complete";
		}*/
	// qna수정
	@RequestMapping("qnaUpdate.bo")
	public String qnaUpdate(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response,
			String category) {
		int boardNo = Integer.parseInt(request.getParameter("num"));
//		qna= new Board();
		/*qna.setBoardCateg(Integer.parseInt(category));*/
		System.out.println("수정 넘버" + boardNo);

		// qna.setBoardCateg(Integer.parseInt(category));

		try {
			qna = bs.updateqna2(boardNo);
			
			request.setAttribute("qna", qna);
			return "customer/qna/qnaUpdate";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}
	//qna업데이트등록
	@RequestMapping("qnaUpdateC.bo")
	public String qnaUpdateC(@ModelAttribute Board qna, HttpServletRequest request, HttpServletResponse response,
			String category) {
		String title=request.getParameter("boardTitle");
		String content= request.getParameter("boardContent");
		
		qna= new Board();
		qna.setBoardTitle(title);
		qna.setBoardCateg(Integer.parseInt(category));
		qna.setBoardContent(content);
		
		
		try {
			int result= bs.qnaUpdateC(qna);
			return "customer/qna/qnaList";
		} catch (BoardException e) {
			
		request.setAttribute("msg", e.getMessage());
		return "common/errorPage";
		
		}
	}
	// review수정
		@RequestMapping("reviewUpdate.bo")
		public String reviewUpdate(@ModelAttribute Board review, HttpServletRequest request, HttpServletResponse response
				) {
			int boardNo = Integer.parseInt(request.getParameter("num"));

			System.out.println("후기수정 넘버" + boardNo);

			// qna.setBoardCateg(Integer.parseInt(category));

			try {
				review = bs.updateReview(boardNo);
				
				request.setAttribute("review", review);
				return "customer/review/reviewUpdate";
			} catch (BoardException e) {
				request.setAttribute("msg", e.getMessage());

				return "common/errorPage";
			}

		}
		//review업데이트등록
		@RequestMapping("reviewUpdateC.bo")
		public String reviewUpdateC(@ModelAttribute Board review, HttpServletRequest request, HttpServletResponse response
				) {
			String title=request.getParameter("boardTitle");
			String content= request.getParameter("boardContent");
			
			review= new Board();
			review.setBoardTitle(title);
			review.setBoardContent(content);
			
			
			try {
				int result= bs.reviewUpdateC(review);
				return "customer/review/reviewList";
			} catch (BoardException e) {
				
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
			
			}
		}
	// qna리스트
	@RequestMapping("qnaList.bo")
	public String qnaList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Board> qnaList = new ArrayList<Board>();

		try {
			int listCount = bs.selectQnaCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			qnaList = bs.selectqnaList(pi);
			request.setAttribute("qnaList", qnaList);
			request.setAttribute("pi", pi);
			System.out.println(qnaList);
			return "customer/qna/qnaList";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	//review리스트
	@RequestMapping("reviewList.bo")
	public String reviewList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Board> reviewList = new ArrayList<Board>();

		try {
			int listCount = bs.selectQnaCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			reviewList = bs.selectReviewList(pi);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pi", pi);
			System.out.println(reviewList);
			return "customer/review/reviewList";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	// qna 상세보기
	@RequestMapping(value = "qnaDetail.bo", method = RequestMethod.GET)
	public String selectQna(int num, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 번호 : " + num);
		Board qna = new Board();
		qna.setBoardNo(num);
		Board answer = new Board();

		try {
			qna = bs.selectQna(num);
			answer = bs.selectAnswer(num);

			request.setAttribute("qna", qna);
			request.setAttribute("answer", answer);
			return "customer/qna/qnaDetail";
		} catch (BoardException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	// review 상세보기
		@RequestMapping(value = "reviewDetail.bo", method = RequestMethod.GET)
		public String selectReview(int num, HttpServletRequest request, HttpServletResponse response) {
			System.out.println("게시글 번호 : " + num);
			Board review = new Board();
			review.setBoardNo(num);
			Board answer = new Board();

			try {
				review = bs.selectReview(num);
				
				//댓글 목록 불러오기
				ArrayList<Board> reply = bs.selectReviewReply(num);
				

				request.setAttribute("review", review);
				request.setAttribute("reply", reply);
				return "customer/review/reviewDetail";
				
			} catch (BoardException e) {
				request.setAttribute("msg", e.getMessage());
				return "common/errorPage";
			}

		}


	// qna 삭제용
	@RequestMapping(value = "qnaDelete.bo", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam int num, HttpServletRequest request, HttpServletResponse response)
			throws BoardException {
		int boardNo = num;
		int result = bs.deleteqna(boardNo);

		return "redirect:qnaList.bo";

	}
	//리뷰 삭제용
		@RequestMapping(value = "reviewDelete.bo", method = RequestMethod.GET)
		public String reviewDelete(@RequestParam int num, HttpServletRequest request, HttpServletResponse response)
				throws BoardException {
			int boardNo = num;
			int result = bs.deleteReview(boardNo);

			return "redirect:reviewList.bo";
		}
		//댓글 작성
		
		
	

}
