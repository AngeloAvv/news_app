package it.angelocassano.news_app


import it.angelocassano.news_app.services.PigeonArticleApi
import it.angelocassano.news_app.services.ArticleService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val retrofit = Retrofit.Builder()
                .baseUrl("https://newsapi.org/")
                .addConverterFactory(GsonConverterFactory.create())
                .build()

        val service: ArticleService = retrofit.create(ArticleService::class.java)

        Pigeon.ArticleApi.setup(flutterEngine.dartExecutor.binaryMessenger, PigeonArticleApi(service))
    }
}
