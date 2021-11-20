package com.pixel.ticket_scene.server.DTO;

public class MovieDTO {

    private String koTitle;
    private String enTitle;
    private String code;
    private String openDt;
    private String[] genre;


    public String getKoTitle() {
        return koTitle;
    }

    public String getEnTitle() {
        return enTitle;
    }

    public String getCode() {
        return code;
    }
    // 개봉일 이름(ko, en) 포스터 키워드(장르)

    @Override
    public String toString() {
        return "SearchParamVO{"
                + "username='"
                + username
                + '\''
                + ", email='"
                + email
                + '\''
                + ", page="
                + page
                + '}';
    }

}
