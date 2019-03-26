package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.ArticleDao;
import com.xuwuji.eshop.model.Article;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	@Autowired
	private ArticleDao articleDao;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String referProductId = request.getParameter("referProductId");
		String text = request.getParameter("text");
		String tags = request.getParameter("tags");
		String imgs = request.getParameter("imgs");
		String typeId = request.getParameter("typeId");
		String announceStyle = request.getParameter("announceStyle");
		Article article = new Article();
		article.setTitle(title);
		article.setReferProductId(referProductId);
		article.setImgs(imgs);
		article.setTags(tags);
		article.setText(text);
		article.setTypeId(typeId);
		article.setAnnounceStyle(announceStyle);
		articleDao.add(article);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String referProductId = request.getParameter("referProductId");
		String text = request.getParameter("text");
		String tags = request.getParameter("tags");
		String imgs = request.getParameter("imgs");
		String id = request.getParameter("id");
		String typeId = request.getParameter("typeId");
		String announceStyle = request.getParameter("announceStyle");
		Article article = new Article();
		article.setTitle(title);
		article.setReferProductId(referProductId);
		article.setImgs(imgs);
		article.setTags(tags);
		article.setText(text);
		article.setId(Integer.valueOf(id));
		article.setTypeId(typeId);
		article.setAnnounceStyle(announceStyle);
		articleDao.update(article);
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	@ResponseBody
	public Article getById(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		List<Article> list = new ArrayList<Article>();
		list = articleDao.getById(id);
		if (list.size() == 1) {
			Article article = list.get(0);
			article.setImgUrlList(Arrays.asList(article.getImgs().split(";")));
			article.setTagList(Arrays.asList(article.getTags().split(";")));
			return article;
		}
		return null;
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> getAll(HttpServletRequest request, HttpServletResponse response) {
		List<Article> list = new ArrayList<Article>();
		list = articleDao.getAll();
		return list;
	}

	@RequestMapping(value = "/getActiveAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> getActiveAll(HttpServletRequest request, HttpServletResponse response) {
		List<Article> list = new ArrayList<Article>();
		list = articleDao.getActiveAll();
		return list;
	}
	
	@RequestMapping(value = "/getActiveAllByCondition", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> getActiveAllByCondition(HttpServletRequest request, HttpServletResponse response) {
		String tag=request.getParameter("tag");
		String typeId=request.getParameter("typeId");
		List<Article> list = new ArrayList<Article>();
		HashSet<Integer> idSet=new HashSet<Integer>();
		List<Article> temp = articleDao.getActiveAllByCondition(tag,typeId);
		for (Article article :temp ) {
			if(!idSet.contains(article.getId())){
				article.setImgUrlList(Arrays.asList(article.getImgs().split(";")));
				article.setTagList(Arrays.asList(article.getTags().split(";")));
				list.add(article);
				idSet.add(article.getId());
			}
		}
		return list;
	}

	@RequestMapping(value = "/getActiveAllByTags", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> getActiveAllByTags(@RequestParam("tags") String tags, HttpServletRequest request,
			HttpServletResponse response) {
		List<Article> list = new ArrayList<Article>();
		HashSet<Integer> idSet=new HashSet<Integer>();
		for (String tag : tags.split(";")) {
			List<Article> temp = articleDao.getActiveAllByTags(tag);
			for (Article article :temp ) {
				if(!idSet.contains(article.getId())){
					article.setImgUrlList(Arrays.asList(article.getImgs().split(";")));
					article.setTagList(Arrays.asList(article.getTags().split(";")));
					list.add(article);
					idSet.add(article.getId());
				}
			}
		}
		return list;
	}

	@RequestMapping(value = "/disable", method = RequestMethod.GET)
	@ResponseBody
	public void disable(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		articleDao.disable(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.GET)
	@ResponseBody
	public void reActive(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		articleDao.reActive(id);
	}

}
