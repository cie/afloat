component Viewport {
  style viewport {
    background: #2a83e2;
  }

  connect Clock exposing { t }

  use Provider.AnimationFrame {
    frames:
      (ms : Number) : Promise(Void) {
        Clock.tick(ms)
        next { }
      }
  }

  fun render : Html {
    <svg::viewport onMouseDown={handleMouseDown}>
      <SeaView t={t}/>
    </svg>
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
