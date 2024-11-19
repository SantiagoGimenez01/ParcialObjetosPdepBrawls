class Personaje{
  var property copas

  method destreza()
  method tienenEstrategia()
  method realizar(mision) = mision.serRealizadaPor(self)
  method aumentarCopas(copasGanadas){ copas += copasGanadas }
  method perderCopas(copasPerdidas){ copas -= copasPerdidas }
}

class Arquero inherits Personaje{
  const agilidad
  const rango

  override method destreza() = agilidad * rango
  override method tienenEstrategia() = rango > 100
}

class Guerrera inherits Personaje{
  const fuerza
  const estrategia = false

  override method destreza() = fuerza * 1.5
  override method tienenEstrategia() = estrategia
}

class Ballestero inherits Arquero{
  override method destreza() = super() * 2
}

class Equipo{
  const property miembros = []
  method realizar(mision) = mision.serRealizadaPor(self)
  method aumentarCopas(copasGanadas){
    miembros.forEach({personaje => personaje.aumentarCopas(copasGanadas)})
  }

  method perderCopas(copasPerdidas){
    miembros.forEach({personaje => personaje.perderCopas(copasPerdidas)})
  }
}