package com.TB.Service;

import java.util.List;

import com.TB.entities.Article;

public interface IArticleService {
	
	public void addArticle(Article a);
	public List<Article> listArticles();
	public Article getArticle(int id);
	public void updateArticle(Article a);
	public void deleteArticle(int id);
}
