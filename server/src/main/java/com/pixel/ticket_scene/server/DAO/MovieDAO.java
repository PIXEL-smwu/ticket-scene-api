package com.pixel.ticket_scene.server.DAO;

public class MovieDAO {

    private String koTitle;
    private String enTitle;
    private String code;

    public String getKoTitle() {
        return koTitle;
    }

    public String getEnTitle() {
        return enTitle;
    }

    public String getCode() {
        return code;
    }

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
