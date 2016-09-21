package dao

import model.Post

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, Map}

/**
  * Created by wuxu on 9/21/16.
  */
object PostDao {

  var p1 = new Post()
  p1.title = "test1"
  p1.category = "c1"
  var p2 = new Post()
  p2.title = "test2"
  p2.category = "c2"
  var p3 = new Post()
  p3.title = "test3"
  p3.category = "c1"
  var p4 = new Post()
  p4.title = "test4"
  p4.category = "c2"
  var p5 = new Post()
  p5.title = "test5"
  p5.category = "c5"
  val posts = List(p1, p2, p3, p4, p5)

  def getAllPost(): List[Post] = {
    return posts
  }

  def getAllCategories(): ArrayBuffer[String] = {
    var count: Map[String, Int] = Map()
    posts.foreach(
      p => {
        var category = p.category
        if (!count.contains(category)) {
          count += (category -> 1)
        } else {
          var num = count(category) + 1
          count += (category -> num)
        }
      }
    )

    count = mutable.ListMap(count.toSeq.sortBy(_._2): _*)

    var result: ArrayBuffer[String] = new ArrayBuffer(2)
    count.foreach(
      c => {
        result.append(c._1)
      }
    )
    result slice(0, 1)
  }

}
