package model;

public class HinhThuc {
    private int id;
    private String name;

    public HinhThuc() {
    }

    public HinhThuc(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public HinhThuc(String name) {
        this.name = name;
    }

    public HinhThuc(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
