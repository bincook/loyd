package kr.co.loyd.socket.model;

public class ChannelResponse {
    private int total;
    private int page;
    private int size;
    private Object content;
    private boolean next;
    private boolean prev;
    private int totalPage;

    public ChannelResponse() {

    }

    public ChannelResponse(int total, int page, int size, Object content) {
        this.total = total;
        this.page = page;
        this.size = size;
        this.content = content;
    }

    public int getTotalPage() {

        return totalPage;
    }

    public int getTotal() {
        return total;
    }

    public ChannelResponse setTotal(int total) {
        this.total = total;
        return this;
    }

    public int getPage() {
        return page;
    }

    public ChannelResponse setPage(int page) {
        this.page = page;
        return this;
    }

    public int getSize() {
        return size;
    }

    public ChannelResponse setSize(int size) {
        this.size = size;
        return this;
    }

    public Object getContent() {
        return content;
    }

    public ChannelResponse setContent(Object content) {
        this.content = content;
        return this;
    }

    public boolean isNext() {
        if (Math.ceil((double)this.total / this.size) - 1 > this.page) {
            this.next = true;
        } else {
            this.next = false;
        }
        return next;
    }

    public boolean isPrev() {
        if (this.page != 0)
            prev = true;
        else
            prev = false;

        return prev;
    }

}
