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
 * ViolateRecord generated by hbm2java
 */
@Entity
@Table(name = "violateRecord", schema = "dbo", catalog = "final")
public class ViolateRecord implements java.io.Serializable {

	private Integer violateRecordId;
	private Member member;
	private String content;
	private Date violateTime;

	public ViolateRecord() {
	}

	public ViolateRecord(Member member, String content, Date violateTime) {
		this.member = member;
		this.content = content;
		this.violateTime = violateTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "violateRecordId", unique = true, nullable = false)
	public Integer getViolateRecordId() {
		return this.violateRecordId;
	}

	public void setViolateRecordId(Integer violateRecordId) {
		this.violateRecordId = violateRecordId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "email")
	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "violateTime", length = 23)
	public Date getViolateTime() {
		return this.violateTime;
	}

	public void setViolateTime(Date violateTime) {
		this.violateTime = violateTime;
	}

}
