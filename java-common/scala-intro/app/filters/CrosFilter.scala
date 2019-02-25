package filters

import akka.stream.Materializer
import javax.inject._

import akka.actor.FSM.->
import play.api.http.HeaderNames._
import play.api.mvc.Results._
import play.api.mvc._

import scala.concurrent.{ExecutionContext, Future}

/**
  * This is a simple filter that adds a header to all requests. It's
  * added to the application's list of filters by the
  * [[Filters]] class.
  *
  * @param mat  This object is needed to handle streaming of requests
  *             and responses.
  * @param exec This class is needed to execute code asynchronously.
  *             It is used below by the `map` method.
  */
@Singleton
class CrosFilter @Inject()(
                               implicit override val mat: Materializer,
                               exec: ExecutionContext) extends Filter {

  override def apply(nextFilter: RequestHeader => Future[Result])
                    (request: RequestHeader): Future[Result] = {
    val origin = request.headers.get(ORIGIN).getOrElse("*")

    if (request.method == "OPTIONS") {
      val response = Ok.withHeaders(
        ACCESS_CONTROL_ALLOW_ORIGIN -> origin,
        ACCESS_CONTROL_ALLOW_METHODS -> "POST, GET, OPTIONS, PUT, DELETE",
        ACCESS_CONTROL_MAX_AGE -> "3600",
        ACCESS_CONTROL_ALLOW_HEADERS -> s"$ORIGIN, X-Requested-With, $CONTENT_TYPE, $ACCEPT, $AUTHORIZATION, X-Auth-Token",
        ACCESS_CONTROL_ALLOW_CREDENTIALS -> "true"
      )
      Future.successful(response)
    }

    // Run the next filter in the chain. This will call other filters
    // and eventually call the action. Take the result and modify it
    // by adding a new header.
    else {
      nextFilter(request).map {
        result => result.withHeaders(
          ACCESS_CONTROL_ALLOW_ORIGIN -> origin,
          ACCESS_CONTROL_ALLOW_CREDENTIALS -> "true"
        )
      }
    }

  }

}
