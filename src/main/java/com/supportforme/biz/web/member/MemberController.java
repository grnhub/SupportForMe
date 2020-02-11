package com.supportforme.biz.web.member;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	JavaMailSender mailSender;


	@RequestMapping("/support/MemberJoinForm")
	public String MemberJoinForm() {
		return "noNav/member/memberJoinForm";
	}

	@RequestMapping("/support/MemberLoginForm")
	public String loininForm() {
		return "noNav/member/memberLoginForm";
	}

	@RequestMapping("/support/MemberTermsConfirmForm")
	public String memberTermsConfirmForm() {
		return "noNav/member/memberTermsConfirmForm";
	}

	@RequestMapping("/forme/MemberUpdateConfirmForm")
	public String memberUpdateConfirmForm(Model model,HttpSession session) {
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		if ( memberDTO == null ) {
			model.addAttribute("member", null);
		} else {
			model.addAttribute("member", memberDTO);
		}
		return "myNav/member/memberUpdateConfirmForm";
	}

	@RequestMapping("/forme/MemberDeleteConfirmForm")
	public String memberDeleteConfirmForm(Model model, HttpSession session) {
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		if ( memberDTO == null ) {
			model.addAttribute("member", null);
		} else {
			model.addAttribute("member", memberDTO);
		}
		return "myNav/member/memberDeleteConfirmForm";
	}
	
	@RequestMapping("/support/MemberFindIdForm")
	public String memberFindIdForm(Model model, HttpSession session) {
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		if ( memberDTO == null ) {
			model.addAttribute("member", null);
		} else {
			model.addAttribute("member", memberDTO);
		}
		return "noNav/member/memberFindIdForm";
	}
	
	@RequestMapping("/support/MemberFindPasswordForm")
	public String memberFindPasswordForm(Model model, HttpSession session ) {
		
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		if ( memberDTO == null ) {
			model.addAttribute("member", null);
		} else {
			model.addAttribute("member", memberDTO);
		}
		return "noNav/member/memberFindPasswordForm";
	}
	
	@RequestMapping("/support/InsertMember")
	public String insertMember(MemberDTO dto, Model model) {
		memberService.insertMember(dto);
		model.addAttribute("msg", dto.getName()+"님 회원가입을 축하드립니다.");
		model.addAttribute("url", "../support/MemberLoginForm");
		return "commons/alertRedirect";
	}

	// 수정
	@RequestMapping("/forme/UpdateMember")
	public String updateMember(Model model, MemberDTO dto, HttpSession session) {
		memberService.updateMember(dto);
		session.removeAttribute("LoginInfo");
		session.setAttribute("LoginInfo", dto);
		model.addAttribute("msg", "회원 정보가 정상 수정 되었습니다.");
		model.addAttribute("url", "../forme/MemberUpdateForm");
		return "commons/alertRedirect";
	}



	// 단건 조회
	@RequestMapping("/forme/getMember")
	public String getMember(Model model, MemberDTO dto) {
		model.addAttribute("member", memberService.getMember(dto));
		return "member/getMembers";
	}

	// 전체 조회
	@RequestMapping("/forme/getMembers")
	public String getMembers(Model model, MemberSerachDTO serachDTO) {
		model.addAttribute("member", memberService.getMembers(serachDTO));
		return "member/getMember";
	}

	@RequestMapping("/support/CheckId")
	@ResponseBody
	public int CheckId(Model model, MemberDTO dto) {
		return memberService.checkId(dto);
	}
	
	@RequestMapping("/support/CheckEmail")
	@ResponseBody
	public int CheckEmail(Model model, MemberDTO dto) {
		return memberService.checkEmail(dto);
	}

	@RequestMapping("/forme/MemberUpdateForm")
	public String memberUpdateForm(Model model, HttpSession session, HttpServletRequest request) {
		String contextPath = request.getContextPath();
		
		
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		if ( memberDTO == null ) {
			model.addAttribute("member", null);
		} else {
			model.addAttribute("member", memberDTO);
		}
		String ref = null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}

		if (ref != null) {
			if (ref.contains("/forme/MemberUpdatePassWordCheck")) {
				model.addAttribute("member", memberDTO);
				return "myNav/member/memberUpdateForm";
			} else {
				model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
			return "commons/alertRedirect";
		}
	}

	@RequestMapping("/forme/MemberUpdatePassWordCheck")
	public String memberUpdatePassWordCheck(Model model, MemberDTO dto, HttpSession session,
			HttpServletRequest request) {
		String pw = null;
		String ref = null;
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if (ref != null) {
			if (ref.contains("/forme/MemberUpdateConfirmForm")) {
				if (memberDTO != null) {
					pw = memberService.passwordCheck(memberDTO).getPassword();
				}
				if (pw != null) {
					if (pw.equals(dto.getPassword())) {
						model.addAttribute("url", "../forme/MemberUpdateForm");
						return "commons/alertRedirect";
					} else {
						model.addAttribute("msg", "비밀번호가 틀렸습니다.");
						model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", contextPath+"/forme/MemberUpdateConfirmForm");
			return "commons/alertRedirect";
		}
	}

	@RequestMapping("/forme/MemberDeletePassWordCheck")
	public String memberDeletePassWordCheck(Model model, MemberDTO dto, HttpSession session,
			HttpServletRequest request) {
		String contextPath=request.getContextPath();
		String pw = null;
		String ref = null;
		int memberDeleteCheck = 0;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if (memberDTO != null) {
			pw = memberService.passwordCheck(memberDTO).getPassword();
		}
		memberDeleteCheck = memberService.deleteMemberCheck(memberDTO);
		if (memberDeleteCheck > 0) {
			model.addAttribute("msg", "현재 진행중인 프로젝트가 있어 회원 탈퇴를 할수 없습니다.");
			model.addAttribute("url", contextPath + "/forme/MemberDeleteConfirmForm");
			return "commons/alertRedirect";
		} else {

			if (ref != null) {
				if (ref.contains("/forme/MemberDeleteConfirmForm")) {
					if (pw != null) {
						if (pw.equals(dto.getPassword())) {
							memberService.deleteMember(memberDTO);
							session.invalidate();
							model.addAttribute("msg", "정상 탈퇴 되었습니다.");
							model.addAttribute("url", contextPath + "/support/login");
							return "commons/alertRedirect";
						} else {
							model.addAttribute("msg", "비밀번호가 틀렸습니다.");
							model.addAttribute("url", contextPath + "/forme/MemberDeleteConfirmForm");
							return "commons/alertRedirect";
						}
					} else {
						model.addAttribute("url", contextPath + "/forme/MemberDeleteConfirmForm");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", contextPath + "/forme/MemberDeleteConfirmForm");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", contextPath + "/forme/MemberDeleteConfirmForm");
				return "commons/alertRedirect";
			}
		}
	}

	@RequestMapping("/support/FindId")
	public String findId(HttpServletRequest request, Model model, MemberDTO dto) {
		String contextPath = request.getContextPath();
		MemberDTO dto2 = new MemberDTO();
		dto2 = memberService.findId(dto);

		if (dto2 != null) {
			String email = dto2.getEmail();
			String userId = dto2.getUserId();

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("ad20181029@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email); // 받는사람 이메일
				messageHelper.setSubject("[중요] SupportForMe 관리자로부터"); // 메일제목은 생략이 가능하다
				messageHelper.setText("현재 사용중이신 ID는 "+userId+" 입니다."); // 메일 내용
				mailSender.send(message);
				model.addAttribute("msg", "메일이 정상적으로 발송되었습니다. 메일을 확인해 주세요 ");
				model.addAttribute("url", contextPath+"/support/MemberLoginForm");
				return "commons/alertRedirect";
				
			} catch (Exception e) {
				System.out.println(e);
				model.addAttribute("msg", "메일 전송에 실패 하였습니다. 관리자에게 문의해 주세요.");
				model.addAttribute("url", contextPath+"/support/MemberFindIdForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("msg", "입력하신 정보가 잘못되었습니다..");
			model.addAttribute("url", contextPath+"/support/MemberFindIdForm");
			return "commons/alertRedirect";
		}
	}
	
	@RequestMapping("/support/FindPassword")
	public String findPassword(HttpServletRequest request, Model model, MemberDTO dto) {
		String contextPath = request.getContextPath();
		MemberDTO dto2 = new MemberDTO();
		System.out.println(dto.getUserId()+dto.getEmail()+dto.getName());
		dto2 = memberService.findPassword(dto);

		if (dto2 != null) {
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
										  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
										  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
										  'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 
										  'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
										  'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 
										  'y', 'z' };
			
			int idx = 0; 
			StringBuffer password = new StringBuffer();
			for (int i = 0; i < 10; i++) { 
				idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
				System.out.println("idx :::: "+idx); 
				password.append(charSet[idx]); 
			}
			String pw = password.toString();
			String email = dto2.getEmail();
			String userid = dto2.getUserId();
			
			MemberDTO dto3 = new MemberDTO();
			dto3.setUserId(userid);
			dto3.setPassword(pw);
			memberService.updateRandomPassword(dto3);

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("ad20181029@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email); // 받는사람 이메일
				messageHelper.setSubject("[중요] SupportForMe 관리자로부터"); // 메일제목은 생략이 가능하다
				messageHelper.setText("비밀번호가 " + pw + "로 초기화되었습니다."); // 메일 내용
				mailSender.send(message);
				model.addAttribute("msg", "메일이 정상적으로 발송되었습니다. 메일을 확인해 주세요 ");
				model.addAttribute("url", contextPath+"/support/MemberLoginForm");
				return "commons/alertRedirect";
				
			} catch (Exception e) {
				System.out.println(e);
				model.addAttribute("msg", "메일 전송에 실패 하였습니다. 관리자에게 문의해 주세요.");
				model.addAttribute("url", contextPath+"/support/MemberFindIdForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("msg", "입력하신 정보가 잘못되었습니다..");
			model.addAttribute("url", contextPath+"/support/MemberFindIdForm");
			return "commons/alertRedirect";
		}
	}
	

}
