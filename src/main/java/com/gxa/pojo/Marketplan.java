package com.gxa.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

public class Marketplan {

  private Integer id;
  @NotBlank(message = "计划的名字不能为空")
  private String planName;
  private String planDatail;
  private Integer courseId;
  private Integer teacherId;
  private Integer classRoomId;
  private Integer planStuCount;
  private Integer status;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:sss",locale ="zh",timezone = "GMT+8")
  private Timestamp planEndTime;
  private Integer isDeleted;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:sss",locale ="zh",timezone = "GMT+8")
  private Timestamp createTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:sss",locale ="zh",timezone = "GMT+8")
  private Timestamp updateTime;

  private Course course;
  private Teacher teacher;
  private ClassRoom classRoom;

  public Marketplan() {
  }

  public Integer getId() {
    return id;
  }

  public Course getCourse() {
    return course;
  }

  public void setCourse(Course course) {
    this.course = course;
  }

  public Teacher getTeacher() {
    return teacher;
  }

  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }

  public ClassRoom getClassRoom() {
    return classRoom;
  }

  public void setClassRoom(ClassRoom classRoom) {
    this.classRoom = classRoom;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getPlanName() {
    return planName;
  }

  public void setPlanName(String planName) {
    this.planName = planName;
  }


  public String getPlanDatail() {
    return planDatail;
  }

  public void setPlanDatail(String planDatail) {
    this.planDatail = planDatail;
  }


  public Integer getCourseId() {
    return courseId;
  }

  public void setCourseId(Integer courseId) {
    this.courseId = courseId;
  }


  public Integer getTeacherId() {
    return teacherId;
  }

  public void setTeacherId(Integer teacherId) {
    this.teacherId = teacherId;
  }


  public Integer getClassRoomId() {
    return classRoomId;
  }

  public void setClassRoomId(Integer classRoomId) {
    this.classRoomId = classRoomId;
  }


  public Integer getPlanStuCount() {
    return planStuCount;
  }

  public void setPlanStuCount(Integer planStuCount) {
    this.planStuCount = planStuCount;
  }


  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }


  public java.sql.Timestamp getPlanEndTime() {
    return planEndTime;
  }

  public void setPlanEndTime(java.sql.Timestamp planEndTime) {
    this.planEndTime = planEndTime;
  }


  public Integer getIsDeleted() {
    return isDeleted;
  }

  public void setIsDeleted(Integer isDeleted) {
    this.isDeleted = isDeleted;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }

  @Override
  public String toString() {
    return "Marketplan{" +
            "id=" + id +
            ", planName='" + planName + '\'' +
            ", planDatail='" + planDatail + '\'' +
            ", courseId=" + courseId +
            ", teacherId=" + teacherId +
            ", classRoomId=" + classRoomId +
            ", planStuCount=" + planStuCount +
            ", status=" + status +
            ", planEndTime=" + planEndTime +
            ", isDeleted=" + isDeleted +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            ", course=" + course +
            ", teacher=" + teacher +
            ", classRoom=" + classRoom +
            '}';
  }
}
