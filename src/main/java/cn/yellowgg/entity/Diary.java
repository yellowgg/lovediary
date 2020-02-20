package cn.yellowgg.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author:yellowgg
 * @Description: 日记
 * @Date: Created in 19-3-31 下午7:23
 */
@Data
public class Diary {
    private String diaryid;

    private String categoryid;

    private String daytime;

    private String diarycontent;

    private String diarytitle;

    private String diarysubtitle;

    private Date createtime;

    public Diary() {
    }

    public Diary(String diaryId) {
        this.diaryid = diaryId;
    }
}