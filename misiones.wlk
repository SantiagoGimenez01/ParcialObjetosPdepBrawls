class Mision{
    const tipo

    method controlar(algo){
        if(!tipo.cumple(algo))
            throw new DomainException(message="Misión no puede comenzar")
    }
    method serRealizadaPor(algo){
        self.controlar(algo)
        if(tipo.puedeSerSuperadaPor(algo))
            algo.aumentarCopas(tipo.copasEnJuego(algo))
        else
            algo.perderCopas(tipo.copasEnJuego(algo))
    }
}

class Individual{
    const dificultad

    method puedeSerSuperadaPor(personaje) = personaje.tienenEstrategia() || personaje.destreza() > dificultad
    method copasEnJuego(algo) = dificultad * 2
    method cumple(personaje) = personaje.copas() >= 10
}

object porEquipo{
    
    method puedeSerSuperadaPor(equipo) = equipo.miembros().count({personaje => personaje.tienenEstrategia()}) > equipo.miembros().size()/2 
                                        || equipo.miembros().all({personaje => personaje.destreza() > 400})
    method copasEnJuego(equipo) = 50 / equipo.miembros().size()
    method cumple(equipo) = equipo.miembros().sum({personaje => personaje.copas()}) >= 60
}