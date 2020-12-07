package com.gxa.pojo;


import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;

import java.sql.Timestamp;

public class Admin {

  private Long id;
  @ExcelProperty(index = 0)
  private String name;
  @ExcelProperty(index = 1)
  private String pwd;
  private Integer isDeleted;
  private Timestamp lastLoginTime;
  @ExcelProperty(index = 2)
  @DateTimeFormat("yyyy-MM-dd HH:mm:ss")
  private String createTime;
  private Timestamp updateTime;

  public Admin() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }


  public Integer getIsDeleted() {
    return isDeleted;
  }

  public void setIsDeleted(Integer isDeleted) {
    this.isDeleted = isDeleted;
  }


  public Timestamp getLastLoginTime() {
    return lastLoginTime;
  }

  public void setLastLoginTime(Timestamp lastLoginTime) {
    this.lastLoginTime = lastLoginTime;
  }


  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }


  public Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Timestamp updateTime) {
    this.updateTime = updateTime;
  }

  @Override
  public String toString() {
    return "Admin{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", pwd='" + pwd + '\'' +
            ", isDeleted=" + isDeleted +
            ", lastLoginTime=" + lastLoginTime +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            '}';
  }
}
