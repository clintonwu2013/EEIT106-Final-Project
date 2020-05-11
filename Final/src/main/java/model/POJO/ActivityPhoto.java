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
 * ActivityPhoto generated by hbm2java
 */
@Entity
@Table(name = "activityPhoto", schema = "dbo", catalog = "final")
public class ActivityPhoto implements java.io.Serializable {

	private Integer activityPhotoNo;
	private Activity activity;
	private byte[] photo;

	public ActivityPhoto() {
	}

	public ActivityPhoto(Activity activity, byte[] photo) {
		this.activity = activity;
		this.photo = photo;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "activityPhotoNo", unique = true, nullable = false)
	public Integer getActivityPhotoNo() {
		return this.activityPhotoNo;
	}

	public void setActivityPhotoNo(Integer activityPhotoNo) {
		this.activityPhotoNo = activityPhotoNo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "aId")
	public Activity getActivity() {
		return this.activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	@Column(name = "photo")
	public byte[] getPhoto() {
		return this.photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

}
