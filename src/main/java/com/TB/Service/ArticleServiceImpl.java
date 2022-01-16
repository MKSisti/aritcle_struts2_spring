package com.TB.Service;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.TB.DAO.IArticleDAO;
import com.TB.entities.Article;

@Transactional
public class ArticleServiceImpl implements IArticleService {
	
	private IArticleDAO dao;

	public void setDao(IArticleDAO dao) {
		this.dao = dao;
	}


	public void addArticle(Article a) {
		dao.save(a);
	}


	public List<Article> listArticles() {
		return dao.findAll();
	}


	public Article getArticle(int id) {
		return dao.findById(id);
	}


	public void updateArticle(Article a) {
		dao.update(a);
	}


	public void deleteArticle(int id) {
		dao.deleteById(id);
	}

}
