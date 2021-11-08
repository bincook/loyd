package kr.co.loyd.dto;

public class Pageable {
    private int size;
    private int page;
    private int offset;

    public int getSize() {
        return size;
    }

    public Pageable setSize(int size) {
        this.size = size;
        this.offset = size * page;
        return this;
    }

    public int getPage() {
        return page;
    }

    public Pageable setPage(int page) {
        this.page = page;
        this.offset = size * page;
        return this;
    }

    public int getOffset() {
        return this.offset;
    }

}
