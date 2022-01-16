package com.TB.web;

import com.TB.entities.*;
import com.google.protobuf.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.TB.DAO.ArticleDaoImpl;
import com.TB.Service.IArticleService;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport {

	/**
	 * fields setters and getters 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private IArticleService service;
	
	List<Article> articles = new ArrayList<>();
	Article a = new Article();
	int code;
	
	

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	public Article getA() {
		return a;
	}

	public void setA(Article a) {
		this.a = a;
	}

//	Actions :
	public String goToUpdate () {
		a = service.getArticle(code);
		return SUCCESS;
	}
	public String index() {
		articles = service.listArticles();
		return SUCCESS;
	}
	
	public String getAll() {
		articles = service.listArticles();
		return SUCCESS;
	}
	
	public String create() {
		if(V()) {
			return "error";
		}
		service.addArticle(a);
		return SUCCESS;
	}
	
	public String update() {
		if(V()){
			return "error";
		}
		service.updateArticle(a);
		return SUCCESS;
	}

	public String delete() {
		service.deleteArticle(code);
		return SUCCESS;
	}
//	Validation :
	public boolean V() {
		Boolean t = false;
		if(a.getName().length()<8) {
			addFieldError("a.name", "Name is required and should be at least 8 chararcters.");
			t = true;
		}
		if(a.getCount() <= 0) {
			addFieldError("a.count", "Please enter a valid count.");
			t = true;
		}
		if(a.getPrice() <= 0) {
			addFieldError("a.price", "Please enter a valid price.");
			t = true;
		}
		return t;
	}

	public void setService(IArticleService service) {
		this.service = service;
	}
}
