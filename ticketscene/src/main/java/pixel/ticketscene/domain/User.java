package pixel.ticketscene.domain;

import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

public class User {
    private AtomicLong id;  // 유저 식별 id
    private String name;    // 닉네임
    private String email;   // 로그인 시 id 역할을 하는 email
    private List<AtomicLong> friends;   // user 친구 리스트
    private List<AtomicLong> tickets;   // user 티켓 리스트

    public AtomicLong getId() {
        return id;
    }
    public void setId(AtomicLong id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<AtomicLong> getFriends() {
        return friends;
    }

    public void setFriends(List<AtomicLong> friends) {
        this.friends = friends;
    }

    public List<AtomicLong> getTickets() {
        return tickets;
    }

    public void setTickets(List<AtomicLong> tickets) {
        this.tickets = tickets;
    }
}
