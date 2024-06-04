class naveEspacial{
	var velocidad = 0
	var direccion = 0
	
	method acelerar(cuanto) {
		velocidad = 100000.min(velocidad + cuanto)
//	el valor min entre 100000 y el resul = velocidad + cuanto
	//	velocidad = (velocidad + cuanto).min(100000)
	}
	method desacelerar(cuanto) { 
		velocidad = 0.max(velocidad - cuanto)
	//		    (velocidad - cuanto).max(0)
	}
	method irHaciaElSol() { direccion = 10 }
	method escaparseDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }

	method acercarseUnPocoAlSol() { direccion = 10.min(direccion + 1) }
	method alejarseUnPocoDelSol() { direccion = 10.max(direccion - 1) }
}
class naveBaliza inherits naveEspacial {
	var colorBaliza

	method cambiarColorBaliza(colorNuevo) { colorBaliza = colorNuevo }
	method prepararViaje() {
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
}
class naveDePasajeros inherits naveEspacial {
	const cantidadDePasajeros
	var racionesDeComida = 0
	var racionesDeBebida = 0

	method cargarComida(cuanto) { racionesDeComida += cuanto }
	method cargarBebida(cuanto) { racionesDeBebida += cuanto }
	method descargarComida(cuanto) { racionesDeComida = 0.max(racionesDeComida - cuanto)
	method descargarBebida(cuanto) { racionesDeBebida = 0.max(racionesDeBebida - cuanto)
	method prepararViaje() { 
		self.cargarComida( cantidadDePasajeros*4 )
		self.cargarBebida( cantidadDePasajeros*6 )
	}
}
class naveDeCombate inherits naveEspacial { 
	var estaVisible = false
	var misilesDesplegados = false
	const mensajes = []
	
	method ponerseVisible() { estaVisible = true }
	method ponerseInvisible() { estaVisible = false }
	method estaInvisible() = not estaVisible

	method desplegarMisiles() { misilesDesplegados = true }
	method replegarMisiles() { misilesDesplegados = false }
	method misilesDesplegados() = misilesDesplegados

	method emitirMensaje(mensaje) { mensajes.add( mensaje )}
	method mensajesEmitidos() = mensajes
	method primerMensajeEmitido() = mensajes.first()
	method ultimoMensajeEmitido() = mensajes.last()
	method esEscueta() = not mensajes.any( { m=>m.size()>30})
//			     mensajes.all( { m=>m.size()<=30 })
	method emitioMensaje(mensaje) = mensaje.contains(mensaje)
	method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo de Mision")
	}
}







