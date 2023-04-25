component Viewport {
  style viewport {
    background: #2a83e2;
  }

  connect Clock exposing { t }

  use Provider.AnimationFrame {
    frames:
      (ms : Number) : Promise(Void) {
        Clock.tick(ms)
        Sea.update()
        Sea.draw() |> Drawing.onto(viewport)
        next { }
      }
  }

  fun render : Html {
    <canvas::viewport as viewport
      width="800"
      height="600"
       onMouseDown={handleMouseDown}>
    </canvas>
  }

  fun handleMouseDown (e : Html.Event) {
    Sea.addWave({
      x: e.clientX,
      y: e.clientY,
      t: Clock.t
    })

    next { }
  }
}
