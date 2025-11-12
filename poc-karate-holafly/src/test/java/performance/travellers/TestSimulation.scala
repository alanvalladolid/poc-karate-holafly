package performance 

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class UserSimulation extends Simulation {

  // 1. Define el protocolo, que reutiliza la lógica de Karate.
  val protocol = karateProtocol("travellers" -> Nil)

  // 2. Define el escenario que ejecutará tu feature de Karate.
  //    Aquí le decimos que busque el archivo '.feature'.
  val main = scenario("main").exec(karateFeature("classpath:features/travellers/getTraveller.feature"))

  // 3. Configura la simulación (la carga de usuarios).
  setUp(main.inject(rampUsers(20) during (10 seconds))).protocols(protocol)

}