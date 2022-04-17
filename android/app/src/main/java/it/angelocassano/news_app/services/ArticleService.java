package it.angelocassano.news_app.services;

import it.angelocassano.news_app.models.EverythingResponse;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Headers;

public interface ArticleService {
    @Headers({
            "Authorization: Bearer <token>", //TODO define the token
    })
    @GET("/v2/everything?q=italy")
    Call<EverythingResponse> everything();
}
