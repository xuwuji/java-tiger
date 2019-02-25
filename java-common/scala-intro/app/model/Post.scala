package model

import play.api.libs.json._

/**
  * Created by wuxu on 9/20/16.
  */

case class Post(
                 var id: Int = 0,
                 var title: String = "",
                 var time: Int = 0,
                 var author: String = "",
                 var category: String = "",
                 var comment: Int = 0,
                 var intro: String = "",
                 var content: String = ""

               )

object Post {

  implicit val postWrites = Json.writes[Post]
  implicit val postReads = Json.reads[Post]

}


