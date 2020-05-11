package model.tsunglin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.POJO.Chat;
import model.POJO.Member;
import model.tsunglin.dao.ChatDAO;
/**
 * 由客户端触发，并接受服务器发送信息的例子
 */
@Controller
public class ChatController {
	@Autowired
	ChatDAO chatDAO;
	@RequestMapping(value = "/websocket", method = { RequestMethod.GET })
	public String toHello() {
		System.out.println("messageController ----> tohello()");
		return "websocket";  //定位到页面
	}

	@MessageMapping("/greeting")
	@SendTo("/topic/greetings")
	public String greeting(Map<String, Object> message) throws Exception {
	
		System.out.println("MessageController====================================>客户端连接");
		chatDAO.insert((String)message.get("sender"), (String)message.get("reciever"),(String) message.get("message"));
		return  message.get("senderName")+":" +message.get("message")+"";
		
		
	}
	@RequestMapping(path= {"/findChats"})
	public String findByEmail(String sender, String reciever, Model model) {
		System.out.println(sender);
		System.out.println(reciever);
		List<Chat> rs = chatDAO.findByEmail(sender, reciever);
		
		model.addAttribute("reciever", reciever);
		model.addAttribute("chats", rs);
		return "backstageChat";
		
	}
}