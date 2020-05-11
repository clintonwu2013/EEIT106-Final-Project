package model.tsunglin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;



/**
 * 
 * QQ(mail.qq.com):POP3伺服器（埠995）SMTP伺服器（埠465或587）。
 * 
 */
public class SendEmail {
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		String sendUserName = "clintonwu2013@gmail.com";
		String sendPassword = "yavgohihafmiigbv";
		Properties properties = new Properties();
		properties.setProperty("mail.smtp.auth", "true");// 伺服器需要認證
		properties.setProperty("mail.transport.protocol", "smtp");// 宣告傳送郵件使用的埠
		properties.setProperty("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getInstance(properties);
		session.setDebug(true);// 同意在當前執行緒的控制檯列印與伺服器對話資訊
		Message message = new MimeMessage(session);// 構建傳送的資訊
		message.setSubject("您好");
		
//		File file = new File("D:\\1.jpg");
//		FileInputStream is =new FileInputStream(file);
//		byte[] data =new byte[(int) file.length()];
//		is.read(data, 0, data.length);
		
//		String body = "<h4>內含附件、圖文並茂的郵件測試！！！</h4> </br>" ;
//		MimeBodyPart attachment01 = SendEmail.createContent(body, data); 
//		MimeMultipart allPart = new MimeMultipart("mixed"); 
//		allPart.addBodyPart(attachment01); 
		
		//message.setContent(allPart);
		//message.saveChanges(); 
		message.setText("你好，我是吳宗霖");// 資訊內容
		message.setFrom(new InternetAddress("clintonwu2013@gmail.com"));// 發件人
		
		
		Transport transport = session.getTransport();
		transport.connect("smtp.gmail.com", 587, sendUserName, sendPassword);// 連線發件人使用發件的伺服器
		transport.sendMessage(message, new Address[] { new InternetAddress("clintonwu2001@yahoo.com.tw") });// 接受郵件
		transport.close();
	}

	public static MimeBodyPart createContent(String body, String fileName) 
			throws Exception { 
			// 用於儲存最終正文部分 
			MimeBodyPart contentBody = new MimeBodyPart(); 
			// 用於組合文字和圖片，"related"型的MimeMultipart物件 
			MimeMultipart contentMulti = new MimeMultipart("related"); 
			// 正文的文字部分 
			MimeBodyPart textBody = new MimeBodyPart(); 
			textBody.setContent(body, "text/html;charset=utf-8"); 
			contentMulti.addBodyPart(textBody); 
			// 正文的圖片部分 
			MimeBodyPart jpgBody = new MimeBodyPart(); 
			FileDataSource fds = new FileDataSource(fileName); 
			jpgBody.setDataHandler(new DataHandler(fds)); 
			jpgBody.setFileName("貓咪.jpg");
			jpgBody.setContentID("logo_jpg"); 
			contentMulti.addBodyPart(jpgBody); 
			// 將上面"related"型的 MimeMultipart 物件作為郵件的正文 
			contentBody.setContent(contentMulti); 
			return contentBody; 
			} 
	
	public static MimeBodyPart createContent(String body, byte[] bytearray) 
			throws Exception { 
			// 用於儲存最終正文部分 
			MimeBodyPart contentBody = new MimeBodyPart(); 
			// 用於組合文字和圖片，"related"型的MimeMultipart物件 
			MimeMultipart contentMulti = new MimeMultipart("related"); 
			// 正文的文字部分 
			MimeBodyPart textBody = new MimeBodyPart(); 
			textBody.setContent(body, "text/html;charset=utf-8"); 
			contentMulti.addBodyPart(textBody); 
			// 正文的圖片部分 
			MimeBodyPart jpgBody = new MimeBodyPart(); 
			
			ByteArrayDataSource bds = new ByteArrayDataSource(bytearray, "image/jpg"); 
			jpgBody.setDataHandler(new DataHandler(bds)); 
			
			
			jpgBody.setFileName("貓咪.jpg");
			jpgBody.setContentID("logo_jpg"); 
			contentMulti.addBodyPart(jpgBody); 
			// 將上面"related"型的 MimeMultipart 物件作為郵件的正文 
			contentBody.setContent(contentMulti); 
			return contentBody; 
			} 
	
	public static MimeBodyPart createAttachment(String fileName) throws Exception { 
		MimeBodyPart attachmentPart = new MimeBodyPart(); 
		FileDataSource fds = new FileDataSource(fileName); 
		attachmentPart.setDataHandler(new DataHandler(fds)); 
		attachmentPart.setFileName(fds.getName()); 
		return attachmentPart; 
		} 
}