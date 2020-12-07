package com.gxa.pojo;


import java.sql.Timestamp;

public class ClassRoom {

  private Integer id;
  private String num;
  private Integer volume;
  private Integer status;
  private Integer isDeleted;
  private Timestamp createTime;
  private Timestamp updateTime;

  public ClassRoom() {
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }


  public Integer getVolume() {
    return volume;
  }

  public void setVolume(Integer volume) {
    this.volume = volume;
  }


  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
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
    return "ClassRoom{" +
            "id=" + id +
            ", num='" + num + '\'' +
            ", volume=" + volume +
            ", status=" + status +
            ", isDeleted=" + isDeleted +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            '}';
  }
}
