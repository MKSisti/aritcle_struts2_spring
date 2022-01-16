package com.TB.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.TB.entities.Article;

public class ArticleDaoImpl implements IArticleDAO {
	@PersistenceContext
	private EntityManager em ;


	public void save(Article a) {
		em.persist(a);
	}

	public List<Article> findAll() {
		Query query = em.createQuery("select a from Article a");
		return query.getResultList();
	}

	public Article findById(int id) {
		return em.find(Article.class, id);
	}

	public void update(Article a) {
		em.merge(a);
	}

	public void deleteById(int id) {
		em.remove(findById(id));
	}

}
