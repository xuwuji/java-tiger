package controllers

import javax.inject._

import dao.PostDao
import model.Post._
import play.api.mvc._
import play.api.libs.json.Json

import scala.collection.mutable.ArrayBuffer

/**
  * Created by wuxu on 9/20/16.
  */
@Singleton
class PostController @Inject() extends Controller {


  //var p1 = new Post()
  //p1.title = "test1"
  //var p2 = new Post()
  //p2.title = "test2"
  //val posts = List(p1, p2)


  def getAllPost = Action {

    Ok(Json.toJson(PostDao.getAllPost()))
  }


  def getCategories = Action {
    Ok(Json.toJson(PostDao.getAllCategories()))
  }

}
