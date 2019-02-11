package com.kh.pmfp.common.model.vo;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	@Autowired JavaMailSender mailSender;
	
	public void SendEmail(Email email) {
		System.out.println(email);
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
			mailSender.send(msg);
		} catch (MessagingException e) {
			System.out.println("이메일 인증 오류!");
			e.printStackTrace();
		}
	}

}
