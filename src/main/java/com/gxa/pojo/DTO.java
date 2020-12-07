package com.gxa.pojo;

/*dao传输给dao的json对象*/
public class DTO {
    private String code;
    private String msg;
    private Object data;

    public DTO() {
    }

    public DTO(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public DTO(String code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "DTO{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
