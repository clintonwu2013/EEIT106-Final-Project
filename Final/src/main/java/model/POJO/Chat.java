package model.POJO;
// Generated 2019�~5��13�� �U��12:01:30 by Hibernate Tools 4.3.5.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Chat generated by hbm2java
 */
@Entity
@Table(name = "chat", schema = "dbo", catalog = "final")
public class Chat implements java.io.Serializable {

	private Integer cno;
	private Member memberByEmail1;
	private Member memberByEmail2;
	private String content;
	private Date messageTime;
	private String status;

	public Chat() {
	}

	public Chat(Member memberByEmail1, Member memberByEmail2, String content, Date messageTime, String status) {
		this.memberByEmail1 = memberByEmail1;
		this.memberByEmail2 = memberByEmail2;
		this.content = content;
		this.messageTime = messageTime;
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "cNo", unique = true, nullable = false)
	public Integer getCno() {
		return this.cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "email1")
	public Member getMemberByEmail1() {
		return this.memberByEmail1;
	}

	public void setMemberByEmail1(Member memberByEmail1) {
		this.memberByEmail1 = memberByEmail1;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "email2")
	public Member getMemberByEmail2() {
		return this.memberByEmail2;
	}

	public void setMemberByEmail2(Member memberByEmail2) {
		this.memberByEmail2 = memberByEmail2;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "messageTime", length = 23)
	public Date getMessageTime() {
		return this.messageTime;
	}

	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}

	@Column(name = "status", length = 10)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}