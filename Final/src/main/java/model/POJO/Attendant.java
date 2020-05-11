package model.POJO;
// Generated 2019�~5��13�� �U��12:01:30 by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Attendant generated by hbm2java
 */
@Entity
@Table(name = "attendant", schema = "dbo", catalog = "final")
public class Attendant implements java.io.Serializable {

	private Integer attendantId;
	private Activity activity;
	private Member member;
	private String phone;
	private Integer companion;
	private String status;
	private String attendency;

	public Attendant() {
	}

	public Attendant(Activity activity, Member member, String phone, Integer companion, String status,
			String attendency) {
		this.activity = activity;
		this.member = member;
		this.phone = phone;
		this.companion = companion;
		this.status = status;
		this.attendency = attendency;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "attendantId", unique = true, nullable = false)
	public Integer getAttendantId() {
		return this.attendantId;
	}

	public void setAttendantId(Integer attendantId) {
		this.attendantId = attendantId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "aId")
	public Activity getActivity() {
		return this.activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "email")
	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "companion")
	public Integer getCompanion() {
		return this.companion;
	}

	public void setCompanion(Integer companion) {
		this.companion = companion;
	}

	@Column(name = "status", length = 10)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "attendency", length = 10)
	public String getAttendency() {
		return this.attendency;
	}

	public void setAttendency(String attendency) {
		this.attendency = attendency;
	}

}
