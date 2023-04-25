record Wave {
  x : Number,
  y : Number,
  t : Number
}

component WaveView {
  property t : Number
  property wave : Wave

  fun render : Html {
    <circle
      cx={Number.toString(wave.x)}
      cy={Number.toString(wave.y)}
      r={Number.toString(t - wave.t + 10)}
      fill="none"
      stroke="white"
      stroke-width="2"/>
  }
}
