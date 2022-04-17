package it.angelocassano.news_app.services;

import androidx.annotation.NonNull;

import it.angelocassano.news_app.Pigeon;
import it.angelocassano.news_app.models.EverythingResponse;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class PigeonArticleApi implements Pigeon.ArticleApi {

    private final ArticleService articleService;

    public PigeonArticleApi(ArticleService articleService) {
        this.articleService = articleService;
    }

    @Override
    public void articles(Pigeon.Result<List<Pigeon.Article>> result) {
        articleService.everything().enqueue(new Callback<EverythingResponse>() {
            @Override
            public void onResponse(@NonNull Call<EverythingResponse> call, @NonNull Response<EverythingResponse> response) {
                result.success(response.body() != null ? response.body().getArticles() : null);
            }

            @Override
            public void onFailure(@NonNull Call<EverythingResponse> call, @NonNull Throwable t) {
                result.error(t);
            }
        });
    }

}
