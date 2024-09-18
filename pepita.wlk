import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
		}else if (self.esAtrapada()) {
			"pepita-silvestre.png"
		} else "pepita.png"
	}

	method esAtrapada() {
		return self.position() == silvestre.position()
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		//algo
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

}

