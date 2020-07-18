package com.mycompany.spring_project_final.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class SendMailSevice {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String recipientAddress, String subject, String content) throws MessagingException {

        // prints debug info
        System.out.println("To: " + recipientAddress);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + content);

        // creates a simple e-mail object
//        SimpleMailMessage email = new SimpleMailMessage();
//        email.setTo(recipientAddress);
//        email.setSubject(subject);
//        email.setText(content);
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

        helper.setText(content, true);
        helper.setTo(recipientAddress);
        helper.setSubject(subject);
        // sends the e-mail
        mailSender.send(mimeMessage);
    }
}
