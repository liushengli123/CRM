package com.gxa.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class Teacher {

  private Integer id;
  private String teacherName;
  private Integer teacherAge;
  private Integer teacherGender;
  private Integer courseId;
  private Integer status;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:sss",locale ="zh",timezone = "GMT+8")
  private Timestamp updateTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:sss",locale ="zh",timezone = "GMT+8")
  private Timestamp createTime;
  private Integer isDeleted;

  private Course course;

  public Course getCourse() {
    return course;
  }

  public void setCourse(Course course) {
    this.course = course;
  }

  public Teacher() {
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getTeacherName() {
    return teacherName;
  }

  public void setTeacherName(String teacherName) {
    this.teacherName = teacherName;
  }


  public Integer getTeacherAge() {
    return teacherAge;
  }

  public void setTeacherAge(Integer teacherAge) {
    this.teacherAge = teacherAge;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Integer getTeacherGender() {
    return teacherGender;
  }

  public void setTeacherGender(Integer teacherGender) {
    this.teacherGender = teacherGender;
  }


  public Integer getCourseId() {
    return courseId;
  }

  public void setCourseId(Integer courseId) {
    this.courseId = courseId;
  }


  public Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Timestamp updateTime) {
    this.updateTime = updateTime;
  }


  public Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Timestamp createTime) {
    this.createTime = createTime;
  }


  public Integer getIsDeleted() {
    return isDeleted;
  }

  public void setIsDeleted(Integer isDeleted) {
    this.isDeleted = isDeleted;
  }

  @Override
  public String toString() {
    return "Teacher{" +
            "id=" + id +
            ", teacherName='" + teacherName + '\'' +
            ", teacherAge=" + teacherAge +
            ", teacherGender=" + teacherGender +
            ", courseId=" + courseId +
            ", status=" + status +
            ", updateTime=" + updateTime +
            ", createTime=" + createTime +
            ", isDeleted=" + isDeleted +
            ", course=" + course +
            '}';
  }
}
