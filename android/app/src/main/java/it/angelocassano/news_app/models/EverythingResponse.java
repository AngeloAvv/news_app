package it.angelocassano.news_app.models;

import it.angelocassano.news_app.Pigeon;
import com.google.gson.annotations.SerializedName;

import java.util.List;

public class EverythingResponse {

    @SerializedName("status")
    private String status;
    @SerializedName("totalResults")
    private int totalResults;
    @SerializedName("articles")
    private List<Pigeon.Article> articles;

    public EverythingResponse(String status, int totalResults, List<Pigeon.Article> articles) {
        this.status = status;
        this.totalResults = totalResults;
        this.articles = articles;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalResults() {
        return totalResults;
    }

    public void setTotalResults(int totalResults) {
        this.totalResults = totalResults;
    }

    public List<Pigeon.Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Pigeon.Article> articles) {
        this.articles = articles;
    }
}
