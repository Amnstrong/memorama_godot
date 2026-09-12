Memorama Godot 4 - Edición PlayStation 2

Un juego clásico de memoria (memorama) desarrollado desde cero utilizando Godot Engine 4 y GDScript. 


Características del Proyecto
Tablero Dinámico:Cuadrícula de 4x4 generada e instanciada por código utilizando `GridContainer`.
Lógica de Estados: Sistema de validación de pares mediante identificadores únicos (`card_id`), con bloqueos temporales para evitar clics múltiples mientras se evalúan las cartas.
Temporizadores (Timers): Uso de nodos `Timer` en GDScript para dar al jugador 1 segundo de ventana visual tras cometer un error antes de ocultar las cartas nuevamente.M
