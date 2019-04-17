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
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.ArticleDao;
import com.xuwuji.eshop.db.dao.CategoryDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.dao.SearchHistoryDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.db.dao.ViewHistoryDao;
import com.xuwuji.eshop.model.Article;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SearchHistory;
import com.xuwuji.eshop.model.SortEnum;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserState;
import com.xuwuji.eshop.model.ViewHistory;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.HttpUtil;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ViewHistoryDao viewHistoryDao;
	@Autowired
	private SearchHistoryDao searchHistoryDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/article");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String referProductId = request.getParameter("referProductId");
		String text = request.getParameter("text");
		String tags = request.getParameter("tags");
		// String imgs = request.getParameter("imgs");
		String typeId = request.getParameter("typeId");
		// String mainImgUrl = request.getParameter("mainImgUrl");
		String announceStyle = request.getParameter("announceStyle");
		Article article = new Article();
		article.setTitle(title);
		article.setReferProductId(referProductId);
		// article.setImgs(imgs);
		article.setTags(tags);
		article.setText(text);
		article.setTypeId(typeId);
		// article.setMainImgUrl(mainImgUrl);
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
		String mainImgUrl = request.getParameter("mainImgUrl");
		String announceStyle = request.getParameter("announceStyle");
		Article article = new Article();
		article.setTitle(title);
		article.setReferProductId(referProductId);
		article.setImgs(imgs);
		article.setTags(tags);
		article.setText(text);
		article.setMainImgUrl(mainImgUrl);
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
		String articleImgBase = eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_IMG_BASE);
		if (list.size() == 1) {
			Article article = list.get(0);
			article.setMainImgUrl(articleImgBase + id + "-0.jpg");
			List<String> imgUrls = new ArrayList<String>();
			for (int i = 1; i < 5; i++) {
				String swipeImgUrl = articleImgBase + id + "-" + i + ".jpg";
				if (HttpUtil.checkValid(swipeImgUrl)) {
					imgUrls.add(swipeImgUrl);
				}
			}
			article.setImgUrlList(imgUrls);
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
		String tag = request.getParameter("tag");
		String typeId = request.getParameter("typeId");
		String title = request.getParameter("title");
		List<Article> list = new ArrayList<Article>();
		HashSet<Integer> idSet = new HashSet<Integer>();
		List<Article> temp = articleDao.getActiveAllByCondition(tag, typeId, title);
		String articleImgBase = eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_IMG_BASE);
		for (Article article : temp) {
			if (!idSet.contains(article.getId())) {
				article.setMainImgUrl(articleImgBase + article.getId() + "-0.jpg");
				// article.setImgUrlList(Arrays.asList(article.getImgs().split(";")));
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
		HashSet<Integer> idSet = new HashSet<Integer>();
		String articleImgBase = eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_IMG_BASE);
		for (String tag : tags.split(";")) {
			List<Article> temp = articleDao.getActiveAllByTags(tag);
			for (Article article : temp) {
				if (!idSet.contains(article.getId())) {
					// article.setImgUrlList(Arrays.asList(article.getImgs().split(";")));
					article.setTagList(Arrays.asList(article.getTags().split(";")));
					article.setMainImgUrl(articleImgBase + article.getId() + "-0.jpg");
					list.add(article);
					idSet.add(article.getId());
				}
			}
		}
		return list;
	}

	@RequestMapping(value = "/getGuess", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> getGuess(HttpServletRequest request, HttpServletResponse response) {
		List<Article> list = new ArrayList<Article>();
		HashSet<Integer> idSet = new HashSet<Integer>();
		String openId = request.getParameter("openId");
		User user = new User();
		user.setOpenId(openId);
		user = userDao.getByCondition(user);

		List<Category> categories = new ArrayList<Category>();
		categories = categoryDao.getRecommend();
		HashSet<String> categoryIds = new HashSet<String>();
		HashSet<String> productIds = new HashSet<String>();
		List<Article> articles = new ArrayList<Article>();
		for (Category c : categories) {
			int categoryId = c.getId();
			categoryIds.add(String.valueOf(categoryId));
		}
		// view history
		List<ViewHistory> viewHistoryList = viewHistoryDao.getAllByOpenId(openId);
		for (ViewHistory viewHistory : viewHistoryList) {
			String categoryId = viewHistory.getCategoryId();
			String productId = viewHistory.getProductId();
			categoryIds.add(categoryId);
			productIds.add(productId);
		}
		// search kw history
		List<SearchHistory> searchHistoryList = searchHistoryDao.getAllByOpenId(openId);
		for (SearchHistory searchHistory : searchHistoryList) {
			String kw = searchHistory.getKw();
			List<Product> products = new ArrayList<Product>();
			products = productDao.getActiveByKW(kw);
			for (Product product : products) {
				productIds.add(String.valueOf(product.getId()));
			}
		}

		articles = articleDao.getByRefer(productIds, categoryIds);

		List<String> preSearchArr = Arrays
				.asList(eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_PRE_SEARCH).split("/"));
		String articleImgBase = eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_IMG_BASE);
		for (String word : preSearchArr) {
			List<Article> tagTemp = articleDao.getActiveAllByCondition(word, "", "");
			// System.out.print(tagTemp.size());
			List<Article> titleTemp = articleDao.getActiveAllByCondition("", "", word);
			for (Article article : tagTemp) {
				if (!idSet.contains(article.getId())) {
					list.add(article);
					idSet.add(article.getId());
				}
			}
			for (Article article : titleTemp) {
				if (!idSet.contains(article.getId())) {
					list.add(article);
					idSet.add(article.getId());
				}
			}
		}
		for (Article article : articles) {
			list.add(article);
		}
		for (Article article : list) {
			article.setMainImgUrl(articleImgBase + article.getId() + "-0.jpg");
		}

		return list;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<Article> search(HttpServletRequest request, HttpServletResponse response) {
		String kw = request.getParameter("kw");
		List<Article> list = new ArrayList<Article>();
		HashSet<Integer> idSet = new HashSet<Integer>();
		List<Article> tagTemp = articleDao.getActiveAllByCondition(kw, "", "");
		List<Article> titleTemp = articleDao.getActiveAllByCondition("", "", kw);
		String articleImgBase = eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_IMG_BASE);
		for (Article article : tagTemp) {
			if (!idSet.contains(article.getId())) {
				list.add(article);
				idSet.add(article.getId());
			}
		}
		for (Article article : titleTemp) {
			if (!idSet.contains(article.getId())) {
				list.add(article);
				idSet.add(article.getId());
			}
		}
		for (Article article : list) {
			article.setMainImgUrl(articleImgBase + article.getId() + "-0.jpg");
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
