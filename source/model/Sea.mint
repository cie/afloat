store Sea {
  state waves =
    [
      {
        x: 30,
        y: 30,
        t: 2
      }
    ] of Wave

  fun addWave (wave : Wave) {
    next
      {
        waves:
          waves
          |> Array.push(wave)
      }
  }
}

component SeaView {
  property t : Number

  fun render {
    <{
      Sea.waves
      |> Array.map(
        (wave : Wave) : Html {
          <WaveView
            wave={wave}
            t={t}/>
        })
    }>
  }
}
