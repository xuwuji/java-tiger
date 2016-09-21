package controllers

/**
  * Created by wuxu on 9/20/16.
  */
class Basic {

}


class Person{
  var age=10;
  var name="d";
}

class Student extends Person{

}



object Basic {
  def main(args: Array[String]) {
    println("hello world")

    var p=new Person();
    p.age=20;
    println(p.age)
  }
}




