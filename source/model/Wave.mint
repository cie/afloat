record Wave {
  x : Number,
  y : Number,
  t : Number
}

module Wave {
  fun draw(wave: Wave) : Drawing {
    Drawing.each([
      Drawing.circle(wave.x, wave.y, Math.abs(Clock.t - wave.t + 3))
        |> Drawing.stroke(`"rgba(255,255,255,0.7)"`, 3),
      Drawing.circle(wave.x, wave.y, Math.abs(Clock.t - wave.t))
        |> Drawing.stroke(`"rgba(255,255,255,0.5)"`, 3),
      Drawing.circle(wave.x, wave.y, Math.abs(Clock.t - wave.t - 3))
        |> Drawing.stroke(`"rgba(255,255,255,0.3)"`, 3)
    ])
  }
}
