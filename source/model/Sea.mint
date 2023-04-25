store Sea {
  state waves = [ ] of Wave

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
          <WaveView wave={wave} />
        })
    }>
  }
}
